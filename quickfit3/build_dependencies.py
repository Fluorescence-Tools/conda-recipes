#!/usr/bin/env python

import pexpect
import sys

child = pexpect.spawn('./build_dependencies.sh')

# This script interacts with the interactive quickfit3 build_dependencies.sh script and

answers_linux = [
    ["Do you want to build keep the build directories (y/n)?", "n"],
    ["How many parallel builds do you want to use in make (1/2/3/...)?", "4"],
    ["Do you want to use more agressive optimizations for the built libraries (y/n/M)? M: no optimizations, use on MacOSX)", "y"]
    ["Do you want to optimize libraries for your local machine? (y/n)?", "n"],
    ["Do you want to use OpenMP? (y/n)?", "n"],
    ["Do you need the -fPIC flags? (y/n)?", "y"],
    ["Do you want to build 'zlib' (y/n)?", "y"],
    ["Do you want to build 'lmfit' (y/n)?", "y"],
    ["Do you want to build 'lmfit v5' (y/n)?", "y"],
    ["Do you want to build 'levmar' (y/n)?", "y"],
    ["Do you want to build 'libpng' (y/n)?", "y"],
    ["Do you want to build 'libJPEG' (y/n)?", "y"],
    ["Do you want to build 'libtiff' (y/n)?", "y"],
    ["Do you want to build 'gsl' (y/n)?", "y"],
    ["Do you want to build 'libusb' (y/n)?", "n"],
    ["Do you want to build 'eigen' (y/n)?", "y"],
    ["Do you want to build 'NLopt' (y/n)?", "n"],
    ["Do you want to build 'OOL' (y/n)?", "n"],
    ["Do you want to build 'cimg' (y/n)?", "y"],
    ["Do you want to build 'pixman' (y/n)?", "y"],
    ["Do you want to build 'cairo' (y/n)", "y"]
]

answers_macos = [
    ["Do you want to build keep the build directories (y/n)?", "n"],
    ["How many parallel builds do you want to use in make (1/2/3/...)?", "4"],
    ["Do you want to use more agressive optimizations for the built libraries (y/n/M)? M: no optimizations, use on MacOSX)", "M"]
    ["Do you want to optimize libraries for your local machine? (y/n)?", "n"],
    ["Do you want to use OpenMP? (y/n)?", "n"],
    ["Do you need the -fPIC flags? (y/n)?", "y"],
    ["Do you want to build 'zlib' (y/n)?", "y"],
    ["Do you want to build 'lmfit' (y/n)?", "y"],
    ["Do you want to build 'lmfit v5' (y/n)?", "y"],
    ["Do you want to build 'levmar' (y/n)?", "y"],
    ["Do you want to build 'libpng' (y/n)?", "y"],
    ["Do you want to build 'libJPEG' (y/n)?", "y"],
    ["Do you want to build 'libtiff' (y/n)?", "y"],
    ["Do you want to build 'gsl' (y/n)?", "y"],
    ["Do you want to build 'libusb' (y/n)?", "n"],
    ["Do you want to build 'eigen' (y/n)?", "y"],
    ["Do you want to build 'NLopt' (y/n)?", "n"],
    ["Do you want to build 'OOL' (y/n)?", "n"],
    ["Do you want to build 'cimg' (y/n)?", "y"],
    ["Do you want to build 'pixman' (y/n)?", "n"],
    ["Do you want to build 'cairo' (y/n)", "n"]
]

answers_windows = [
    ["Do you want to build keep the build directories (y/n)?", "n"],
    ["How many parallel builds do you want to use in make (1/2/3/...)?", "4"],
    ["Do you want to use more agressive optimizations for the built libraries (y/n/M)? M: no optimizations, use on MacOSX)", "M"]
    ["Do you want to optimize libraries for your local machine? (y/n)?", "n"],
    ["Do you want to use OpenMP? (y/n)?", "n"],
    ["Do you need the -fPIC flags? (y/n)?", "n"],
    ["Do you want to build 'zlib' (y/n)?", "y"],
    ["Do you want to build 'lmfit' (y/n)?", "y"],
    ["Do you want to build 'lmfit v5' (y/n)?", "y"],
    ["Do you want to build 'levmar' (y/n)?", "y"],
    ["Do you want to build 'libpng' (y/n)?", "y"],
    ["Do you want to build 'libJPEG' (y/n)?", "y"],
    ["Do you want to build 'libtiff' (y/n)?", "y"],
    ["Do you want to build 'gsl' (y/n)?", "y"],
    ["Do you want to build 'libusb' (y/n)?", "n"],
    ["Do you want to build 'eigen' (y/n)?", "y"],
    ["Do you want to build 'NLopt' (y/n)?", "n"],
    ["Do you want to build 'OOL' (y/n)?", "n"],
    ["Do you want to build 'cimg' (y/n)?", "y"],
    ["Do you want to build 'pixman' (y/n)?", "n"],
    ["Do you want to build 'cairo' (y/n)", "n"]
]

if "linux" in sys.platform:
    answers = answers_linux
elif "darwin" in sys.platform:
    answers = answers_macos
elif "win32" in sys.platform:
    answers = answers_windows
else:
    answers = answers_linux


for question, answer in answers:
    child.expect(question)
    child.sendline(answer)


