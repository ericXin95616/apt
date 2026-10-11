#!/bin/sh
# Add the devkit apt repository to this machine.
# Usage: curl -fsSL https://ericxin95616.github.io/apt/install.sh | sh
set -eu

url=https://ericxin95616.github.io/apt
keyring=/usr/share/keyrings/devkit.gpg

sudo=
[ "$(id -u)" -eq 0 ] || sudo=sudo

curl -fsSL "$url/devkit.gpg" | $sudo tee "$keyring" >/dev/null
echo "deb [signed-by=$keyring] $url ./" | $sudo tee /etc/apt/sources.list.d/devkit.list >/dev/null
$sudo apt-get update

echo
echo "devkit repository added. Install packages with, for example:"
echo "  sudo apt install devkit-nvim-config devkit-wezterm-config docker-cache-prune"
