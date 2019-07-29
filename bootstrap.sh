#!/bin/bash

set -e

BBL_STATE=/mnt/coder/bbl-state

wget -O $CODER_BIN_DIR/bosh https://github.com/cloudfoundry/bosh-cli/releases/download/v5.5.1/bosh-cli-5.5.1-linux-amd64
chmod +x $CODER_BIN_DIR/bosh

sudo apt update && sudo apt install -y build-essential zlibc zlib1g-dev ruby ruby-dev \ 
    openssl libxslt1-dev libxml2-dev libssl-dev libreadline7 libreadline-dev \
    libyaml-dev libsqlite3-dev sqlite3

wget -O $CODER_BIN_DIR/bbl https://github.com/cloudfoundry/bosh-bootloader/releases/download/v8.1.1/bbl-v8.1.1_linux_x86-64
chmod +x $CODER_BIN_DIR/bbl

cat << EOF > /mnt/coder/bashrc.d/bosh.bashrc
export BBL_STATE_DIRECTORY=$BBL_STATE
eval "$(bbl print-env)"
EOF

chmod +x /mnt/coder/bashrc.d/bosh.bashrc

bbl -s $BBL_STATE plan