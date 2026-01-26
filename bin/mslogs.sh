#! /usr/bin/env bash
# -----------------------------------------------------------------------------
# Script    : mslogs.sh
# Author    : Marc Portier
# Date      : Jan 2026
# Purpose   : Show logs for the docker stack - ctrl-C to stop
# -----------------------------------------------------------------------------
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WORKDIR="$(dirname "$DIR")" # one up from bin/

echo "Showing logs for the docker stack..."
echo "Stop with ctrl-C."
(cd "${WORKDIR}" && docker compose logs -f)