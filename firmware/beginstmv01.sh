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
git clone https://github.com/libopencm3/libopencm3.git ~/stm32f103c8t6/libopencm3
wget https://sourceforge.net/projects/freertos/files/FreeRTOS/V10.2.0/FreeRTOSv10.2.0.zip/download -d /home/pi/stm32f103c8t6/rtos/
unzip ~/stm32f103c8t6/rtos/FreeRTOSv10.0.1.zip /pi/stm32f103c8t6/rtos/

cd /opt

cd ~/stm32f103c8t6
make
echo finished script