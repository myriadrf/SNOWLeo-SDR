/* -*- c++ -*- */
/* 
 * Copyright 2013 <+YOU OR YOUR COMPANY+>.
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
#include "source_sync_impl.h"
#include <boost/thread/thread.hpp>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

typedef struct sockaddr SA;

#define RX_SAMPLES_NUM 8*1024
//#define RING_BUFFER_MAXSIZE 32

namespace gr {
    namespace zingsdr {

        source_sync::sptr
            source_sync::make(const std::string &ipaddr, int port, int rx_freq, 
                    int rx_vga, int rx_lan)
            {
                return gnuradio::get_initial_sptr
                    (new source_sync_impl(ipaddr, port, rx_freq, rx_vga, 
                                          rx_lan));
            }

        /*
         * The private constructor
         */
        source_sync_impl::source_sync_impl(const std::string &ipaddr, int port, 
                int rx_freq, int rx_vga, int rx_lan)
            : gr::sync_block("source_sync",
                    gr::io_signature::make(0, 0, sizeof(gr_complex)),
                    gr::io_signature::make(1, 1, sizeof(gr_complex)))
        {
            d_ipaddr = ipaddr;
            d_port = port;
            d_rx_vga = rx_vga;
            d_rx_lan = rx_lan;
            d_rx_freq = rx_freq;
            if(this->connect_server() < 0)
                throw std::runtime_error("zingsdr:connect server error!\n");
            this->set_freq();
            this->set_gain();

            p = (struct ring_buffer *)malloc(sizeof(struct ring_buffer));
            p->front = p->rear = 0;
            int i = 0;
            for(i = 0; i< RING_BUFFER_MAXSIZE; i++)
                p->data[i] = (unsigned char *)malloc(RX_SAMPLES_NUM);
            if(pthread_create(&thread_recv, NULL, creat_recv_thread, this) < 0)
                throw std::runtime_error("zingsdr:creat recv thread error!\n");

        }

        /*
         * Our virtual destructor.
         */
        source_sync_impl::~source_sync_impl()
        {
            if(this->disconnect_server() < 0)
                throw std::runtime_error("zingsdr:disconnect server error!\n");

            pthread_cancel(thread_recv);
            int i = 0;
            for(i = 0; i< RING_BUFFER_MAXSIZE; i++)
                free(p->data[i]);
            free(p);
        }

        int
            source_sync_impl::work(int noutput_items,
                    gr_vector_const_void_star &input_items,
                    gr_vector_void_star &output_items)
            {
                //const <+ITYPE+> *in = (const <+ITYPE+> *) input_items[0];
                gr_complex *out = (gr_complex *) output_items[0];

                int i = 0;
                // Do <+signal processing+>

                if(p->front == p->rear) {
                    //printf("empty\n");
                    return 0;
                }
                else {
                    p->front = (p->front + 1) % RING_BUFFER_MAXSIZE;
                    for(i = 0; i < RX_SAMPLES_NUM; i+=4)
                        out[i/4] = gr_complex((*(short *)(p->data[p->front] + i)),(*(short *)(p->data[p->front] + i + 2)));

                    // Tell runtime system how many output items we produced.
                    //return noutput_items;
                    return RX_SAMPLES_NUM/4;
                }
            }
        int source_sync_impl::set_freq()
        {
            unsigned int cmd_buf[2]={0,0};
            d_rx_freq = d_rx_freq & 0x000000FF;
            cmd_buf[0] = 0xF0180000|(d_rx_freq<<8); /*set rx freq*/
            if(send(sockfd, cmd_buf, sizeof(cmd_buf), 0) > 0)
                return 1;
            else
                return -1;
        }
        int source_sync_impl::set_gain()
        { 
            unsigned int cmd_buf[2]={0,0};
            d_rx_vga = d_rx_vga & 0x000000FF;
            d_rx_lan = d_rx_lan & 0x000000FF;
            cmd_buf[0] = 0xF0200000 | (d_rx_vga<<8)|(d_rx_lan); //set rx vga
            if(send(sockfd, cmd_buf, sizeof(cmd_buf), 0) > 0)
                return 1;
            else
                return -1;
        }
        void *source_sync_impl::recv_sample(void *)
        {
            /********************************/
            unsigned int cmd_buf[2]={0,0};
            int len = 0, i = 0;
            //unsigned char msg[RX_SAMPLES_NUM];
                    cmd_buf[0] = 0xF0110000; //set rx size
                    cmd_buf[1] = 0x00000008;  
                    send(sockfd, cmd_buf, sizeof(cmd_buf), 0);
            while(1) {
                if((p->rear + 1) % RING_BUFFER_MAXSIZE == p->front) {
                    //printf("full\n");
                    continue;
                }
                else {
                    p->rear = (p->rear + 1) % RING_BUFFER_MAXSIZE;
                    //memset(msg, 0, sizeof(msg));
                    //cmd_buf[0] = 0xF0210001; //set test seq
                    //cmd_buf[1] = 0x000303E8;
                    //send(sockfd, cmd_buf, sizeof(cmd_buf), 0);
                    cmd_buf[0] = 0xF0120000;  //start adc
                    send(sockfd, cmd_buf, sizeof(cmd_buf), 0);
                    do {
                        len += recv(sockfd, p->data[p->rear]+len, RX_SAMPLES_NUM-len, 0);
                    }while(len != RX_SAMPLES_NUM);
                    if(len < RX_SAMPLES_NUM)
                        throw std::runtime_error("zingsdr:recv error\n");
                    len = 0;

                    //cmd_buf[0] = 0xF0140000; //stop adc
                    //send(sockfd, cmd_buf, sizeof(cmd_buf), 0);
                }
            }

        }
        void *source_sync_impl::creat_recv_thread(void *param)
        {
            pthread_detach(pthread_self());
            source_sync_impl *pThis = (source_sync_impl *)param;
            pThis->recv_sample(NULL);
            return NULL;
        }

        int source_sync_impl::connect_server()
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
        int source_sync_impl::disconnect_server()
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

