#!/bin/bash

usage="Usage: ./plugin.sh git\n./plugin.sh git myplugin\n./plugin.sh add https://github.com/user/plugin"

if [[ $# -eq 0 ]]; then #incorrect usage
    echo -e $usage
    exit 1
fi

#exit if any returns with nonzero status
set -e

dir=`pwd`
bundle_dir=$dir/vim/bundle

if [[ $1 = "git" ]]; then #want to add plugin as submodule to repo when it is already downloaded

    if [[ $# -eq 2 ]]; then #they provide the name of a plugin
        echo "Adding $2 to dotfiles repo..."

        echo "$bundle_dir/$2/.git"
        if [ -d $bundle_dir/$2/.git ]; then #it is a git repository
            remote=`cd $bundle_dir/$2 && git config remote origin.url`
            echo $remote
            rm -rf $bundle_dir/$2
            git submodule add $remote $bundle_dir/$2
            echo "Done adding $2"
        else
            echo "<ERR> $2 is not a valid plugin git repo"
        fi

    else

        #does for all plugins
        plugins=`ls $bundle_dir`
        for plugin in $plugins
        do
            if [ -d $bundle_dir/$plugin/.git ]; then
                echo "Processing $plugin..."
                remote=`cd $bundle_dir/$plugin && git config remote.origin.url`
                git submodule add $remote $bundle_dir/$plugin
                echo "Done adding $plugin!"
                #git commit -m "Added $plugin"
            else
                echo "<ERR> $plugin is not a git repo!"
            fi
        done
    fi
    
elif [[ $1 = "add" ]]; then #user wants to download and add from scratch

    #Error checking
    if [[ $# -eq 1 ]]; then
        echo "Usage: ./plugin.sh add https://github.com/user/plugin"
        exit 1
    fi

    #Download and add
    echo "downloading and adding plugin from: $2"
    git submodule add $2 $bundle_dir
else
    echo -e $usage
fi
