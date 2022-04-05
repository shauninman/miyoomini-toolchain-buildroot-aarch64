#!/bin/sh

set -x

# downloaded in setup-buildroot.sh
TOOLCHAIN_NAME="gcc-arm-8.3-2019.03-aarch64-arm-linux-gnueabihf"

mkdir tmp && cp $TOOLCHAIN_NAME.tar.xz tmp && cd tmp
tar xf $TOOLCHAIN_NAME.tar.xz
mv $TOOLCHAIN_NAME ../miyoomini-toolchain
cd ../ && rm -rf tmp

ln -rs ./miyoomini-toolchain ./miyoomini-toolchain/usr
ln -rs ./miyoomini-toolchain/arm-linux-gnueabihf/libc ./miyoomini-toolchain/arm-linux-gnueabihf/sysroot

cd ~
if [ ! -d "./my283" ]; then
	tar xf my283.tar.xz
fi
rsync -a --ignore-existing /root/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/ ./miyoomini-toolchain/arm-linux-gnueabihf/sysroot/
rsync -a --ignore-existing /root/my283/ ./miyoomini-toolchain/arm-linux-gnueabihf/sysroot/
find ./miyoomini-toolchain -type f -name ".*" -delete

tar --xz -cvf miyoomini-toolchain.tar.xz miyoomini-toolchain/
mv ./miyoomini-toolchain.tar.xz ~/workspace/
rm -rf miyoomini-toolchain
