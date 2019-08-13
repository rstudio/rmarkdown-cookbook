#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "m.harper@outlook.com"
git config --global user.name "Michael Harper"

git clone -b gh-pages https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git book-output
cd book-output

ls | xargs rm -rf
git ls-files --deleted -z | xargs -0 git rm

cp -r ../book/_book/* ./
git add --all *
git commit -m"Update the book" || true
git push -q origin gh-pages
