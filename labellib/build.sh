$PYTHON setup.py install --single-version-externally-managed --record=record.txt
rm -r build
mkdir build_lib
cd build_lib
cmake ..
make DESTDIR=$PREFIX install