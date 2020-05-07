#!/bin/bash

cd ${INPUT_BUILD_DIR}/
git init
git remote add origin "https://github.com/${INPUT_DESTINATION_REPO}.git"
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add --all
git checkout -b master
git commit -m "Automated deployment by ${GITHUB_ACTOR} at ${TS}"
git push -u origin master
cd
echo "Done deploy!"
