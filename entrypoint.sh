#!/bin/bash

DEST_DIR="${HOME}/dest_repo"
DEST_URL="https://x-access-token:${INPUT_DESTINATION_TOKEN}@github.com/${INPUT_DESTINATION_REPO}.git"

# 将hugo源码拷贝到新位置
cp -R \
  ${GITHUB_WORKSPACE}/* \
  ${DEST_DIR}
cp -R \
  ${GITHUB_WORKSPACE}/* \
  ${DEST_DIR}
  
# 转到新目录
cd ${DEST_DIR}
# 编译生成静态网站文件
hugo ${INPUT_HUGO_ARGS}
# 进入发布目录
cd ${INPUT_BUILD_DIR}/
git init
git remote add origin "https://github.com/${INPUT_DESTINATION_REPO}.git"
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add --all
git commit -m "Automated deployment by ${GITHUB_ACTOR} at ${TS}"
git push -u origin master
cd
echo "Done deploy!"
