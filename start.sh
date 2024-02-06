#!/bin/sh

export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1
export BUILDKIT_PROGRESS=plain

set -e

. ./.env

docker-compose up --build -d #|| true
timeout 3 docker compose logs -f
#docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' oc_vpn
