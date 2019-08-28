#!/bin/bash

# originally adapted from: http://stackoverflow.com/a/32239112

docker build . -t docker-man-pages-osx

mkdir -p $HOME/temp
cd $HOME/temp
git clone -b docs --single-branch https://github.com/moby/moby.git

cd moby/man

docker run --rm -v $PWD/:/man:rw -w /man -i --entrypoint=/man/md2man-all.sh docker-man-pages-osx:latest

cp -R man* /usr/local/share/man/   # no sudo for homebrew location
rm -rf $HOME/temp/moby   # cleanup
ls -l /usr/local/share/man/man1/docker*
ls -l /usr/local/share/man/man5/docker*
ls -l /usr/local/share/man/man8/docker*

echo "TEST A DOCKER MAN PAGE"
man docker
