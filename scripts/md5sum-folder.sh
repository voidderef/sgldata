#!/usr/bin/env sh

case "$1" in
    create)
        find "$2" -type f -print0 | xargs -0 md5sum
        ;;
    check)
        cd "$2" && md5sum -c
        ;;
    *)
        echo "Usage: $0 <create|check> <folder>"
        exit 1
esac