#!/bin/bash

#sudo apt-get install build-essential pkg-config autoconf automake libtool libusb-dev libusb-1.0-0-dev libhidapi-dev

deb_url=https://github.com/stlink-org/stlink/releases/download/v1.7.0/stlink_1.7.0-1_amd64.deb
deb_file=/tmp/stlink_1.7.0-1_amd64.deb

while [ ! -f $deb_file ]
do
	echo "download stlink install package"
	wget $deb_url -O $deb_file
done

sudo dpkg -i /tmp/stlink_1.7.0-1_amd64.deb

sudo apt install -f -y

# stm32 discovery boards, with onboard st/linkv1 ie, STM32VL.
target_file=/etc/udev/rules.d/49-stlinkv1.rules
if [ ! -f $target_file ]; then
	echo "SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"0483\", ATTRS{idProduct}==\"3744\", MODE=\"660\", GROUP=\"plugdev\", TAG+=\"uaccess\", SYMLINK+=\"stlinkv1_%n\"" | sudo tee -a $target_file
fi
# stm32 discovery boards, with onboard st/linkv2 ie, STM32L, STM32F4.
target_file=/etc/udev/rules.d/49-stlinkv2.rules
if [ ! -f $target_file ]; then
	echo "SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"0483\", ATTRS{idProduct}==\"3748\", MODE=\"660\", GROUP=\"plugdev\", TAG+=\"uaccess\", SYMLINK+=\"stlinkv2_%n\"" | sudo tee -a $target_file
fi

# stm32 nucleo boards, with onboard st/linkv2-1# ie, STM32F0, STM32F4.
target_file=/etc/udev/rules.d/49-stlinkv2-1.rules
if [ ! -f $target_file ]; then
	echo "SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"0483\", ATTRS{idProduct}==\"374b\", MODE=\"660\", GROUP=\"plugdev\", TAG+=\"uaccess\", SYMLINK+=\"stlinkv2-1_%n\"" | sudo tee -a $target_file
	echo "SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"0483\", ATTRS{idProduct}==\"3752\", MODE=\"660\", GROUP=\"plugdev\", TAG+=\"uaccess\", SYMLINK+=\"stlinkv2-1_%n\"" | sudo tee -a $target_file
fi

# stlink-v3 boards (standalone and embedded) in usbloader mode and standard (debug) mode
target_file=/etc/udev/rules.d/49-stlinkv3.rules
if [ ! -f $target_file ]; then
	echo "SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"0483\", ATTRS{idProduct}==\"374d\", MODE=\"660\", GROUP=\"plugdev\", TAG+=\"uaccess\", SYMLINK+=\"stlinkv3loader_%n\"" | sudo tee -a $target_file
	echo "SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"0483\", ATTRS{idProduct}==\"374e\", MODE=\"660\", GROUP=\"plugdev\", TAG+=\"uaccess\", SYMLINK+=\"stlinkv3_%n\"" | sudo tee -a $target_file
	echo "SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"0483\", ATTRS{idProduct}==\"374f\", MODE=\"660\", GROUP=\"plugdev\", TAG+=\"uaccess\", SYMLINK+=\"stlinkv3_%n\"" | sudo tee -a $target_file
	echo "SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"0483\", ATTRS{idProduct}==\"3753\", MODE=\"660\", GROUP=\"plugdev\", TAG+=\"uaccess\", SYMLINK+=\"stlinkv3_%n\"" | sudo tee -a $target_file
fi

sudo udevadm control --reload-rules && sudo udevadm trigger