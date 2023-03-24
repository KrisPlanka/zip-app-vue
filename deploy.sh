#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# navigate into the build output reposetory
cd dist

# place .nojekyll to buypass Jekyll processing
echo > .nojekyll

git init
git checkout -B main
git add -A
git commit -m 'deploy'

git push -f git@github.com:KrisPlanka/zip-app-vue.git main

cd -