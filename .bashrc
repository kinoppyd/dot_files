#.bashrc

alias ll="ls -la"
alias grep="grep --color"
alias vim="$HOME/local/bin/vim"
alias vimrc="vim $HOME/.vimrc"
alias bashrc="vim $HOME/.bashrc"
alias resource="source $HOME/.bash_profile"

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedaabagacad

# Perlbrew
export PERL_CPANM_OPT="--local-lib=~/perl5"
export PATH=$HOME/perl5/bin:$PATH;
export PERL5LIB=$HOME/perl5/lib/perl5:$PERL5LIB;
export PERL5LIB=$HOME/perl5/lib/perl5/darwin-thread-multi-2level:$PERL5LIB;

# Ruby Gem
export GEM_HOME=$HOME/gem
export PATH=$HOME/gem/bin:$PATH

# Haxe
export PATH=$HOME/develop/haxe:$PATH

# Other
export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
export MANPATH=/opt/local/man:$MANPATH
