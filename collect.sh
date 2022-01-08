#!/bin/bash
cd /tmp/rom

#mkdir -p /tmp/rom/out
#rclone copy rclonerw:aex/out.tar.gz /tmp/rom -P
#time tar xf out.tar.gz
#rm out.tar.gz
source build/envsetup.sh
export TARGET_USES_MKE2FS=true
lunch aosp_onclite-userdebug
export TARGET_USES_MKE2FS=true
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z
mka aex -j$(nproc --all) &
sleep 20m
kill %1
ccache -s
