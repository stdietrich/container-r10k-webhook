#!/bin/sh

set -e

if [ -d /container-entrypoint.d/ ]; then
    find "/container-entrypoint.d/" -follow -type f -name "*.sh" -print | sort -V | while read -r f; do
        echo "Running ${f}"
        sh "${f}"
    done
fi

exec setpriv --reuid puppet --regid 999 --clear-groups --reset-env /usr/sbin/webhook-go "$@"
