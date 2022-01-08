#!/bin/bash
cd /tmp/rom

#mkdir -p /tmp/rom/out
#rclone copy rclonerw:los17/out.tar.gz /tmp/rom -P
#time tar xf out.tar.gz
#rm out.tar.gz
#sleep 5s
source build/envsetup.sh
lunch lineage_onclite-userdebug
breakfast onclite
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z
brunch onclite -j$(nproc --all) &
sleep 20m
kill %1
ccache -s
