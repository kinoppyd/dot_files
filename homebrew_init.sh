#!/bin/bash

# install homebrew
cd ~/
xcode-select --install
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew doctor

# brewfile
brew bundle
