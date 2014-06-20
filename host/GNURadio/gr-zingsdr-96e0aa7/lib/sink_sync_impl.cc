/* -*- c++ -*- */
/* 
 * Copyright 2014 <+YOU OR YOUR COMPANY+>.
 * 
 * This is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 * 
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street,
 * Boston, MA 02110-1301, USA.
 */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <gnuradio/io_signature.h>
#include "sink_sync_impl.h"

typedef struct sockaddr SA;

#define TX_SAMPLES_NUM  2*1024*1024
#define MIN_NUM_SAMPLES 1
#define MAX_NUM_SAMPLES 8196

namespace gr {
    namespace zingsdr {

        sink_sync::sptr
            sink_sync::make(const std::string &ipaddr, int port, int tx_freq, int tx_vga, int tx_mode)
            {
                return gnuradio::get_initial_sptr
                    (new sink_sync_impl(ipaddr, port, tx_freq, tx_vga, tx_mode));
            }

        /*
         * The private constructor
         */
        sink_sync_impl::sink_sync_impl(const std::string &ipaddr, int port, int tx_freq, int tx_vga, int tx_mode)
            : gr::sync_block("sink_sync",
                    gr::io_signature::make(1, 1, sizeof(gr_complex)),
                    gr::io_signature::make(0, 0, sizeof(gr_complex)))
        {
            d_ipaddr = ipaddr;
            d_port = port;
            d_tx_vga = tx_vga;
            d_tx_freq = tx_freq;
            d_tx_mode = tx_mode;
            if(this->connect_server() < 0)
                throw std::runtime_error("zingsdr:connect server error!\n");
            this->set_freq();
            this->set_gain();
            if(pipe(pipe_fd) < 0) {
                throw std::runtime_error("zingsdr:creat pipe error!\n");
            }

            read_buffer = (unsigned char *)malloc(TX_SAMPLES_NUM);

            fcntl(pipe_fd[1], F_SETPIPE_SZ, 20*1024*1024);
            if(pthread_create(&thread_send, NULL, creat_send_thread, this) < 0)
                throw std::runtime_error("zingsdr:creat recv thread error!\n");

            int flag =  fcntl(pipe_fd[1], F_GETFL, 0);
            fcntl(pipe_fd[1], F_SETFL, flag|O_NONBLOCK);
        }

        /*
         * Our virtual destructor.
         */
        sink_sync_impl::~sink_sync_impl()
        {
            free(read_buffer);
            close(pipe_fd[0]);
            close(pipe_fd[1]);
            pthread_cancel(thread_send);

            if(this->disconnect_server() < 0)
                throw std::runtime_error("zingsdr:disconnect server error!\n");
        }

        int
            sink_sync_impl::work(int noutput_items,
                    gr_vector_const_void_star &input_items,
                    gr_vector_void_star &output_items)
            {
                const gr_complex *in = (const gr_complex *) input_items[0];
                gr_complex *out = (gr_complex *) output_items[0];

                // Do <+signal processing+>
                /********************************/
                int num_samples = 0, i = 0, nbyte = 0;
                unsigned char msg[MAX_NUM_SAMPLES * 4];

                if (noutput_items < MIN_NUM_SAMPLES)
                {
                    return(0);
                }
                else if (noutput_items > MAX_NUM_SAMPLES)
                {
                    num_samples = MAX_NUM_SAMPLES;
                }
                else
                {
                    num_samples = noutput_items;
                }
                for(i = 0; i < num_samples * 4 ; i+=4)
                {
                    (*(short *)(msg + i)) = (short)in[i/4].real();
                    (*(short *)(msg + i + 2)) = (short)in[i/4].imag();
                }

                nbyte = write(pipe_fd[1], msg, num_samples * 4);
                //#define FILE1_DEBUG
#ifdef FILE1_DEBUG
                int fd_raw = -1;
                fd_raw = open("/home/jacky/Work/gnuradio/mysdr/raw1_data.dat",
                        O_RDWR|O_CREAT|O_APPEND, 0666);
                if(fd_raw < 0)
                    printf("open file raw_data failed!\n");
                write(fd_raw, msg, num_samples * 4);
                close(fd_raw);
#endif

                // Tell runtime system how many output items we produced.
                //return noutput_items;
                return num_samples;
            }

