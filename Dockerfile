FROM busybox

# Download latest k8s-debugbox release
RUN mkdir -p /usr/local/k8s-debugbox && \
    wget -qO- $(wget -qO- https://api.github.com/repos/puzzle/k8s-debugbox/releases/latest | \
    sed -n 's/.*"browser_download_url": *"\([^"]\+.tar.gz\)".*/\1/p') | \
    tar -C /usr/local/k8s-debugbox --strip-components 1 -zxvf -

CMD ["/bin/sh", "/usr/local/k8s-debugbox/box/install-k8s-debugbox.sh"]
