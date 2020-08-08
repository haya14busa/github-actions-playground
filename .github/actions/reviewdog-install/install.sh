#!/bin/bash

TEMP=$1
VERSION=$2

echo "VERSION: ${VERSION}"

INSTALL_SCRIPT='https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh'
if [ "${VERSION}" == 'nightly' ] ; then
  INSTALL_SCRIPT='https://raw.githubusercontent.com/reviewdog/nightly/master/install.sh'
  VERSION='latest'
fi

mkdir -p "${TEMP}/reviewdog/bin"
echo "::add-path::${TEMP}/reviewdog/bin"
curl -sfL "${INSTALL_SCRIPT}" | sh -s -- -b "${TEMP}/reviewdog/bin" "${VERSION}"
