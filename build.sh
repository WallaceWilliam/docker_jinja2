#!/bin/sh

set -e -u

export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1
export BUILDKIT_PROGRESS=plain

docker run --rm -i hadolint/hadolint hadolint -t error - < ./Dockerfile

docker compose build --parallel --pull

