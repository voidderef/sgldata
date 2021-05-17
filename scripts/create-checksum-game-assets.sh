#!/usr/bin/env bash

# Root path of this script
readonly ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

create_checksum_game_assets()
{
    local asset_dir="$1"

    cd "$ROOT_PATH/../data" || exit 1

    "$ROOT_PATH"/md5sum-folder.sh create "$asset_dir" > "$ROOT_PATH/../checksum/$asset_dir.md5"
}

####################
# Main entry point #
####################

if [ "$#" -lt 1 ]; then
    echo "Create checksum of game assets of a distribution data folder"
    echo "Usage: $0 <asset dir name, e.g. piu>"
    exit 1
fi

asset_dir_name="$1"

create_checksum_game_assets "$asset_dir_name"