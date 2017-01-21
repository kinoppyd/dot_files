#!/bin/bash

self=`basename $0`
dot_files=`ls -A`
current_dir=`pwd`

link()
{
    link_file=$1
    if [ $0 = $link_file ]
    then
        return 1
    fi

    if ! is_dot_file $link_file
    then
        return 1
    fi

    if [ ! -e $HOME/$link_file ]
    then
        echo "create link $link_file"
        ln -s $current_dir/$link_file $HOME/$link_file
    else
        echo "don't create link $link_file"
        return 1
    fi
}

is_dot_file()
{
    target_file=$1
    if [[ $target_file =~ ^\. ]] && [ $target_file != '.git' ]
    then
        return 0
    else
        return 1
    fi
}

init_vim_plugins()
{
    if [ ! -e $HOME/.vim/dein ]
    then
        mkdir $HOME/.vim
        ln -s .vim/conf/ $HOME/.vim/conf
        curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
        sh dein_installer.sh $HOME/.vim/dein
        echo 'install dein complete'
    else
        echo '.vim dir already exists and dein installed'
    fi
}

init_tmux_plugins()
{
    if [ ! -e $HOME/.tmux ]
    then
      mkdir -p $HOME/.tmux/plugins
      git clone https://github.com/erikw/tmux-powerline.git $HOME/.tmux/plugins/tmux-powerline || exit 1
      echo 'create tmux plugin dir & clone powerline'
    else
      echo '.tmux/plugins dir already exists'
    fi
}

clone_git_repository()
{
  if [ ! -e $HOME/Development ]
  then
    mkdir $HOME/Development
  fi

  if [ ! -e $HOME/Development/git ]
  then
    echo 'clone git/git repository'
    git clone https://github.com/git/git $HOME/Development/git
  else
    echo 'git tools already exists'
  fi
}

add_global_bashrc()
{
  grep "source $HOME/.bashrc_global" $HOME/.bashrc
  if [ $? = 1 ];
  then
    echo "source $HOME/.bashrc_global" >> $HOME/.bashrc
    echo "append bashrc_global"
  else
    echo "bashrc_global already appended"
  fi
}

for dot_file in $dot_files
do
    if [ $dot_file != $self ]
    then
        link $dot_file
    fi

done
init_vim_plugins
clone_git_repository
add_global_bashrc