        int sink_sync_impl::set_freq()
        {
            unsigned int cmd_buf[2]={0,0};
            d_tx_freq = d_tx_freq & 0x000000FF;
            cmd_buf[0] = 0xF0170000|(d_tx_freq<<8); /*set tx freq*/
            if(send(sockfd, cmd_buf, sizeof(cmd_buf), 0) > 0)
                return 1;
            else
                return -1;
        }
        int sink_sync_impl::set_gain()
        { 
            unsigned int cmd_buf[2]={0,0};
            d_tx_vga = d_tx_vga & 0x000000FF;
            cmd_buf[0] = 0xF0190000 | (d_tx_vga<<8); //set tx vga
            if(send(sockfd, cmd_buf, sizeof(cmd_buf), 0) > 0)
                return 1;
            else
                return -1;
        }
        int sink_sync_impl::send_sample()
        {
            unsigned int cmd_buf[2]={0,0};
            int len = 0, i = 0, nbyte = 0;
            //unsigned char msg[TX_SAMPLES_NUM];

            cmd_buf[0] = 0xF0100000|(d_tx_mode&0x000000FF); //set tx size
            cmd_buf[1] = TX_SAMPLES_NUM/1024;  
            send(sockfd, cmd_buf, sizeof(cmd_buf), 0);

            if(d_tx_mode == 0) {
                /**********************************************/
                struct sockaddr_in server_addr;
                int sockfd_file;
                usleep(100000);
                if((sockfd_file = socket(PF_INET, SOCK_STREAM, 0)) < 0)
                {
                    perror("fail to socket!");
                    return -1;
                }

                bzero(&server_addr, sizeof(server_addr));
                server_addr.sin_family = PF_INET;
                server_addr.sin_port = htons(8080);
                server_addr.sin_addr.s_addr = inet_addr(d_ipaddr.c_str());

                if(connect(sockfd_file, (SA *)&server_addr, sizeof(server_addr)) < 0)
                {
                    perror("fail to connect!");
                    return -1;
                }
                /**********************************************/
                while(1) {
                    do {
                        nbyte += read(pipe_fd[0], read_buffer + nbyte, TX_SAMPLES_NUM - nbyte);
                        //printf("sizeof read = %ld\n", nbyte);
                    }while(nbyte != TX_SAMPLES_NUM);
                    nbyte = 0;
#define FILE_DEBUG
#ifdef FILE_DEBUG
                    int fd_raw = -1;
                    fd_raw = open("/home/jacky/Work/gnuradio/mysdr/raw_data.dat",
                            O_RDWR|O_CREAT|O_APPEND, 0666);
                    if(fd_raw < 0)
                        printf("open file raw_data failed!\n");
                    write(fd_raw, read_buffer, TX_SAMPLES_NUM);
                    close(fd_raw);
#endif

                    send(sockfd_file, read_buffer, TX_SAMPLES_NUM, 0);

                    /*  cmd_buf[0] = 0xF0130000;  //start dac
                        send(sockfd, cmd_buf, sizeof(cmd_buf), 0);

                        cmd_buf[0] = 0;
                        recv(sockfd, cmd_buf, sizeof(cmd_buf), 0);
                        if((cmd_buf[0]&0x00FF0000)>>16 != 0x22)
                        throw std::runtime_error("zingsdr:dac error\n");*/

                    //cmd_buf[0] = 0xF0150000; //stop dac
                    //send(sockfd, cmd_buf, sizeof(cmd_buf), 0);
                }
            }
            else {
                do {
                    nbyte += read(pipe_fd[0], read_buffer + nbyte, TX_SAMPLES_NUM - nbyte);
                    //printf("sizeof read = %ld\n", nbyte);
                }while(nbyte != TX_SAMPLES_NUM);
                nbyte = 0;
                send(sockfd, read_buffer, TX_SAMPLES_NUM, 0);

                return NULL;
            }
        }
        void *sink_sync_impl::creat_send_thread(void *param)
        {
            pthread_detach(pthread_self());
            sink_sync_impl *pThis = (sink_sync_impl *)param;
            pThis->send_sample();
            return NULL;
        }

        int sink_sync_impl::connect_server()
        {
            struct sockaddr_in servaddr;

            if((sockfd = socket(PF_INET, SOCK_STREAM, 0)) < 0)
            {
                perror("fail to socket!");
                return -1;
            }

            bzero(&servaddr, sizeof(servaddr));
            servaddr.sin_family = PF_INET;
            servaddr.sin_port = htons(d_port);
            servaddr.sin_addr.s_addr = inet_addr(d_ipaddr.c_str());

            if(connect(sockfd, (SA *)&servaddr, sizeof(servaddr)) < 0)
            {
                perror("fail to connect!");
                return -1;
            }

            return 1;
        }
        int sink_sync_impl::disconnect_server()
        {
            unsigned int cmd_buf[2]={0,0};

            cmd_buf[0] = 0xF0160000; //disconnect
            if(send(sockfd, cmd_buf, sizeof(cmd_buf), 0) > 0)
            {
                close(sockfd);
                return 1;
            }
            else
            {
                close(sockfd);
                return -1;
            }
        }
    } /* namespace zingsdr */
} /* namespace gr */

