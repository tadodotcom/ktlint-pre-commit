#!/usr/bin/env sh
set -euo pipefail
IFS=$'\n\t'

REPOSITORY="https://github.com/pinterest/ktlint"
VERSION=0.41.0
CACHE=".cache"
KTLINT="${CACHE}/ktlint-${VERSION}"
SUCCESS_FILE="${CACHE}/download-finished-${VERSION}"
LOCKFILE="${CACHE}/pre-commit-ktlint-download.lock"

# make sure that lock file gets cleanup up in all cases
trap 'rm -f ${LOCKFILE}' EXIT

mkdir -p "${CACHE}"
if [ ! -f "${SUCCESS_FILE}" ]
then
    exec 200>"${LOCKFILE}" || exit 1
    flock 200 || exit 1

    if [ ! -f "${SUCCESS_FILE}" ]
    then
        echo "Installing ${KTLINT}"
        curl -#SLf "${REPOSITORY}/releases/download/$VERSION/ktlint" > "${KTLINT}"
        chmod 755 "${KTLINT}"
        touch "${SUCCESS_FILE}"
    fi

    flock -u 200
fi

${KTLINT} $*
