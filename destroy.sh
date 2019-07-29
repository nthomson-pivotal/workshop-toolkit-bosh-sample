#!/bin/bash

set -e

source /mnt/coder/bashrc.d/bosh.bashrc

export PATH=$PATH:$CODER_BIN_DIR

bbl -d destroy --no-confirm