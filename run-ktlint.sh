#!/usr/bin/env sh

REPOSITORY="https://github.com/pinterest/ktlint"
VERSION=0.41.0
CACHE=".cache"
KTLINT="${CACHE}/ktlint-${VERSION}"

mkdir -p "${CACHE}"
if [ ! -f "${KTLINT}" ]
then
    echo "Installing ${KTLINT}"
    curl -#SLf "${REPOSITORY}/releases/download/$VERSION/ktlint" > "${KTLINT}"
    chmod 755 "${KTLINT}"
fi

${KTLINT} $*
