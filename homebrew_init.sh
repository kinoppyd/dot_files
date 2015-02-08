#!/bin/bash

# install homebrew
cd ~/
xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# brewfile
brew bundle
