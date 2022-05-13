########################### build base directory #########################
#zlib
mkdir -p $BUILD_TEMP/zlib-1.2.11
cd $BUILD_TEMP/zlib-1.2.11
if [ ! -f "build_ok" ]; then
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>> build zlib-1.2.11 >>>>>>>>>>>>>>>>>>>>>>>";
    CC=$CC $BASE_DIR/zlib-1.2.11/configure --prefix=$INSTALL_DIR
    make -j 8 && make install
    if [ $? -eq 0 ]; then
        touch build_ok;
        echo "zlib-1.2.11 compiled successfully, please delete \"build_ok\" file in $BUILD_TEMP/zlib-1.2.11 if you wanted rebuild.";
    else
        echo "zlib-1.2.11 compiled fail, please fixed error and retry.";
        exit 0;
    fi;
else
    echo "zlib-1.2.11 has been compiled.";
fi;

#ffi

#glib


