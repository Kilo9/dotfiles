#!/bin/bash

# ADD A NEW PLUGIN USING PATHOGEN AND COMMITTING
# $1 -- git url
# $2 -- plugin name=url.end_of.without_ext

cd ~/.vim/bundle

git submodule init
git submodule add $1 ./$2
git commit -m "Added $2"
