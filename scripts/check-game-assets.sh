#!/usr/bin/env bash

# Root path of this script
readonly ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

set -e

integrity_check_game_assets()
{
    local asset_dir_name="$1"

    local data_dir="$ROOT_PATH/../data"
    local checksum_file="$ROOT_PATH/../checksum/$asset_dir_name.md5"

    echo ">>> Checking $asset_dir_name..."

    cd "$data_dir" || exit 1

    if ! "$ROOT_PATH"/md5sum-folder.sh check . < "$checksum_file"; then
        echo "ERROR: At least one checksum mismatch in $data_dir"
        exit 1
    fi

    echo "Check successful, no errors"
}

####################
# Main entry point #
####################

if [ "$#" -lt 1 ]; then
    echo "Integrity check game assets of distribution data"
    echo "Usage: $0 <asset dir name, e.g. piu>"
    exit 1
fi

asset_dir_name="$1"

integrity_check_game_assets "$asset_dir_name"