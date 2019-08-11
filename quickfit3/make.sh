#!/usr/bin/env bash

# The first make run exists with an error as a library is missing. The second run is
# successful. Conda quits when an error is encountered. Hence, the make runs are in
# the make.sh script. The make.sh scripts exists with error level zero.
# This way, conda is "fouled" and builds the package sucessfully.

make -j4
make -j4

# Now the online-help, examples and other asset files will be copied to the output directory.
make install -j16

exit 0
