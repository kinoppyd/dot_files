#.bashrc

alias ll="ls -la"
alias grep="grep --color"
alias vim="$HOME/local/bin/vim"
alias vimrc="vim ~/.vimrc"
alias bashrc="vim ~/.bashrc"
alias resource="source ~/.bashrc"

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedaabagacad

# Perlbrew
export PERL_CPANM_OPT="--local-lib=~/perl5"
export PATH=$HOME/perl5/bin:$PATH;
export PERL5LIB=$HOME/perl5/lib/perl5:$PERL5LIB;
export PERL5LIB=$HOME/perl5/lib/perl5/darwin-thread-multi-2level:$PERL5LIB;
export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
export PATH=~/develop/haxe:$PATH
export MANPATH=/opt/local/man:$MANPATH

# Ruby Gem
export GEM_HOME=$HOME/gem
export PATH=$HOME/gem/bin:$PATH
