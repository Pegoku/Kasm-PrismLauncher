#!/usr/bin/env bash
set -ex

# 
# mkdir -p /home/kasm-user/prism
# tar -xf /dockerstartup/install/prism/PrismLauncher-portable.tar.gz --directory=/home/kasm-user/prism
# apt update
# apt install -y libqt5
# 
apt update
# apt install -y libqt5*
apt install -y qt5*
apt install -y unzip
wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.deb -O /home/kasm-user/prism/java17.deb
apt install -y /home/kasm-user/prism/java17.deb
# systemctl start snapd
# snap install /home/kasm-user/prism/prismlauncher_6.0_amd64.snap
# apt install -y flatpak
# flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# flatpak install /home/kasm-user/prism/PrismLauncher.flatpak -y
# apt install -y qt5*
# # apt install -y libqt5*
# # apt install -y libqt5*
# apt-get install software-properties-common
# # apt-get install gcc-4.9
# apt-get upgrade libstdc++6
# apt install glibc-source -y
# apt install -y /home/kasm-user/prism/prismlauncher_6.0-1_amd64.deb

# Add desktop icon
# cp /usr/share/applications/net.minetest.minetest.desktop $HOME/Desktop/
# chmod +x $HOME/Desktop/net.minetest.minetest.desktop

# # Wrap game bin for VGL support
# cat >/usr/bin/minetest <<EOL
# #!/usr/bin/env bash
# if [ -f /opt/VirtualGL/bin/vglrun ] && [ ! -z "\${KASM_EGL_CARD}" ] && [ ! -z "\${KASM_RENDERD}" ] && [ -O "\${KASM_RENDERD}" ] && [ -O "\${KASM_EGL_CARD}" ] ; then
#     echo "Starting Minetest with GPU Acceleration on EGL device \${KASM_EGL_CARD}"
#     vglrun -d "\${KASM_EGL_CARD}" /usr/games/minetest "\$@"
# else
#     echo "Starting Minetest"
#     /usr/games/minetest "\$@"
# fi
# EOL
# /opt/PrismLauncher

# # Cleanup
# apt-get autoclean
# rm -rf \
#     /var/lib/apt/lists/* \
#     /var/tmp/* \
#     /tmp/*