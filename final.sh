#!/bin/bash
cd /tmp/rom

export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z

source build/envsetup.sh
breakfast onclite
brunch onclite
