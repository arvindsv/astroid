# A Docker image for astroid, the mail client

This repository is used to build the Docker image for [astroid](https://github.com/astroidmail/astroid). The image is available at: https://hub.docker.com/r/arvindsv/astroid/

### Usage:

Especially on Mac OS X, if you've setup astroid and notmuch correctly, you can do this:

Step 1: Start XQuartz

Step 2: Run:

```
ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')

xhost + "$ip"

docker run -d -e DISPLAY="${ip}":0 -e HOME=/Users/$USER \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /Users/$USER:/Users/$USER \
    astroid:v1-59ebdb979
```

### Build image (if you don't want to use the published image from DockerHub):

```
git clone https://github.com/arvindsv/astroid.git
docker build -t astroid .
```
