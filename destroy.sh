#!/bin/bash

set -e

sudo apt update && sudo apt install -y build-essential zlibc zlib1g-dev ruby ruby-dev \
    openssl libxslt1-dev libxml2-dev libssl-dev libreadline7 libreadline-dev \
    libyaml-dev libsqlite3-dev sqlite3

env

export PATH=$PATH:/mnt/coder/bin

echo $PATH

source /mnt/coder/bashrc.d/bosh.bashrc

bbl -d destroy --no-confirm