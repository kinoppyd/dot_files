#.bashrc
EDITOR=vim

# default bashrc
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# PATH
export PATH="/usr/local/bin:$PATH"
export PREFIX="$HOME/local"
export PATH="$PREFIX/bin:$PATH"
export DEV_TOOL_HOME="$HOME/Development"

# General alias
alias bashrc="vim $HOME/.bashrc"
alias diff="colordiff"
alias grep="grep --color"
alias ll="ls -lhAG"
alias vdiff="vimdiff"
alias vimrc="vim $HOME/.vimrc"
alias resource="source $HOME/.bash_profile"
alias ssh="ssh -o ServerAliveInterval=60"

# Document
export DOCUMENT_ROOT="$HOME/Documents/daynotes"
alias daynote='vim $DOCUMENT_ROOT/`date "+%Y%m%d".md`'
alias daynotes="find $DOCUMENT_ROOT -maxdepth 1 -type f | grep '\d\d\d\d\d\d\d\d.md$' | sort -r | xargs cat | view -"

# Git
export GIT_HOME=$DEV_TOOL_HOME/git
export PATH=$GIT_HOME/contrib/diff-highlight:$PATH

# Git alias
alias g="git"
alias ga="git add"
alias gap="git add -p"
alias gc="git commit"
alias gcv="git commit -v"
alias gac="git add . && git commit -v"
alias gd="git diff"
alias gs="git status --branch --short"
alias gco="git checkout"
alias gbv="git branch --list -vv"
alias gpo="git push origin"
# Git peco alias
alias pgd="git status --short | peco | perl -pe 's/^...//' | xargs git diff"
alias pgc="git status --short | peco | perl -pe 's/^...//' | xargs git checkout"
alias pgb="git branch -a | peco | perl -pe 's/^..//'"
alias pgbc="git branch -a | peco | perl -pe 's/^..//' | xargs git checkout"
# Git config
source $GIT_HOME/contrib/completion/git-completion.bash

# Ant alias
alias cb="ant clean release"
alias cbi="ant clean release install"
alias bi="ant release install"

# ADB alias
alias atab="adb shell input keyevent KEYCODE_TAB"
alias aent="adb shell input keyevent KEYCODE_ENTER"
alias ai="adb shell input text"
alias logcat="adb logcat"

# Perlbrew
source $HOME/perl5/perlbrew/etc/bashrc

# Android
export PATH="$PATH:$DEV_TOOL_HOME/eclipse:$DEV_TOOL_HOME/sdk/tools:$DEV_TOOL_HOME/sdk/platform-tools"
export ANDROID_HOME="$HOME/Development/sdk"

# Ruby Gem
export GEM_HOME=$HOME/gem
export PATH=$GEM_HOME/bin:$PATH

# Java
export JAVA_OPTS="-Dfile.encoding=UTF-8"

# Scala
export SCALA_HOME=$HOME/local/share/scala
export PATH=$SCALA_HOME/bin:$PATH

# Play Framework
export PATH=$DEV_TOOL_HOME/play:$PATH
export PATH=$DEV_TOOL_HOME/activator:$PATH

# Haxe
export PATH=$DEV_TOOL_HOME/haxe:$PATH

# Go
export GOROOT="$HOME/local/go"
export GOPATH="$HOME/.go"
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"

# Other
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/man:$MANPATH
