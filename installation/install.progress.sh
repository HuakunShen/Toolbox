#!/bin/bash
wget https://raw.githubusercontent.com/HuakunShen/Toolbox/master/bin/progress
wget https://github.com/HuakunShen/Toolbox/blob/master/man/progress.1.gz?raw=true --output-document=progress.1.gz
sudo mv ./progress.1.gz /usr/share/man/man1
chmod a+x ./progress
sudo mv ./progress /usr/local/bin
rm ./progress
rm ./progress.1.gz

echo done
