#!/bin/bash

set -e

export PATH=$PATH:$CODER_BIN_DIR

echo $PATH

source /mnt/coder/bashrc.d/bosh.bashrc

bbl -d destroy --no-confirm