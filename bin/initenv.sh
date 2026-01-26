#! /usr/bin/env bash
# -----------------------------------------------------------------------------
# Script    : initenv.sh
# Author    : Marc Portier
# Date      : Jan 2026
# Purpose   : Initialize the environment for the docker stack
# -----------------------------------------------------------------------------
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WORKDIR="$(dirname "$DIR/..")" # one up from bin/

echo "Cloning the example env..."
cp "${WORKDIR}/dot-env.example" "${WORKDIR}/.env"
echo "Further customisation can be provided in the .env file located at ${WORKDIR}/.env"
echo "Done."