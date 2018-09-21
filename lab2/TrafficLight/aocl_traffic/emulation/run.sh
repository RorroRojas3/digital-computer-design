#!/bin/bash
PROJECT=traffic
set -e -x
export CL_CONTEXT_EMULATOR_DEVICE_ALTERA=1
export AOCL_BOARD_PACKAGE_ROOT="/usr/commercial_amd64/altera/15.1/hld/board/bittware/s5_mac"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ALTERAOCLSDKROOT/host/linux64/lib:$AOCL_BOARD_PACKAGE_ROOT/linux64/lib

aoc -c -v  ../device/${PROJECT}_rtl.xml -o ${PROJECT}_rtl.aoco
aocl library create -o ${PROJECT}_rtl.aoclib ${PROJECT}_rtl.aoco
aoc -g -v -l ${PROJECT}_rtl.aoclib -L . -march=emulator ../device/${PROJECT}.cl


make clean
make
mv $PROJECT.aocx bin/

cd bin
./traffic

