#!/usr/bin/env bash

if [ -z "${ID_RSA}" ]; then
    echo "ERROR: No ID_RSA file detected."
    exit 1
fi

# GitHub access
mkdir -p ~/.ssh/
echo "$ID_RSA" > ~/.ssh/id_rsa

chmod 0600  ~/.ssh/id_rsa

# Accept github domain
touch ~/.ssh/known_hosts
ssh-keyscan github.com >> ~/.ssh/known_hosts

# Global configuration
git config --global url.ssh://git@github.com/.insteadOf https://github.com/

git config --global push.default simple
git config --global user.email "bot@juliantellez.com"
git config --global user.name "[ BOT ] Julian Tellez"

# echo "\n\n Verify user: \n\n"
# ssh -T git@github.com

# DEBUG
# ssh-keygen -y -e -f ~/.ssh/id_rsa

# echo "\n\n Verify server: \n\n"
# ssh -vT git@github.com
