#!/bin/bash

set -e

#mkdir -p ${EXTENSIONS_DIR}/yaml \
#    && curl -JLs --retry 5 https://marketplace.visualstudio.com/_apis/public/gallery/publishers/redhat/vsextensions/vscode-yaml/latest/vspackage | bsdtar --strip-components=1 -xf - -C ${EXTENSIONS_DIR}/yaml extension