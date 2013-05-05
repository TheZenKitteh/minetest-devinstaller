#!/usr/bin/env bash
## GUI based installer
##
## Status NOT FINISHED
## NOT TESTED
## I don't even like GUI based installers...

# install bash gui
gksudo dpkg -i easybashgui-5.1.2_20130112-1_i386.deb

source easybashgui

# Obtain required dependencies
ok_message "Dependencies will be installed after you click ok.."
gksudo apt-get install git-core build-essential libirrlicht-dev cmake libbz2-dev libpng12-dev libjpeg8-dev libxxf86vm-dev libgl1-mesa-dev libsqlite3-dev libogg-dev libvorbis-dev libopenal-dev

# Obtain minetest and minetest_game
ok_message "Minetest dev sources will be downloaded after you click ok.."
git clone git://github.com/celeron55/minetest.git
cd minetest/games
git clone git://github.com/celeron55/minetest_game.git
git clone git://github.com/minetest/common.git
cd ..

# Configure and compile
ok_message "Minetest will be compiled after you click ok..\n This can take awhile so wait for next message"
cmake . -DRUN_IN_PLACE=1
cd src
make -j2

# Assuming no issues minetest is now compiled
ok_message "Assuming no issues, Minetest is now compiled. \n You should now be able to run it from the bin/ folder"

# Cleaning up
gksudo dpkg -r easybashgui-5.1.2
clean_temp
