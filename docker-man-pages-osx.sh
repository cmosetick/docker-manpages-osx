#!/bin/bash

# originally adapted from: http://stackoverflow.com/a/32239112

docker build -t docker-man-pages-osx .
mkdir -p $HOME/temp
cd $HOME/temp
git clone https://github.com/docker/docker-ce.git
cd docker-ce/components/cli/man
docker run --rm -v $PWD/:/docs:rw -w /docs -i --entrypoint=/docs/md2man-all.sh docker-man-pages-osx:latest
cp -R man* /usr/local/share/man/   # no sudo for homebrew location
rm -rf $HOME/temp/docker-ce	   # cleanup
ls -l /usr/local/share/man/man1/docker*
ls -l /usr/local/share/man/man5/docker*
ls -l /usr/local/share/man/man8/docker*

echo "TEST A DOCKER MAN PAGE"
man docker
