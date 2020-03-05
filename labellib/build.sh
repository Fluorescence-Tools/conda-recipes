$PYTHON setup.py install --single-version-externally-managed --record=record.txt
rm -rf build
mkdir build_lib
cd build_lib
cmake ..
make DESTDIR=$PREFIX install