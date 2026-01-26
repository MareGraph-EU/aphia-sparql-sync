#! /usr/bin/env bash
# -----------------------------------------------------------------------------
# Script    : msup.sh
# Author    : Marc Portier
# Date      : Jan 2026
# Purpose   : Start up the docker stack
# -----------------------------------------------------------------------------
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WORKDIR="$(dirname "$DIR")" # one up from bin/

echo "Stopping and removing containers..."
(cd "${WORKDIR}" && docker compose up -d)
echo "Done."