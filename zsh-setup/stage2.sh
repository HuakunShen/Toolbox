# install p10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc

# get existing setting for zshrc related to ohmyzsh and p10k
wget -O ~/.zshrc https://raw.githubusercontent.com/HuakunShen/Toolbox/master/zsh-setup/.zshrc

wget -O ~/.p10k.zsh https://raw.githubusercontent.com/HuakunShen/Toolbox/master/zsh-setup/.p10k.zsh


