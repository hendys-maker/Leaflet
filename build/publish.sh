#!/bin/bash

npm update

VERSION=$(node --eval "console.log(require('./package.json').version);")

npm test || exit 1

git checkout -b build

<<<<<<< HEAD
jake build[,,true]
git add dist/leaflet-src.js dist/leaflet.js dist/leaflet-src.map -f
=======
npm run build
git add dist/leaflet-src.js dist/leaflet.js -f

copyfiles -u 1 build/*.json ./
tin -v $VERSION
git add component.json bower.json -f
>>>>>>> origin/0.7.8

git commit -m "v$VERSION"

git tag v$VERSION -f
git push --tags -f

<<<<<<< HEAD
npm publish --tag rc
=======
npm publish --tag beta
>>>>>>> origin/0.7.8

git checkout master
git branch -D build
