#!/bin/bash

source ./compile_raylib.sh
cd -

EMSDK_REPO=../../emsdk
if [ -d $EMSDK_REPO ]; then
	rm -rf $EMSDK_REPO
fi

# Get the emsdk repo
git clone https://github.com/emscripten-core/emsdk.git -- $EMSDK_REPO

# Enter that directory
cd $EMSDK_REPO

# Fetch the latest version of the emsdk (not needed the first time you clone)
git pull

# Download and install the latest SDK tools.
./emsdk install latest

# Make the "latest" SDK "active" for the current user. (writes .emscripten file)
./emsdk activate latest

# Activate PATH and other environment variables in the current terminal
source ./emsdk_env.sh

cd $RAYLIB_REPO/src
make -e PLATFORM=PLATFORM_WEB -B

echo "Now you can cd into raylib/examples/, fix Makefile as described above and launch make -e PLATFORM=PLATFORM_WEB -B again.
After that you would be able to start python3 -m http.server in that directory, navigate to http://0.0.0.0:8000/ in your browser and see examples."

echo "make -e PLATFORM=PLATFORM_WEB -B && python3 -m http.server 8000"
