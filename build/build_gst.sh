#gstreamer-1.16
mkdir -p $BUILD_TEMP/gstreamer-1.16.0
cd $BUILD_TEMP/gstreamer-1.16.0
if [ ! -f "build_ok" ]; then
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>> build gstreamer-1.16.0 >>>>>>>>>>>>>>>>>>>>>>>";
    CC=$CC $GST_DIR/gstreamer-1.16.0/configure --prefix=$INSTALL_DIR \
        --disable-rpath --disable-examples --disable-tests --disable-check \
        --with-gnu-ld --with-pkg-config-path="$INSTALL_DIR/lib/pkgconfig" \
        --libdir=$INSTALL_DIR/lib --includedir=$INSTALL_DIR/include --exec-prefix=$INSTALL_DIR \
        CFLAGS="-fPIE " LDFLAGS="-Wl,-rpath-link=$INSTALL_DIR/lib"
    make -j 8 && make install
    if [ $? -eq 0 ]; then
        touch build_ok;
        echo "gstreamer-1.16.0 compiled successfully, please delete \"build_ok\" file in $BUILD_TEMP/gstreamer-1.16.0 if you wanted rebuild.";
    else
        echo "gstreamer-1.16.0 compiled fail, please fixed error and retry.";
        exit 0;
    fi;
else
    echo "gstreamer-1.16.0 has been compiled.";
fi;

#base-1.16
mkdir -p $BUILD_TEMP/gst-plugins-base-1.16.0
cd $BUILD_TEMP/gst-plugins-base-1.16.0
if [ ! -f "build_ok" ]; then
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>> build gst-plugins-base-1.16.0 >>>>>>>>>>>>>>>>>>>>>>>";
    CC=$CC $GST_DIR/gst-plugins-base-1.16.0/configure --prefix=$INSTALL_DIR \
        --disable-rpath --disable-examples \
        --disable-x --disable-ogg --disable-xvideo  --disable-audiotestsrc --disable-videotestsrc \
        --with-pkg-config-path="$INSTALL_DIR/lib/pkgconfig" \
        CFLAGS="-fPIE -I$INSTALL_DIR/include" LIBS="-L$INSTALL_DIR/lib -lffi" \
        LDFLAGS="-Wl,-rpath-link=$INSTALL_DIR/lib"
    make -j 8 && make install
    if [ $? -eq 0 ]; then
        touch build_ok;
        echo "gst-plugins-base-1.16.0 compiled successfully, please delete \"build_ok\" file in $BUILD_TEMP/gst-plugins-base-1.16.0 if you wanted rebuild.";
    else
        echo "gst-plugins-base-1.16.0 compiled fail, please fixed error and retry.";
        exit 0;
    fi;
else
    echo "gst-plugins-base-1.16.0 has been compiled.";
fi;

#libav-1.16
mkdir -p $BUILD_TEMP/gst-libav-1.16.0
cd $BUILD_TEMP/gst-libav-1.16.0
if [ ! -f "build_ok" ]; then
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>> build gst-libav-1.16.0 >>>>>>>>>>>>>>>>>>>>>>>";
    CC=$CC $GST_DIR/gst-libav-1.16.0/configure --prefix=$INSTALL_DIR \
        --disable-rpath --enable-static \
        --with-pkg-config-path="$INSTALL_DIR/lib/pkgconfig" \
        --libdir=$INSTALL_DIR/lib --includedir=$INSTALL_DIR/include --exec-prefix=$INSTALL_DIR \
        CFLAGS="-fPIE -fpie -I$INSTALL_DIR/include" LDFLAGS="-Wl,-rpath-link=$INSTALL_DIR/lib"
    make -j 8 && make install
    if [ $? -eq 0 ]; then
        touch build_ok;
        echo "gst-libav-1.16.0 compiled successfully, please delete \"build_ok\" file in $BUILD_TEMP/gst-libav-1.16.0 if you wanted rebuild.";
    else
        echo "gst-libav-1.16.0 compiled fail, please fixed error and retry.";
        exit 0;
    fi;
else
    echo "gst-libav-1.16.0 has been compiled.";
fi;

#good-1.16
mkdir -p $BUILD_TEMP/gst-plugins-good-1.16.0
cd $BUILD_TEMP/gst-plugins-good-1.16.0
if [ ! -f "build_ok" ]; then
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>> build gst-plugins-good-1.16.0 >>>>>>>>>>>>>>>>>>>>>>>";
    CC=$CC $GST_DIR/gst-plugins-good-1.16.0/configure --prefix=$INSTALL_DIR \
        --disable-gst_v4l2 \
        --disable-rpath LIBS="-L$INSTALL_DIR/lib -lffi" \
        --with-pkg-config-path="$INSTALL_DIR/lib/pkgconfig" \
        CFLAGS="-fPIC -I$INSTALL_DIR/include" LDFLAGS="-Wl,-rpath-link=$INSTALL_DIR/lib"
    make -j 8 && make install
    if [ $? -eq 0 ]; then
        touch build_ok;
        echo "gst-plugins-good-1.16.0 compiled successfully, please delete \"build_ok\" file in $BUILD_TEMP/gst-plugins-good-1.16.0 if you wanted rebuild.";
    else
        echo "gst-plugins-good-1.16.0 compiled fail, please fixed error and retry.";
        exit 0;
    fi;
else
    echo "gst-plugins-good-1.16.0 has been compiled.";
fi;

#bad-1.16
mkdir -p $BUILD_TEMP/gst-plugins-bad-1.16.0
cd $BUILD_TEMP/gst-plugins-bad-1.16.0
if [ ! -f "build_ok" ]; then
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>> build gst-plugins-bad-1.16.0 >>>>>>>>>>>>>>>>>>>>>>>";
    CC=$CC $GST_DIR/gst-plugins-bad-1.16.0/configure --prefix=$INSTALL_DIR \
        --disable-rpath LIBS="-L$INSTALL_DIR/lib " \
        --with-pkg-config-path="$INSTALL_DIR/lib/pkgconfig" \
        CFLAGS="-fPIE -fpie -I$INSTALL_DIR/include" LDFLAGS="-Wl,-rpath-link=$INSTALL_DIR/lib"
    make -j 8 && make install
    if [ $? -eq 0 ]; then
        touch build_ok;
        echo "gst-plugins-bad-1.16.0 compiled successfully, please delete \"build_ok\" file in $BUILD_TEMP/gst-plugins-bad-1.16.0 if you wanted rebuild.";
    else
        echo "gst-plugins-bad-1.16.0 compiled fail, please fixed error and retry.";
        exit 0;
    fi;
else
    echo "gst-plugins-bad-1.16.0 has been compiled.";
fi;