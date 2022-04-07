#!/bin/sh

cd ~

TOOLCHAIN_VERSION=v0.0.2
TOOLCHAIN_NAME="gcc-arm-8.3-2019.03-aarch64-arm-linux-gnueabihf"
if [ ! -f "$TOOLCHAIN_NAME.tar.xz" ]; then
	wget https://github.com/shauninman/gcc-arm-8.3-aarch64/releases/download/$TOOLCHAIN_VERSION/$TOOLCHAIN_NAME.tar.xz
fi
tar -xf ./$TOOLCHAIN_NAME.tar.xz
# don't delete this tar!

BUILDROOT_VERSION=buildroot-2019.11.3
wget https://buildroot.org/downloads/$BUILDROOT_VERSION.tar.gz
tar -xf ./$BUILDROOT_VERSION.tar.gz
rm -f ./$BUILDROOT_VERSION.tar.gz
mv ./$BUILDROOT_VERSION ./buildroot
cd ./buildroot
patch -p1 < ../libpng12.patch
cp ~/miyoomini-aarch64.config ./.config