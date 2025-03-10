#!/usr/bin/env bash

# Expand the arguments into an array of strings
ARGS=("$@")

GITHUB_DOMAIN="${GITHUB_CUSTOM_DOMAIN:-github.com}"

if [[ ! -z "${GITHUB_AUTHENTICATION_TOKEN}" ]]; then
  git config --global --add url."https://x-access-token:${GITHUB_AUTHENTICATION_TOKEN}@${GITHUB_DOMAIN}/".insteadOf "https://${GITHUB_DOMAIN}/"
fi

FILTERED_ARGS=()
for arg in "${ARGS[@]}"; do
  if [[ "$arg" != "GITHUB_CUSTOM_DOMAIN=${GITHUB_CUSTOM_DOMAIN}" ]]; then
    FILTERED_ARGS+=("$arg")
  fi
done

/bin/gosec "${FILTERED_ARGS[*]}"
