#glib
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