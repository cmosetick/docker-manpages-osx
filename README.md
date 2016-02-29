Docker Man Pages for OS X
=========================

**Install the man pages for `docker` on your Mac OS X system using docker build and go-md2man.**  

_Works great when used with with [Triton](https://docs.joyent.com/public-cloud/api-access/docker) or [Dlite](https://github.com/nlf/dlite)!!_

## Prereqs
- The script assumes that you are using Mac Homebrew on your OS X system. (http://brew.sh)  

- The script assumes you have `docker` and `git` installed and an active internet connection to pull the docker repo to your local system.

## Usage

To install the man pages, just run the script:  
`./docker-man-pages-osx.sh`

Then to view any docker related man page, just use man like normal!  
Perfect for offline usage!

```
# examples
man docker
man docker-run
man docker-inspect
man docker-exec
man docker-attach
etc, etc.
```

For a full listing of all the man pages that get installed run:  
`ls -l /usr/local/share/man/man1/docker*`

## Caveats
- These man pages are installed outside of Homebrew, therefore are likely to be out of date or stale or out of sync with your currently installed version of docker at any given time.

- Run the script occasionally to update the pages in the event that the Docker core team updates things on their side.

- At time of writing, there is no man page in the docker repo for `docker-network` which is functionality that was recently added to docker v1.9+.

### References

Adapted from:
http://stackoverflow.com/a/32239112  
Stackoverflow users: [Serg](http://stackoverflow.com/users/131337/serg) + [Gilly](http://stackoverflow.com/users/3903368/gilly)

go-md2man:
https://github.com/cpuguy83/go-md2man
