#!/bin/bash

TEMP=$1
VERSION=$2

INSTALL_SCRIPT='https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh'
if [ "${VERSION}" = 'nightly' ] ; then
  INSTALL_SCRIPT='https://raw.githubusercontent.com/reviewdog/nightly/master/install.sh'
  VERSION='latest'
fi

mkdir -p "${TEMP}/reviewdog/bin"
echo "::add-path::${TEMP}/reviewdog/bin"
curl -sfL https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | \
  sh -s -- -b "${TEMP}/reviewdog/bin" "${VERSION}"
