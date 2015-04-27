#!/bin/bash
# make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# full - copy to dotfiles, make backup, symlink
# backup - 
dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc bash_profile vimrc vim zshrc zshenv zprofile gitconfig gitignore_global"  # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then move to dotfiles and create symlinks 
for file in $files; do
    if [[ $1 == "full" ]]; then
        echo "Make a backup of $file in $olddir"
        cp -r ~/.$file $olddir/$file
        echo "Move $file to $dir"
        mv ~/.$file $dir/$file
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$file
    elif [[ $1 == "backup" ]]; then
        echo "Backing up dotfiles to $olddir"
        cp -r $dir/$file $olddir/$file
    elif [[ $1 == "install" ]]; then
        echo "Move current dotfiles to $olddir"
        mv ~/.$file $olddir/$file
        echo "symlink to all dotfiles."
        ln -s $dir/$file ~/.$file
    fi
done
