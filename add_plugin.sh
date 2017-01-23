#!/bin/bash

# ADD A NEW PLUGIN USING PATHOGEN AND COMMITTING
# $1 -- git url
# $2 -- plugin name=url.end_of.without_ext

if [ "$#" -ne 2 ]; then
    echo "Usage: <git url> <plugin name=url.end_of.without_ext>" >&2
    exit 1
fi

url=./vim/bundle
red=`tput setaf 1`

git submodule init
git submodule add $1 $url/$2

echo
read -p "${red}Do you want to commit? y/n?" yn
echo
case $yn in
    [Yy]* ) git commit -m "Added $2";;
    * ) echo "changes staged...";;
esac
echo
