#!/bin/bash
echo 'start update, upgrade, installs (internet needed) script'
sudo apt-get update
sudo apt-get upgrade -y
time sudo apt-get install \
vim vim-gtk \
automake \
clamav \
filezilla \
git-core \
gparted \
xorg xorg-dev \
cmake -y
sudo apt --fix-broken install -y
sudo apt-get install \
libusb-1.0 \
libgtk-3-dev \
devscripts \
minicom \
hexedit -y
sudo apt-get install \
codeblocks \
python-pip \
python-gi-cairo -y
pip install sense-emu
sudo m-a prepare
git clone https://github.com/texane/stlink.git
mkdir stlink/build
cmake -DCMAKE_BUILD_TYPE=Debug ~/stlink/
sudo make install -C ~/
sudo ldconfig
st-info --version
st-info --probe
st-flash
git clone https://github.com/ve3wwg/stm32f103c8t6.git ~/stm32f103c8t6
git clone https://github.com/libopencm3/libopencm3.git ~/stm32f103c8t6/libopencm3
wget https://sourceforge.net/projects/freertos/files/FreeRTOS/V10.2.0/FreeRTOSv10.2.0.zip/download -O /home/username/stm32f103c8t6/rtos/FreeRTOSv10.2.0.zip
unzip ~/stm32f103c8t6/rtos/FreeRTOSv10.2.0.zip -d ~/stm32f103c8t6/rtos/
sed -i -e 's/FreeRTOSv10.0.1/FreeRTOSv10.2.0/g' ~/stm32f103c8t6/rtos/Project.mk
wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2018q4/gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2 \
-O /home/username/Downloads/gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2
tar xjf ~/Downloads/gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2
sudo mv gcc-arm-none-eabi-8-2018-q4-major /opt/gcc-arm
export PATH="/opt/gcc-arm/bin:$PATH"
echo 'export PATH="/opt/gcc-arm/bin:$PATH"' >> .profile
make -C ~/stm32f103c8t6
