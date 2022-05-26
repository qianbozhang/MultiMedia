#!/bin/bash

####################### build multimedia ####################
source ./build/set_env.sh

./build/build_base.sh

./build/build_gst.sh

./build/unset_env.sh