#!/bin/bash

#creates backup to ~/old_bundle and then uses that backup to clone all the plugins
mv vim/bundle ~/old_bundle
mkdir vim/bundle

set -e

plugins=`ls ~/old_bundle`
for plugin in $plugins
do
    echo "Processing $plugin..."
    remote=`cd ~/old_bundle/$plugin && git config remote.origin.url`

    git submodule add $remote vim/bundle/$plugin
    git commit -m "Added $plugin"
done
