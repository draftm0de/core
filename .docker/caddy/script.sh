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
source "${SCRIPT_PATH}/docker.build.sh"

build "${REPOSITORY}" "${CI_DOCKER_USERNAME}" "${CI_DOCKER_PASSWORD}"
push "${REPOSITORY}" "${CI_DOCKER_USERNAME}" "${CI_DOCKER_PASSWORD}"
cleanup "${REPOSITORY}"
