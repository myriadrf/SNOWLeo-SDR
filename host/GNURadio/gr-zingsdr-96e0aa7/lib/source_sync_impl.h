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

#ifndef INCLUDED_ZINGSDR_SOURCE_SYNC_IMPL_H
#define INCLUDED_ZINGSDR_SOURCE_SYNC_IMPL_H

#include <zingsdr/source_sync.h>
#include <fcntl.h>
#include <pthread.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>


#define RING_BUFFER_MAXSIZE 512

namespace gr {
  namespace zingsdr {

    class source_sync_impl : public source_sync
    {
     private:
      // Nothing to declare in this block.

      std::string d_ipaddr;
      unsigned short d_port;
      unsigned int d_rx_freq;
      unsigned int d_rx_vga;
      unsigned int d_rx_lan;
      int sockfd;
      pthread_t thread_recv;
      //int pipe_fd[2];
      //unsigned char *buffer;
      //unsigned char *write_buffer;

      struct ring_buffer
      {
          unsigned char *data[RING_BUFFER_MAXSIZE];
          int front, rear;
      } *p;


      int set_freq();
      int set_gain();
      int connect_server();
      int disconnect_server();
      //int recv_sample();
        
      static void *creat_recv_thread(void *);
      void *recv_sample(void *);

     public:
      source_sync_impl(const std::string &ipaddr, int port, int rx_freq, int rx_vga, int rx_lan);
      ~source_sync_impl();

      // Where all the action really happens
      int work(int noutput_items,
	       gr_vector_const_void_star &input_items,
	       gr_vector_void_star &output_items);
    };

  } // namespace zingsdr
} // namespace gr

#endif /* INCLUDED_ZINGSDR_SOURCE_SYNC_IMPL_H */

