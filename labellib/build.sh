$PYTHON setup.py install --single-version-externally-managed --record=record.txt  # Python command to install the script.
mkdir build_lib
cd build_lib
cmake ..
make DESTDIR=$PREFIX install