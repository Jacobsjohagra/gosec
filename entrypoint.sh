#!/usr/bin/env bash

# Expand the arguments into an array of strings. This is required because the GitHub action
# provides all arguments concatenated as a single string.
ARGS=("$@")

GITHUB_DOMAIN="${GITHUB_CUSTOM_DOMAIN:-github.com}"

if [[ ! -z "${GITHUB_AUTHENTICATION_TOKEN}" ]]; then
  git config --global --add url."https://x-access-token:${GITHUB_AUTHENTICATION_TOKEN}@${GITHUB_DOMAIN}/".insteadOf "https://${GITHUB_DOMAIN}/"
fi

/bin/gosec "${ARGS[@]}"
