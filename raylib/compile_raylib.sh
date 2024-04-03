#!/bin/bash

RAYLIB_REPO=../../raylib

if [ -d $RAYLIB_REPO ]; then
	rm -rf $RAYLIB_REPO
fi

# Install required tools
sudo apt install build-essential git cmake
# Install required libraries
sudo apt install xorg-dev libasound2-dev libx11-dev libxrandr-dev libxi-dev libgl1-mesa-dev libglu1-mesa-dev libxcursor-dev libxinerama-dev libwayland-dev libxkbcommon-dev

git clone https://github.com/raysan5/raylib.git -- $RAYLIB_REPO
cd $RAYLIB_REPO/src
# make PLATFORM=PLATFORM_DESKTOP                       # To make the static version.
# make PLATFORM=PLATFORM_DESKTOP RAYLIB_LIBTYPE=SHARED # To make the dynamic shared version.
make PLATFORM=PLATFORM_WEB # To make web version.
sudo make install          # Static version.
# sudo make install RAYLIB_LIBTYPE=SHARED # Dynamic shared version.
