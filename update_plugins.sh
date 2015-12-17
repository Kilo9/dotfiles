#!/bin/bash

# UPDATES ALL THE INSTALLED PLUGINS

url=~/.vim/bundle
plugins=`ls $url`
red=`tput setaf 1`

for plugin in $plugins
do
    echo "${red}Updating $plugin"
    cd $url/$plugin && git submodule update
done
