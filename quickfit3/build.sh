#!/usr/bin/env bash

# Ubuntu needs the following libraries
# sudo apt-get install libglu1-mesa-dev freeglut3-dev mesa-common-dev libusb-dev expect

# Update the GITs of the dependent libaries
git submodule update --init --recursive --force  -- "."
git checkout master
git pull
chmod +x checkout_update_submodules.sh

## Use the template configuration for quickfit3
cp "$RECIPE_DIR/quickfit.inc" "$SRC_DIR/quickfit.inc"

if [ "$(uname)" == "Darwin" ]; then
  echo 'DEFINES += "__APPLE__"' >> $SRC_DIR/quickfit.inc
fi

if [ "$(uname)" == "Linux" ]; then
  echo 'DEFINES += "__LINUX__"' >> $SRC_DIR/quickfit.inc
fi

# Build dependency libraries - quickfit3 interactively builds the dependencies.
# I use expect in the "expect" scripts to interact with the build script
cd "$SRC_DIR/extlibs"
cp "$RECIPE_DIR/build_depend.sh" "$SRC_DIR/extlibs/build_depend.sh"
chmod +x build_dependencies.sh
./build_depend.sh

cd "$SRC_DIR"
qmake quickfit3.pro "CONFIG+=release" "QMAKE_LIBDIR+=$SRC_DIR/output/"

cp "$RECIPE_DIR/make.sh" "$SRC_DIR/make.sh"
chmod +x "$SRC_DIR/make.sh"
./make.sh

# move the output folder to the build prefix
mv $SRC_DIR/output $PREFIX/bin
mv $PREFIX/bin/*.so* $PREFIX/lib


