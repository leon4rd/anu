#!/bin/bash
cd /tmp/rom

#mkdir -p /tmp/rom/out
#rclone copy rclonerw:dup9/out.tar.gz /tmp/rom -P
#time tar xf out.tar.gz
#rm out.tar.gz
#sleep 5s
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z

source build/envsetup.sh
breakfast blueline
mka bacon
