#!/usr/bin/env zsh

__builddir=${1:-"build"}

__args=(
    -DCMAKE_BUILD_TYPE=Debug
    -DCMAKE_OSX_SYSROOT=$(xcrun --sdk macosx --show-sdk-path)
    -DCMAKE_OSX_DEPLOYMENT_TARGET=14.0
    -DINPUTLEAP_BUILD_GUI=OFF
    -DINPUTLEAP_BUILD_TESTS=OFF
)

[[ ! -d $__builddir ]] || rm -rf $__builddir
mkdir $__builddir
cd $__builddir

cmake $__args .. || exit $?
cmake --build . --parallel -v
