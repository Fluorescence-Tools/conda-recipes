
git submodule update --init --recursive --force  -- "."
git checkout master
git pull

copy "%RECIPE_DIR%/quickfit.inc" "%SRC_DIR%/quickfit.inc"

echo 'DEFINES += "__APPLE__"' >> $SRC_DIR/quickfit.inc

cd "%SRC_DIR%\extlibs"
copy "%RECIPE_DIR%/build_depend.sh" "%SRC_DIR%/extlibs/build_depend.sh"
./build_depend.sh

cd "$SRC_DIR"
qmake quickfit3.pro "CONFIG+=release" "QMAKE_LIBDIR+=$SRC_DIR/output/"

cp "$RECIPE_DIR/make.sh" "$SRC_DIR/make.sh"
chmod +x "$SRC_DIR/make.sh"
./make.sh

# move the output folder to the build prefix
mv $SRC_DIR/output $PREFIX/bin
mv $PREFIX/bin/*.so* $PREFIX/lib


