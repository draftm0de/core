#!/bin/bash

docker rmi -f $(docker images 'draftmode-base*' -a -q)
