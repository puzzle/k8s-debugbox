#!/bin/sh

debugbox_dir=${HOME}/.k8s-debugbox

findWritablePathDir()
{
    old_ifs="$IFS"
    IFS=:
    for dir in $PATH; do
        if [ -w $dir ]; then
            IFS="$old_ifs"
            echo "$dir"
            return 0
        fi
    done
    IFS="$old_ifs"
    return 1
}

if [ ! -e bin/k8s-debugbox ]; then
    echo "'$(basename "$0")' must be run in 'k8s-debugbox' directory!" >&2
    exit 1
fi

mkdir -p ${debugbox_dir}
cp -r box ${debugbox_dir}

if writable_path_dir="$(findWritablePathDir)"; then
    cp bin/k8s-debugbox "${writable_path_dir}"
    if command -v bash.exe >/dev/null 2>&1; then
        cp bin/k8s-debugbox.bat "${writable_path_dir}"
    fi
else
    echo "Can't find writable directory in PATH. Please add bin/k8s-debugbox to PATH manually!"
fi
