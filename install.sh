#!/usr/bin/env zsh

# Set zsh as default shell
chsh -s /bin/zsh

# Install Pretzo
PRETZO_DIR="${ZDOTDIR:-$HOME}/.zprezto"
if [ ! -d "$PRETZO_DIR" ]; then
    echo "Installing pretzo..."
    git clone --quiet --recursive https://github.com/sorin-ionescu/prezto.git $PRETZO_DIR
    setopt EXTENDED_GLOB
    for rcfile in $PRETZO_DIR/runcoms/^README.md(.N); do
      ln -s "$rcfile" "~/.${rcfile:t}"
    done
fi

# Sync home folder
rsync -av --exclude '.git'  home/ ~/

# Install Vundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    echo "Installing Vundle..."
    git clone --quiet --recursive https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Install Vundle Plugins
vim +PluginInstall +qall

# YCM stuff needs to be compiled
(cd ~/.vim/bundle/YouCompleteMe && ./install.py --clangd-completer --go-completer --ts-completer)
