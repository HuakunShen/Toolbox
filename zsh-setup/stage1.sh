# install zsh
sudo apt-get update
sudo apt-get install -y zsh git curl wget
sudo chsh -s $(which zsh)

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
