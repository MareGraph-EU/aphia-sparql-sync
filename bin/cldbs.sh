#! /usr/bin/env bash
# -----------------------------------------------------------------------------
# Script    : cldbs.sh
# Author    : Marc Portier
# Date      : Jan 2026
# Purpose   : Clean local database storage for this docker stack
# -----------------------------------------------------------------------------
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WORKDIR="$(dirname "$DIR")" # one up from bin/

echo "Stopping and removing containers..."
(cd "${WORKDIR}" && docker compose down)

echo "Removing local database storage... from ${WORKDIR}/data/"
rm -rf "${WORKDIR}/data/graphdb"
rm -rf "${WORKDIR}/data/ldes-consumer/"
echo "Done."