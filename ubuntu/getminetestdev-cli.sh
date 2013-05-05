#!/bin/bash

echo "Installing Dependencies.."
sudo apt-get install git-core build-essential libirrlicht-dev cmake libbz2-dev libpng12-dev libjpeg8-dev libxxf86vm-dev libgl1-mesa-dev libsqlite3-dev libogg-dev libvorbis-dev libopenal-dev

echo "Obtaining latest Minetest Dev"
git clone git://github.com/celeron55/minetest.git

echo "Obtaining latest minetest_game"
cd minetest/games
git clone git://github.com/celeron55/minetest_game.git
git clone git://github.com/minetest/common.git
cd ..

echo "Configuring and compiling.."
cmake . -DRUN_IN_PLACE=1
cd src
make -j2

echo "All done. If no issues or fatal errors you can run minetest now from the bin/ folder"
