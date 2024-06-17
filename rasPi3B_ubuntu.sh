#!/bin/bash

sudo apt install raspi-config -y
sudo apt install lm-sensors

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt install xterm -y
sudo apt install codeblocks

# установка бибилиотеки PIGPIO
wget https://github.com/joan2937/pigpio/archive/master.zip
unzip master.zip
cd pigpio-master
make
sudo make install