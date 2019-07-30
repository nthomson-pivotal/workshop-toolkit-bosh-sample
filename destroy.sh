#!/bin/bash

set -e

export PATH=$PATH:/mnt/coder/bin

echo $PATH

source /mnt/coder/bashrc.d/bosh.bashrc

bbl -d destroy --no-confirm