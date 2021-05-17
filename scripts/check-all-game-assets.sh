#!/usr/bin/env bash

# Root path of this script
readonly ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

set -e

####################
# Main entry point #
####################

checksum_dir="$ROOT_PATH/../checksum"
check_fail=""

for checksum_file in "$checksum_dir"/*; do
    filename="$(basename "$checksum_file")"
    game_dir_name="${filename%.*}"

    if ! "$ROOT_PATH/check-game-assets.sh" "$game_dir_name"; then
        check_fail="1"
    fi
done

if [ "$check_fail" ]; then
    echo "ERROR: At least one check failed with errors"
else
    echo "All checks successful, no errors"
fi