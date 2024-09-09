#!/bin/bash
# set -e

SECRET_PATH="../../.secrets"
CI_DOCKER_USERNAME=$(cat "$SECRET_PATH/DOCKER_USERNAME")
CI_DOCKER_PASSWORD=$(cat "$SECRET_PATH/DOCKER_PASSWORD")


SCRIPT_PATH="/home/admin/projects/draftm0de/projects/base.scripts"
REPOSITORY="draftmode/base.caddy:1.0.1"
REMOTE_SHA=$("${SCRIPT_PATH}/docker.registry.sh" "sha" "$REPOSITORY" "${CI_DOCKER_USERNAME}" "${CI_DOCKER_PASSWORD}")
LOCAL_SHA=$("${SCRIPT_PATH}/docker.sh" "sha" "$REPOSITORY")
if [ "$REMOTE_SHA" != "$LOCAL_SHA" ]; then
  echo "[Notice] push & tag start"
  echo "L:$LOCAL_SHA"
  echo "R:$REMOTE_SHA"
else
  echo "[Notice] push & tag skipped, built image $REPOSITORY is locally identically to his remote version"
fi
