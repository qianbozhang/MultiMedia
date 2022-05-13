#!/bin/bash

####################### config env var ####################
ROOT=$PWD
echo "root=$ROOT"

export ROOT
export BASE_DIR=$ROOT/base
export GST_DIR=$ROOT/gstreamer
export INSTALL_DIR=$ROOT/output/usr/local
export BUILD_TEMP=$ROOT/.build_temp/

mkdir -p $INSTALL_DIR
mkdir -p $BUILD_TEMP

export CC=gcc
export CXX=g++


#force pkg-cfg only searching for cross root
export PKG_CONFIG_PATH=$INSTALL_DIR/lib/pkgconfig;
export PKG_CONFIG_LIBDIR=$PKG_CONFIG_PATH; 

