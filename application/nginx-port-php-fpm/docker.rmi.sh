#!/bin/bash
source .env
docker rmi -f $(docker images "$RUNTIME_IMAGE_PREFIX-*" -a -q)
docker image prune