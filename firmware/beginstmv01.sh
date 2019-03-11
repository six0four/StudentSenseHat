#!/bin/bash
echo 'start update, upgrade, installs (internet needed) script'
sudo apt-get update
sudo apt-get upgrade -y
time sudo apt-get install \
vim vim-gtk \
automake \
codeblocks \
arduino \
clamav \
filezilla \
git-core \
gparted \
xorg xorg-dev \
xscreensaver -y
git clone https://github.com/ve3wwg/stm32f103c8t6.git ~/stm32f103c8t6
cd /opt
echo finished script