#!/bin/bash

# set environment variables
git clone --depth=1 https://github.com/picasso09/proton-clang clang
export KBUILD_BUILD_HOST="picasso09"
export KBUILD_BUILD_USER="picasso"
export PATH="$(pwd)/clang/bin:$PATH"

# build kernel
make -j$(nproc --all) O=out ARCH=arm64 oppo6765_defconfig
make -j$(nproc --all) ARCH=arm64 O=out \
                  CC=clang \
                  CROSS_COMPILE=aarch64-linux-gnu- \
                  CROSS_COMPILE_ARM32=arm-linux-gnueabi-
