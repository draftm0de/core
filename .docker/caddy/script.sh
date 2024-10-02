#!/bin/bash
set -e

# -------------------------
# with arguments
# -------------------------
REPOSITORY="draftmode/base.caddy"
# -------------------------

# -------------------------
# source snippets
# -------------------------
SCRIPT_PATH="/home/admin/projects/draftm0de/projects/base.scripts"

echo "[Notice] Build image..."
BUILT_IMAGE_NAME="$REPOSITORY:latest"
# ("${SCRIPT_PATH}/docker.sh" "build" "--build-args=.build_args" "-t $BUILT_IMAGE_NAME" ".")
echo "[Notice] > build successfully"

# get local SHA from built image
echo "[Notice] Get local SHA for $BUILT_IMAGE_NAME"
# SHA=$("${SCRIPT_PATH}/docker.sh" "image sha" "$BUILT_IMAGE_NAME")
echo "[Notice] > local SHA for $BUILT_IMAGE_NAME: $SHA"

# protect: for given IMAGE and SHA no remove tags exists
echo "[Notice] Protect new SHA against remote"
# ("${SCRIPT_PATH}/docker.sh" "image tags" "$REPOSITORY" "--remote" "--sha=$SHA" "--exit")
echo "[Notice] > Protection successfully"

# get local SHA from built image
echo "[Notice] Get latest remote tag for $BUILT_IMAGE_NAME "
LATEST_TAG=$("${SCRIPT_PATH}/docker.sh" "image tags" "$BUILT_IMAGE_NAME" "--remote" "--latest=patch")
echo "[Notice] > latest remote tag for $BUILT_IMAGE_NAME: $LATEST_TAG"

echo "[Notice] Get next image tags"
NEXT_TAGS="1.2.3"
echo "[Notice] > next image tags for $REPOSITORY: $NEXT_TAGS"

echo "[Notice] Tag and push images"
echo "[Notice] > Tagging and pushing successfully"
