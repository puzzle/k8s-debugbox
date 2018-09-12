#!/bin/sh

curl -o box/busybox https://busybox.net/downloads/binaries/1.28.1-defconfig-multiarch/busybox-x86_64
chmod +x box/busybox

curl -o box/toybox http://landley.net/toybox/bin/toybox-x86_64
chmod +x box/toybox
