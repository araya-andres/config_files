#!/bin/bash
PATH_TO_CONFIG_FILES=${1-$PWD}
cd

# bash
rm .zshrc
ln -s $PATH_TO_CONFIG_FILES/zsh/zshrc .zshrc

# git
rm .gitconfig
ln -s $PATH_TO_CONFIG_FILES/git/gitconfig .gitconfig

# octave
rm .octaverc
ln -s $PATH_TO_CONFIG_FILES/octave/octaverc .octaverc

# tmux
rm .tmux.conf
ln -s $PATH_TO_CONFIG_FILES/tmux/tmux.conf .tmux.conf

# nvim
mkdir .vim_undo_dir
mkdir .config
cd .config
ln -s $PATH_TO_CONFIG_FILES/nvim
cd $PATH_TO_CONFIG_FILES/nvim/pack/minpac/opt
git submodule update --init --recursive
