#!/bin/sh

set -eo pipefail

clear
echo ""
sudo nix --extra-experimental-features "nix-command flakes" run


exit 0
