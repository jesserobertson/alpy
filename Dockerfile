# file:   alpy.Dockerfile
# author: Jess Robertson, CSIRO Mineral Resources
#
# description: Lightweight Python container for quicker builds. Stolen from 
#       github.com/jfloff/alpine-python with a few tweaks for my own 
#       (scientific) usage.

FROM alpine:latest
MAINTAINER Jess Robertson <jesse.robertson@csiro.au>

# Add testing packages to repositories
RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" \
        >> /etc/apk/repositories \
    && apk update \
    && apk add python3 python3-dev 

# Bootstrap pip in from python
RUN python3 -m ensurepip --upgrade

# Make some useful symlinks
RUN cd /usr/bin \
    && ln -sf easy_install-3 easy_install \
    && ln -sf idle3 idle \
    && ln -sf pydoc3 pydoc \
    && ln -sf python3 python \
    && ln -sf python-config3 python-config \
    && ln -sf pip3 pip

ENTRYPOINT ["python"]
