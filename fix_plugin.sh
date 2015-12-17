#!/bin/bash

# REMOVES AN INCORRECTLY INSTALLED PLUGIN AND REINSTALLS IT CORRECTLY
# $1 -- name of the plugin

cd ~/.vim/bundle
cd $1
BICya="\e[1;96m';]";
remote=`git config remote.origin.url`
echo "$remote"

if [ "$1" != "*" ]
then
    rm -rf vim/bundle/$1
    sh ~/dotfiles/add_plugin.sh $remote $1
    echo "${BICya}FIXED PLUGIN $1"
fi
