#!/bin/bash
install_dirname="install_videoLen_$RANDOM"
mkdir $install_dirname
cd $install_dirname
wget https://raw.githubusercontent.com/HuakunShen/Toolbox/master/bin/videoLen
chmod a+x ./videoLen
sudo mv ./videoLen /usr/local/bin
cd ..
rmdir $install_dirname
echo done