#!/bin/bash

# ADD A NEW PLUGIN USING PATHOGEN AND COMMITTING
# $1 -- git url
# $2 -- plugin name=url.end_of.without_ext

url=~/.vim/bundle
red=`tput setaf 1`

git submodule init
git submodule add $1 $url/

echo
read -p "${red}Do you want to commit? y/n? " yn
echo
case $yn in
    [Yy]* ) git commit -m "Added $2";;
        * ) echo "changes staged...";;
esac
echo
