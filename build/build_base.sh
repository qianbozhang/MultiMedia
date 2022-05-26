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
mkdir -p $BUILD_TEMP/libffi-3.4.2
cd $BUILD_TEMP/libffi-3.4.2
if [ ! -f "build_ok" ]; then
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>> build libffi-3.4.2 >>>>>>>>>>>>>>>>>>>>>>>";
    CC=$CC $BASE_DIR/libffi-3.4.2/configure --prefix=$INSTALL_DIR
    make -j 8 && make install
    if [ $? -eq 0 ]; then
        touch build_ok;
        echo "libffi-3.4.2 compiled successfully, please delete \"build_ok\" file in $BUILD_TEMP/libffi-3.4.2 if you wanted rebuild.";
    else
        echo "libffi-3.4.2 compiled fail, please fixed error and retry.";
        exit 0;
    fi;
else
    echo "libffi-3.4.2 has been compiled.";
fi;

#iconv
mkdir -p $BUILD_TEMP/libiconv-1.14
cd $BUILD_TEMP/libiconv-1.14
if [ ! -f "build_ok" ]; then
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>> build libiconv-1.14 >>>>>>>>>>>>>>>>>>>>>>>";
    $BASE_DIR/libiconv-1.14/configure --prefix=$INSTALL_DIR --disable-rpath \
        CFLAGS="-fPIE -fPIE -pie -I$INSTALL_DIR/include" LDFLAGS="-fPIE -fPIE -pie"
    make -j 8 && make install
    if [ $? -eq 0 ]; then
        touch build_ok;
        echo "libiconv-1.14 compiled successfully, please delete \"build_ok\" file in $BUILD_TEMP/libiconv-1.14 if you wanted rebuild.";
    else
        echo "libiconv-1.14 compiled fail, please fixed error and retry.";
        exit 0;
    fi;
else
    echo "libiconv-1.14 has been compiled.";
fi;

#glib
mkdir -p $BUILD_TEMP/glib-2.48.0
cd $BUILD_TEMP/glib-2.48.0
if [ ! -f "build_ok" ]; then
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>> build glib-2.48.0 >>>>>>>>>>>>>>>>>>>>>>>";
    CC=$CC $BASE_DIR/glib-2.48.0/configure --prefix=$INSTALL_DIR \
        CFLAGS="-fPIE -pie -I$INSTALL_DIR/include" \
        LDFLAGS="-fPIE -pie -L$INSTALL_DIR/lib" \
        LIBS="-lz -liconv -lffi" \
        --with-pcre=internal --enable-static --enable-gtk-doc-html=no --with-libiconv=gnu \
        PKG_CONFIG_LIBDIR=$INSTALL_DIR/lib/pkgconfig
    make -j 8 && make install
    if [ $? -eq 0 ]; then
        touch build_ok;
        echo "glib-2.48.0 compiled successfully, please delete \"build_ok\" file in $BUILD_TEMP/glib-2.48.0 if you wanted rebuild.";
    else
        echo "glib-2.48.0 compiled fail, please fixed error and retry.";
        exit 0;
    fi;
else
    echo "glib-2.48.0 has been compiled.";
fi;


