#!/usr/bin/bash

echo "::group:: ===$(basename "$0")==="

set -eoux pipefail

wget https://download.panic.com/mirror/Linux/Mirror-latest.rpm -O /tmp/Mirror-latest.rpm
dnf5 -y install /tmp/Mirror-latest.rpm
rm -f /tmp/Mirror-latest.rpm

echo "::endgroup::"