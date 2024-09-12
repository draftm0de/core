#!/bin/bash
set -e

SECRET_PATH="../../.secrets"
# -------------------------
# with arguments
# -------------------------
CI_DOCKER_USERNAME=$(cat "$SECRET_PATH/DOCKER_USERNAME")
CI_DOCKER_PASSWORD=$(cat "$SECRET_PATH/DOCKER_PASSWORD")
REPOSITORY="draftmode/base.caddy"
# -------------------------

# -------------------------
# source snippets
# -------------------------
SCRIPT_PATH="/home/admin/projects/draftm0de/projects/base.scripts"
# source "${SCRIPT_PATH}/docker.build.sh"
# clean "${REPOSITORY}"
# build "${REPOSITORY}" ".build_args"
# tag "${REPOSITORY}" "${CI_DOCKER_USERNAME}" "${CI_DOCKER_PASSWORD}"
# push "${REPOSITORY}" "${CI_DOCKER_USERNAME}" "${CI_DOCKER_PASSWORD}"
# clean "${REPOSITORY}"
# clean_remote "${REPOSITORY}" "${CI_DOCKER_USERNAME}" "${CI_DOCKER_PASSWORD}"

DELETE_REPOSITORY="${REPOSITORY}:1.0.0"
RESPONSE=$("${SCRIPT_PATH}/docker.hub.sh" "delete" "${DELETE_REPOSITORY}" "${CI_DOCKER_USERNAME}" "${CI_DOCKER_PASSWORD}")
echo ":$RESPONSE:"