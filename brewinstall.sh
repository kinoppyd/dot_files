#!/bin/sh# update homebrew
brew update
brew upgrade

# tap
brew tap homebrew/versions
brew tap caskroom/cask
brew tap homebrew/binary
brew tap thoughtbot/formulae

# install packages
brew install wget
brew install curl
brew install git
brew install git-now
brew install tig
brew install tree
brew install watch
brew install colordiff
brew install htop-osx
brew install --default-names gnu-tar
brew install openssl
brew install libyaml
brew install nkf
brew install ag

# commands
brew install dfc
brew tap peco/peco
brew install peco
brew tap motemen/ghq
brew install ghq

# develop
brew install cmake
brew install ctags
brew install sqlite
brew install ngrep
brew install mercurial

# rbenv
brew install rbenv
brew install ruby-build
brew install rbenv-gemset
brew install rbenv-gem-rehash

# node.js
brew install npm

# database
brew install mysql
brew install redis

# editor
brew install vim
brew install markdown

# terminal
brew install tmux
brew install zsh
brew install zsh-completions

# languages
brew install sbt
brew install jq

# jokes
brew install sl
brew install fortune
brew install cowsay
brew install cmatrix

# Brew Cask
brew install brew-cask
brew cask update

# install cask packages
#cask install item2
brew cask install virtualbox
brew cask install vagrant
brew cask install dropbox
brew cask install evernote
brew cask install yorufukurou
brew cask install google-chrome
brew cask install kobito

# cleanup
brew cleanup
