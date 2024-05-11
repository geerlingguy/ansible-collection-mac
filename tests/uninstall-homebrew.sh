#!/bin/bash
#
# Uninstalls Homebrew using the official uninstall script.

# Download and run the uninstall script.
curl -sLO https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh
chmod +x ./uninstall.sh
sudo ./uninstall.sh --force


# Clean up Homebrew directories.
system_arch=$(uname -p)
case $system_arch in
    arm)
        sudo rm -rf /opt/homebrew
    ;;
    *)
        sudo rm -rf /usr/local/Homebrew
        sudo rm -rf /usr/local/Caskroom
        sudo rm -rf /usr/local/bin/brew
    ;;
esac
