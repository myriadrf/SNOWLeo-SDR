/* -*- c++ -*- */

#define ZINGSDR_API

%include "gnuradio.i"			// the common stuff

//load generated python docstrings
%include "zingsdr_swig_doc.i"

%{
#include "zingsdr/source.h"
#include "zingsdr/source_sync.h"
#include "zingsdr/sink_sync.h"
%}

%include "zingsdr/source.h"
GR_SWIG_BLOCK_MAGIC2(zingsdr, source);

%include "zingsdr/source_sync.h"
GR_SWIG_BLOCK_MAGIC2(zingsdr, source_sync);

%include "zingsdr/sink_sync.h"
GR_SWIG_BLOCK_MAGIC2(zingsdr, sink_sync);
