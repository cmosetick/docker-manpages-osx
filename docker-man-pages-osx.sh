#!/bin/bash

# originally adapted from: http://stackoverflow.com/a/32239112

docker build -t docker-man-pages-osx .
mkdir -p $HOME/temp
cd $HOME/temp
git clone  -b docs-v1.12.1-2016-08-12 --single-branch https://github.com/docker/docker.git
cd docker/man
docker run --rm -v $PWD/:/docs:rw -w /docs -i --entrypoint=/docs/md2man-all.sh docker-man-pages-osx:latest
cp -R man* /usr/local/share/man/   # no sudo for homebrew location
rm -rf $HOME/temp/docker	   # cleanup
ls -l /usr/local/share/man/man1/docker*
ls -l /usr/local/share/man/man5/docker*
ls -l /usr/local/share/man/man8/docker*
echo "print out the known currently installed man pages"
echo "note that some of these man pages do not apply to Docker for Mac / Docker Community Edition"
echo "DISPLAY THREE COMMONLY USED DOCKER MAN PAGES"
man docker && man docker-exec && man docker-volume
