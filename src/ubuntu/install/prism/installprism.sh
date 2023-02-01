#!/usr/bin/env bash
set -ex

apt update
apt install -y qt5*
apt install -y unzip
wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.deb -O /home/kasm-user/prism/java17.deb
apt install -y /home/kasm-user/prism/java17.deb
