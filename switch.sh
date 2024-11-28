#!/bin/sh

set -eo pipefail

clear
nix fmt
echo ""
sudo nix --extra-experimental-features "nix-command flakes" run 
exit 0
