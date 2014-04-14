#.bashrc
EDITOR=vim

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedaabagacad
# default bashrc
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# PATH
export PATH="/usr/local/bin:$PATH"
export DEV_TOOL_HOME="$HOME/Development"

# General alias
alias abash="source ~/.bash_profile"
alias bashrc="vim $HOME/.bashrc"
alias diff="colordiff"
alias grep="grep --color"
alias ll="ls -la"
alias vdiff="vimdiff"
alias vim="$HOME/local/bin/vim"
alias vimrc="vim $HOME/.vimrc"
alias resource="source $HOME/.bash_profile"
alias ssh="ssh -o ServerAliveInterval=60"

# Git alias
alias ga="git add"
alias gap="git add -p"
alias gc="git commit"
alias gcv="git commit -v"
alias gd="git diff"
alias gs="git status"
alias gco="git checkout"
alias grod="git fetch && git rebase -i origin/develop"
# Git config
source $DEV_TOOL_HOME/git/contrib/completion/git-completion.bash

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
export PERL_CPANM_OPT="--local-lib=~/perl5"
export PATH=$HOME/perl5/bin:$PATH;
export PERL5LIB=$HOME/perl5/lib/perl5:$PERL5LIB;
export PERL5LIB=$HOME/perl5/lib/perl5/darwin-thread-multi-2level:$PERL5LIB;

# Android
export PATH="$PATH:$DEV_TOOL_HOME/eclipse:$DEV_TOOL_HOME/sdk/tools:$DEV_TOOL_HOME/sdk/platform-tools"
export ANDROID_HOME="$HOME/Development/sdk"

# Ruby Gem
export GEM_HOME=$HOME/gem
export PATH=$HOME/gem/bin:$PATH

# Haxe
export PATH=$DEV_TOOL_HOME/haxe:$PATH

# Other
export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
export MANPATH=/opt/local/man:$MANPATH
