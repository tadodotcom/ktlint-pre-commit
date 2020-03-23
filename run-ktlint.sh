#!/usr/bin/env sh

REPOSITORY="https://github.com/pinterest/ktlint"
VERSION=0.41.0
CACHE=".cache"
KTLINT="${CACHE}/ktlint-${VERSION}"

mkdir -p "${CACHE}"
if [ ! -f "${KTLINT}" ]
then
    curl -SLf "${REPOSITORY}/releases/download/$VERSION/ktlint" > "${KTLINT}"
    chmod 755 "${KTLINT}"
fi

changed_kotlin_files=$(git diff --cached --name-only --diff-filter=ACMR | grep ".*kt$" )
echo $changed_kotlin_files
${KTLINT} changed_kotlin_files
