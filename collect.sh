#!/bin/bash
cd /tmp/rom

source build/envsetup.sh
breakfast onclite
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z
brunch onclite &
sleep 65m
kill %1
ccache -s
