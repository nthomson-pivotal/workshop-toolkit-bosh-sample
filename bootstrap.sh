#!/bin/bash

set -e

BBL_STATE_DIRECTORY=/mnt/coder/bbl-state

mkdir -p $BBL_STATE_DIRECTORY

wget -q -O $CODER_BIN_DIR/bosh https://github.com/cloudfoundry/bosh-cli/releases/download/v5.5.1/bosh-cli-5.5.1-linux-amd64
chmod +x $CODER_BIN_DIR/bosh

sudo apt update && sudo apt install -y build-essential zlibc zlib1g-dev ruby ruby-dev \
    openssl libxslt1-dev libxml2-dev libssl-dev libreadline7 libreadline-dev \
    libyaml-dev libsqlite3-dev sqlite3

wget -q -O $CODER_BIN_DIR/bbl https://github.com/cloudfoundry/bosh-bootloader/releases/download/v8.1.1/bbl-v8.1.1_linux_x86-64
chmod +x $CODER_BIN_DIR/bbl

export BBL_ENV_NAME=$(echo "$WORKSHOP_ID" | md5sum  | awk '{print $1}' | cut -c1-8)

cat << EOF > /mnt/coder/bashrc.d/bosh.bashrc
export BBL_ENV_NAME=$BBL_ENV_NAME
export BBL_STATE_DIRECTORY=$BBL_STATE_DIRECTORY
export BBL_IAAS=aws

if [ -f "$BBL_STATE_DIRECTORY/bbl-state.json" ]; then
  eval "\$(bbl print-env)"
fi
EOF

chmod +x /mnt/coder/bashrc.d/bosh.bashrc

export PATH=$PATH:$CODER_BIN_DIR

bbl -d plan --iaas aws

bbl -d up --iaas aws