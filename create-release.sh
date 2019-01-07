#!/bin/sh

if [ ! -e bin/k8s-debugbox ]; then
    echo "'$(basename "$0")' must be run in 'k8s-debugbox' directory!" >&2
    exit 1
fi

if [ ! -e box/busybox ]; then
    echo "'bootstrap.sh' must be run first!" >&2
    exit 1
fi

if [ $# -ne 1 ]; then
    echo "Usage:" >&2
    echo "  $(basename $0) VERSION" >&2
    exit 1
fi

mkdir -p "releases/k8s-debugbox-$1/box"
cp box/busybox box/toybox box/curl box/cacert.pem "releases/k8s-debugbox-$1/box"
git archive HEAD --prefix=k8s-debugbox-$1/ -o releases/k8s-debugbox-$1.tar
git archive HEAD --prefix=k8s-debugbox-$1/ -o releases/k8s-debugbox-$1.zip
(cd releases && tar --owner=root --group=root -rf k8s-debugbox-$1.tar "k8s-debugbox-$1" && gzip -9f k8s-debugbox-$1.tar)
(cd releases && zip -qur k8s-debugbox-$1.zip "k8s-debugbox-$1")
rm -rf "releases/k8s-debugbox-$1"
