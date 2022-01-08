#!/bin/bash
cd /tmp/rom

#mkdir -p /tmp/rom/out
#rclone copy rclonerw:aex/out.tar.gz /tmp/rom -P
#time tar xf out.tar.gz
#rm out.tar.gz
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z

source build/envsetup.sh
lunch aosp_onclite-userdebug
mka aex -j$(nproc --all)
