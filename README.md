# Miyoo Mini Toolchain Buildroot Docker Image for M1 Macs

This repo downloads and configures buildroot to build libraries for the M1 Mac version of Miyoo Mini toolchain and optionally packages them up into a full toolchain blob.

## Installation

With Docker installed and running, `make shell` builds the docker image and drops into a shell inside the container. The container's `~/workspace` is bound to `./workspace` by default (but not really used here). Buildroot is downloaded to `~/buildroot`.

After building the first time, `make shell` will skip buildingthe docker image and drop directly into the existing shell.

## Workflow

`cd` into `~/buildroot` and run `make sdk` (or optionally `make menuconfig` first to add additional libraries).

Then you can copy out individual binaries, libraries, and headers from `~/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/`
or return to `~` and run `./package-toolchain.sh` to generate `~/workspace/miyoomini-toolchain.tar.xz`.

eg.

	make shell
	cd ~/buildroot
	make menuconfig
	make sdk
	cd ~
	./package-toolchain.sh
	exit
