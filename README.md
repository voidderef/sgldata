# sgldata: Manage distribution data for Simple Game Loader (SGL)

Version: 1.00<br/>
[Release history](CHANGELOG.md)

## Purpose

Scripts to manage SGL distribution data, i.e. game assets, and defining distribution asset packages for different games
and types of setups.

* Game asset integration checks to verify if the actual game assets of a distribution package are fine.

## How to use distribution data

Place all distribution data in the corresponding sub-folders in `data`. The data is hosted externally and can be found
[here](https://drive.google.com/drive/folders/1SzgBC9PqAseah2mTwfUvRAeqt1ARaa9u?usp=sharing). Download and place it
accordingly in the data directory, e.g. `data/piu` or `data/iidx`.

To check if everything's placed correctly and verifying distribution data integrity:

```shell script
make check-game-assets
```

Check the output for any errors indicating a file is missing or for incorrect checksums.

## Contributing

If you have customized SGL with data that you want to share with us, and we would highly appreciate this, please refer
to our contribution guidelines [here](CONTRIBUTING.md).

## License

Source code license is the Unlicense; you are permitted to do with this as thou
wilt. For details, please refer to the [LICENSE file](LICENSE) included with the
source code.