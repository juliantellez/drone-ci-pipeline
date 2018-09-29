#!/usr/bin/env bash

DRONE_COMMIT_MESSAGE=$1

# SEMVER
SEMVER=$(echo ${DRONE_COMMIT_MESSAGE} | awk 'match(tolower($0),/(minor|major)/) {print substr(tolower($0),RSTART,RLENGTH)}')


if [ $SEMVER ]; then
    RELEASE_VERSION=$SEMVER; else
    RELEASE_VERSION=patch
fi

# PUBLISH
npm version $RELEASE_VERSION -m "[CI SKIP] Publish player v%s"

# UPDATE REMOTE
git config --global push.default simple
git config user.email "bot@djuliantellez.com"
git config user.name "[ PLAYBACK BOT ] DAZN"

git push origin master --no-verify
git push origin --tags --no-verify
