# Contributing
If you are using SGL and are creating data sets for your own dedicated setup, consider if other people might have a
similar setup and would be interested in improving theirs as well. This project lives with your contributions by sharing
custom assets and packs that you have created. We would highly appreciate if you consider giving something back to the
project as it has given you the possibility and motivation to also create those assets and make use of the tool.  

Hosting binary assets with normal repositories doesn't scale well. Therefore, if you have something to contribute,
follow these steps:
1. Put the assets without any custom/specific configuration to your setup, e.g. libraries, IO libs or SGL settings file,
into a new sub-folder inside the `data` folder, e.g. `itg` for In The Groove.
1. Make sure this follows the asset folder layout required by the current SGL version and include the `games.lua` which
defines the selectable loader titles based on the assets you have provided.
1. Create a checksum file for your data by calling `./sgldata.sh create-checksum-game-assets itg` for the itg folder.
This will create a `itg.md5` file inside the `checksum` folder.
1. Submit the new checksum file `itg.md5` as a MR to the repository for review.
1. Get in touch with the maintainers and send them the actual assets. We will host this data somewhere else for you and
everyone else.

If you want to update existing assets, a similar procedure applies:
1. Update the files in any relevant of the existing sub-folders in `data`
1. Re-create the checksums for that folder, e.g. for `piu`, run `./sgldata.sh create-checksum-game-assets piu`
1. Submit the new checksum file `piu.md5` as a MR to the repository for review.
1. Get in touch with the maintainers and send them the updated assets. We will update the hosted data once the MR is
accepted somewhere else.