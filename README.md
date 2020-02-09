# crzutils

crzutils combines some utilities into a single small executable.

## Installation

```
$ make
# make install
```

### Symlinking

If the crzutils executable is renamed to one of the commands it supports, it will act as that command automatically:

```sh
ln -s crzutils search
./search
```

This allows you to create a bunch of symlinks or hardlinks to the crzutils executable, add them to your $PATH, and let a single crzutils provide a standard set of command line tools. The --list option to crzutils gives the list of supported commands in an easily scriptable form.

```sh
mkdir crzdir
for i in $(crzutils --list)
do
  ln -s crzutils crzdir/$i
done
```

## Usage

```
Usage: crzutils [function [arguments]...]
   or: crzutils --list

Currently defined functions:
	apt-du bye droidmnt extract git-cloc nsa-name open-term own pid search start vimv xid yt-music
```

