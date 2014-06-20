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
#include "source_impl.h"
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

typedef struct sockaddr SA;

namespace gr {
    namespace zingsdr {

        source::sptr
        /*    source::make()
            {
                return gnuradio::get_initial_sptr
                    (new source_impl());
            }*/
            source::make(const std::string &ipaddr, int port,
                    int rx_vga, int rx_lan)
            {
                return gnuradio::get_initial_sptr
                    (new source_impl(ipaddr, port, rx_vga, rx_lan));
            }

        /*
         * The private constructor
         */
        source_impl::source_impl(const std::string &ipaddr, int port,
                int rx_vga, int rx_lan)
            : gr::block("source",
                    gr::io_signature::make(0, 0, sizeof(gr_complex)),
                    gr::io_signature::make(1, 1, sizeof(gr_complex)))
        {
            d_ipaddr = ipaddr;
            d_port = port;
            d_rx_vga = rx_vga;
            d_rx_lan = rx_lan;
        }


        /*
         * Our virtual destructor.
         */
        source_impl::~source_impl()
        {
        }

        void
            source_impl::forecast (int noutput_items, gr_vector_int &ninput_items_required)
            {
                /* <+forecast+> e.g. ninput_items_required[0] = noutput_items */
            }

        int
            source_impl::general_work (int noutput_items,
                    gr_vector_int &ninput_items,
                    gr_vector_const_void_star &input_items,
                    gr_vector_void_star &output_items)
            {
                //const <+ITYPE*> *in = (const <+ITYPE*> *) input_items[0];
                //int *out = (int *) output_items[0];
                gr_complex *out = (gr_complex *) output_items[0];

                /********************************/
                int fd_raw = -1;
                unsigned int cmd_buf[2]={0,0};
                int sockfd, len = 0, i = 0;
                //unsigned char msg[8*1024];
                int msg[8*1024/4];
                struct sockaddr_in servaddr;
                
                fd_raw = open("/home/jacky/Work/gnuradio/mysdr/raw_data.dat",
                        O_RDWR|O_CREAT|O_APPEND, 0666);
                if(fd_raw < 0)
                    printf("open file raw_data failed!\n");
                memset(msg, 0, sizeof(msg));
                if((sockfd = socket(PF_INET, SOCK_STREAM, 0)) < 0)
                {
                    perror("fail to socket!");
                    //exit(-1);
                }

                bzero(&servaddr, sizeof(servaddr));
                servaddr.sin_family = PF_INET;
                servaddr.sin_port = htons(d_port);
                servaddr.sin_addr.s_addr = inet_addr(d_ipaddr.c_str());

                if(connect(sockfd, (SA *)&servaddr, sizeof(servaddr)) < 0)
                {
                    perror("fail to connect!");
                    //exit(-1);
                }

               /* cmd_buf[0] = 0xF0180200; //set rx freq 2412M
                send(sockfd, cmd_buf, sizeof(cmd_buf), 0);
                cmd_buf[0] = 0xF0200500; //set rx vga 5
                send(sockfd, cmd_buf, sizeof(cmd_buf), 0);*/
                cmd_buf[0] = 0xF0210001; //set test seq
                cmd_buf[1] = 0x000203E8;
                send(sockfd, cmd_buf, sizeof(cmd_buf), 0);
                cmd_buf[0] = 0xF0110000; //set rx size
                cmd_buf[1] = 0x00000008;  
                send(sockfd, cmd_buf, sizeof(cmd_buf), 0);
                cmd_buf[0] = 0xF0120000;  //start adc
                send(sockfd, cmd_buf, sizeof(cmd_buf), 0);
                do {
                    len += recv(sockfd, (unsigned char *)msg+len, 8*1024-len, 0);
                }while(len != 8*1024);
                if(len < 8*1024)
                    printf("recv error, nbyte = %d\n", len);
           
                cmd_buf[0] = 0xF0140000; //stop adc
                send(sockfd, cmd_buf, sizeof(cmd_buf), 0);
                cmd_buf[0] = 0xF0160000; //disconnect
                send(sockfd, cmd_buf, sizeof(cmd_buf), 0);

                close(sockfd);
                write(fd_raw, msg, len);
                close(fd_raw);
                for(i = 0; i < len; i+=4)
                    out[i/4] = gr_complex((*(short *)(msg + i)),(*(short *)(msg + i + 2)));
                //memcpy(out, msg, 64*1024);
                // Do <+signal processing+>
                // Tell runtime system how many input items we consumed on
                // each input stream.
                consume_each (noutput_items);

                // Tell runtime system how many output items we produced.
                return noutput_items;
            }

    } /* namespace zingsdr */
} /* namespace gr */

