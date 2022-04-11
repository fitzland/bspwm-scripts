#!/bin/bash

######################################################################################################################

sudo pacman -S wget --noconfirm --needed

echo "Getting the ArcoLinux keys from the ArcoLinux repo"

sudo wget https://github.com/endeavouros-team/repo/blob/master/endeavouros/x86_64/endeavouros-keyring-1-5-any.pkg.tar.zst -O /tmp/endeavouros-keyring-1-5-any.pkg.tar.zst 
sudo pacman -U --noconfirm --needed /tmp/endeavouros-keyring-1-5-any.pkg.tar.zst

######################################################################################################################

echo "Getting the latest endeavouros mirrors file"

sudo wget https://gitlab.com/endeavouros-filemirror/PKGBUILDS/-/raw/master/endeavouros-mirrorlist/endeavouros-mirrorlist -O /etc/pacman.d/endeavouros-mirrorlist
echo '
[endeavouros]
SigLevel = PackageRequired 
Include = /etc/pacman.d/endeavouros-mirrorlist' | sudo tee --append /etc/pacman.conf
