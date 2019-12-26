#!/usr/bin/env bash

##
#	Runs the two scripts one after the other for installing brew packages and necessary sublime settings
##

# Install the xcode command line tools
xcode-select --install

# Run the brew script
./brew.sh

# Run the zsh install script
./zsh.sh

# Run the Sublime script
./sublime.sh