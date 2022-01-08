#!/bin/bash
sleep 10s
cd /tmp

com ()
{
    tar --use-compress-program="pigz -k -$2 " -cf $1.tar.gz $1
}

time com ccache 1
rclone copy ccache.tar.gz rclonerw:dup9 -P

cd /tmp/rom
mka installclean
sleep 10s

comi ()
{
    tar --use-compress-program="pigz -k -$2 " -cf $1.tar.gz $1
}

time comi out 1
rclone copy out.tar.gz rclonerw:dup9 -P
