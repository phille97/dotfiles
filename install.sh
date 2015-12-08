#!/usr/bin/env sh


# Install Pretzo!
git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
echo "####\n##  Viva La Pretzo! (Do you have oh-my-zsh installed? Check this: http://goo.gl/TH2bEy)\n####"

# Sync home folder
./sync_home.sh

# Install Vundle for Vim
git clone --quiet https://github.com/VundleVim/Vundle.vim.git ./home/.vim/bundle/Vundle.vim
echo "####\n## VundleVim has been added!\n## Launch vim and run :PluginInstall\n####"

