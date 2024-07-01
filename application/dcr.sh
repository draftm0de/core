#!/bin/bash

docker rmi -f $(docker images 'draftmode-example*' -a -q)
