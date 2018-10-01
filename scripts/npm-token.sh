#!/usr/bin/env bash

NPM_TOKEN=$1

echo "//registry.npmjs.org/:_authToken=${NPM_TOKEN}" > .npmrc
