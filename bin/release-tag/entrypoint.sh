#!/bin/sh

set -eu
git remote set-url origin https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY
git tag -a $(cat .version) -m "Version $(cat .version)"
git push origin $(cat .version)
