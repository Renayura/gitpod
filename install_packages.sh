#!/usr/bin/env bash
#
# Script Setup Ubuntu
# Copyright (C) 2022 a Renayura <renayura@proton.me>
#

msg() {
	echo
	echo -e "\e[1;32m$*\e[0m"
	echo
}
msg "Starting install dependencies"
##----------------------------------------------------------##
sudo apt-get update && sudo apt-get upgrade -y
sudo DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --fix-missing \
    adb autoconf automake axel bc bison build-essential \
    ccache clang cmake curl expat fastboot flex g++ \
    g++-multilib gawk gcc gcc-multilib git gnupg gperf \
    htop imagemagick lib32ncurses5-dev lib32z1-dev libtinfo5 libc6-dev libcap-dev \
    libexpat1-dev libgmp-dev '^liblz4-.*' '^liblzma.*' libmpc-dev libmpfr-dev libncurses5-dev \
    libsdl1.2-dev libssl-dev libtool libxml2 libxml2-utils '^lzma.*' lzop \
    maven ncftp ncurses-dev patch patchelf pkg-config pngcrush \
    pngquant python2.7 python-all-dev re2c schedtool squashfs-tools subversion \
    texinfo unzip w3m xsltproc zip zlib1g-dev lzip \
    libxml-simple-perl libswitch-perl apt-utils zsh

# zsh
chsh -s /bin/zsh root
sh -c "$(curl -sL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

msg "Install dependencies succesfully"

##----------------------------------------------------------##

msg "Starting configurate git"

##----------------------------------------------------------##
# Git Identity
git config --global core.editor "nano"
git config --global user.name "Renayura"
git config --global user.email "renayura@proton.me"

##----------------------------------------------------------##
# Git Alias
git config --global alias.c "commit -s"
git config --global alias.cam "commit --am"
git config --global alias.ca "cherry-pick --abort"
git config --global alias.cr "cherry-pick --signoff"
git config --global alias.p "push -f"
git config --global alias.cc "cherry-pick --continue"
git config --global alias.cs "cherry-pick --skip"
git config --global alias.cp "cherry-pick"
git config --global alias.r "revert"
git config --global alias.rc "revert --continue"
git config --global alias.ra "remote add origin"
git config --global alias.rm "remote rm origin"
git config --global alias.rm "checkout"
git config --global alias.f "fetch"

##----------------------------------------------------------##
# Setup Change-id hooks
mkdir -p "$HOME"/.git-templates/hooks
git config --global init.templatedir "$HOME"/.git-templates
curl -Lo "$HOME"/.git-templates/hooks/commit-msg https://raw.githubusercontent.com/Renayura/Scripts/master/commit-msg
chmod u+x "$HOME"/.git-templates/hooks/commit-msg
msg "Git configiration succesfully"
