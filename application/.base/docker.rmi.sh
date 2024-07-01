#!/bin/bash
if [ -z "$1" ]; then
  FILTER="draftmode/*"
else
  FILTER="draftmode/-$1*"
fi
docker rmi -f $(docker images "$FILTER" -a -q)
