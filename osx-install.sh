#!/usr/bin/env sh


# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
./.brew

# Install RVM
curl -L https://get.rvm.io | bash -s stable --ruby

# OS X defaults
./.osx

# Install other stuff (Not specific for OSX)
./sync_home.sh

# change default shell to zsh
chsh -s /bin/zsh

# Mac specific ZSH aliases
echo "alias vim='mvim'" >> "$HOME/.zshrc"
echo "alias say_good='say -v Good ooooooooooooooooooooooooooooooooooooooooooooooooooo'" >> "$HOME/.zshrc"
echo "alias say_bad='say -v Bad ooooooooooooooooooooooooooooooooooooooooooooooooooo'" >> "$HOME/.zshrc"

