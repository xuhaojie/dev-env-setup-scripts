#!/bin/bash

## Ubuntu, Mint Linux
## Install from src git repo
#sudo apt-get install sdcc sdcc-doc sdcc-libraries sdcc-ucsim
#sudo apt-get install build-essential pkg-config autoconf automake libtool libusb-dev libusb-1.0-0-dev libhidapi-dev

sudo apt install -y sdcc

# install STM8S_StdPeriph_Lib
git clone https://github.com/xuhaojie/STM8S_StdPeriph_Lib $HOME/STM8S_StdPeriph_Lib
#git clone https://github.com/xuhaojie/STM8L10x_StdPeriph_Lib $HOME/STM8L10x_StdPeriph_Lib
#git clone https://github.com/xuhaojie/STM8TL5x_StdPeriph_Lib $HOME/STM8TL5x_StdPeriph_Lib
#git clone https://github.com/xuhaojie/STM8L15x-16x-05x-AL31-L_StdPeriph_Lib $HOME/STM8L15x-16x-05x-AL31-L_StdPeriph_Lib

