#!/bin/bash

set -e

DEST_DIR="${HOME}/dest_repo"
DEST_URL="https://x-access-token:${INPUT_DESTINATION_TOKEN}@github.com/${INPUT_DESTINATION_REPO}.git"

git clone --depth=1 --single-branch --branch source \
  ${DEST_URL} \
  ${DEST_DIR}

cd ${DEST_DIR}/
hugo ${INPUT_HUGO_ARGS}

cd ${INPUT_BUILD_DIR}/
git init
git remote add origin "https://github.com/${INPUT_DESTINATION_REPO}.git"
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add --all
git commit -m "Automated deployment: $(date -R) ${GITHUB_SHA}" || \
  echo 'No changes, skipping publish' && exit 0
git push -u origin master
