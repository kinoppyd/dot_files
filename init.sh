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

init_vim_config()
{
    if [ ! -e $HOME/.vim/conf ]
    then
        mkdir $HOME/.vim
        ln -s $PWD/.vim/conf/ $HOME/.vim/conf
        echo 'vim config link created'
    else
        echo '.vim/conf dir already exists'
    fi
}

build_vim_config()
{
  type envsubst > /dev/null
  if [ $? = 0 ];
  then
    envsubst < $PWD/.vim/conf/plugins.vim.template > $PWD/.vim/conf/plugins.vim
  else
    echo 'envsubst command is not found'
    echo 'you should create .vim/conf/plugins.vim manually'
  fi
}

init_vim_plugins()
{
    if [ ! -e $HOME/.cache/dein ]
    then
        mkdir $HOME/.vim
        curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
        sh dein_installer.sh $HOME/.cache/dein
        echo 'install dein complete'
    else
        echo '.vim dir already exists and dein installed'
    fi
}

init_neovim_config()
{
  mkdir .config/nvim
  if [ ! -e .config/nvim/conf ]
  then
    ln -s $PWD/.vim/conf .config/nvim/conf
  fi
  if [ ! -e .config/nvim/init.vim ]
  then
    ln -s $PWD/.vimrc .config/nvim/init.vim
  fi
}

init_tmux_plugins()
{
    if [ ! -e $HOME/.tmux ]
    then
      mkdir -p $HOME/.tmux/plugins
      git clone --depth 1 https://github.com/erikw/tmux-powerline.git $HOME/.tmux/plugins/tmux-powerline || exit 1
      echo 'create tmux plugin dir & clone powerline'
    else
      echo '.tmux/plugins dir already exists'
    fi
}

clone_git_repository()
{
  if [ ! -e $HOME/repositories ]
  then
    mkdir $HOME/repositories
  fi

  if [ ! -e $HOME/repositories/git ]
  then
    echo 'clone git/git repository'
    git clone --depth 1 https://github.com/git/git $HOME/repositories/git
    cd $HOME/repositories/git/contrib/diff-highlight
    make
    cd -

  else
    echo 'git tools already exists'
  fi
}

add_global_zshrc()
{
  touch $HOME/.zshrc

  grep "source $HOME/.bashrc_global" $HOME/.zshrc
  if [ $? = 1 ];
  then
    echo "source $HOME/.bashrc_global" >> $HOME/.zshrc
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
init_vim_config
init_vim_plugins
init_neovim_config
build_vim_config
clone_git_repository
add_global_bashrc
git clone https://github.com/anyenv/anyenv ~/.anyenv
