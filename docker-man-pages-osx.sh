#!/usr/local/bin/bash

# adapted from: http://stackoverflow.com/a/32239112

mkdir $HOME/temp
cd $HOME/temp
git clone https://github.com/docker/docker.git
cd docker/man                      # looks like the directory has moved up
docker build -t docker/md2man .    # don't forget the '.'
docker run -v $PWD/:/docs:rw -w /docs -i docker/md2man /docs/md2man-all.sh
cp -R man* /usr/local/share/man/   # no sudo for homebrew location
rm -rf $HOME/temp/docker	   # cleanup
man docker                         # check it worked on OS X
