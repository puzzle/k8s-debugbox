FROM busybox

COPY box/install-k8s-debugbox.sh box/sh /box/

ADD https://busybox.net/downloads/binaries/1.28.1-defconfig-multiarch/busybox-x86_64 /box/busybox
ADD http://landley.net/toybox/bin/toybox-x86_64 /box/toybox

RUN chmod 0755 /box/*

CMD ["/bin/sh", "/box/install-k8s-debugbox.sh"]
