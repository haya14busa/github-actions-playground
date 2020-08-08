#!/bin/bash

TEMP="${REVIEWDOG_TEMPDIR}"
VERSION="${INPUT_REVIEWDOG_VERSION}"

echo '🐶 Installing reviewdog ... https://github.com/reviewdog/reviewdog'

INSTALL_SCRIPT='https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh'
if [ "${VERSION}" == 'nightly' ] ; then
  INSTALL_SCRIPT='https://raw.githubusercontent.com/reviewdog/nightly/master/install.sh'
  VERSION='latest'
fi

mkdir -p "${TEMP}/reviewdog/bin"
echo "::add-path::${TEMP}/reviewdog/bin"
curl -sfL "${INSTALL_SCRIPT}" | sh -s -- -b "${TEMP}/reviewdog/bin" "${VERSION}"
