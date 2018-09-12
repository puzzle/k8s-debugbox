#!/tmp/box/busybox sh

if [ ! -e /tmp/box/bin/sh ]; then
  mkdir -p /tmp/box/bin

  echo "Installing Busybox"
  [ -e /tmp/box/busybox ] || cp /box/busybox /tmp/box
  /tmp/box/busybox --install /tmp/box/bin

  echo "Installing toybox"
  [ -e /tmp/box/toybox ] || cp /box/toybox /tmp/box
  for i in $(/tmp/box/toybox); do [ -e /tmp/box/bin/$i ] || ln /tmp/box/toybox /tmp/box/bin/$i; done

  [ -e /tmp/box/sh ] || cp /box/sh /tmp/box/sh
  chmod 0755 /tmp/box/sh
fi
