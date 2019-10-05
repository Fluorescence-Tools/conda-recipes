#!/usr/bin/expect -f

spawn ./build_dependencies.sh
 
expect "Do you want to build keep the build directories (y/n)?"
send -- "n"
 
expect "How many parallel builds do you want to use in make (1/2/3/...)?"
send -- "4"
 
expect "Do you want to use more agressive optimizations for the built libraries (y/n/M)? M: no optimizations, use on MacOSX)"
send -- "n"

expect "Do you want to optimize libraries for your local machine? (y/n)?"
send -- "n"

expect "Do you want to use OpenMP? (y/n)?"
send -- "n"

expect "Do you need the -fPIC flags? (y/n)?"
send -- "y"

expect "Do you want to build 'zlib' (y/n)?"
send -- "y"

expect "Do you want to build 'lmfit' (y/n)?"
send -- "y"

expect "Do you want to build 'lmfit v5' (y/n)?"
send -- "y"

expect "Do you want to build 'levmar' (y/n)?"
send -- "y"

expect "Do you want to build 'libpng' (y/n)?"
send -- "y"

expect "Do you want to build 'libJPEG' (y/n)?"
send -- "y"

expect "Do you want to build 'libtiff' (y/n)?"
send -- "y"

expect "Do you want to build 'gsl' (y/n)?"
send -- "y"

expect "Do you want to build 'libusb' (y/n)?"
send -- "n"

expect "Do you want to build 'eigen' (y/n)?"
send -- "y"

expect "Do you want to build 'NLopt' (y/n)?"
send -- "n"

expect "Do you want to build 'OOL' (y/n)?"
send -- "n"

expect "Do you want to build 'cimg' (y/n)?"
send -- "y"

expect "Do you want to build 'pixman' (y/n)?"
send -- "y"

expect "Do you want to build 'cairo' (y/n)"
send -- "y"

expect eof