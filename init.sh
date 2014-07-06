#!/bin/bash

self=`basename $0`
dot_files=`ls -A`
current_dir=`pwd`

link()
{
    link_file=$1
    if [ $0 == $link_file ]
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
    if [ ! -e $HOME/.vim/bundle/vundle ]
    then
        mkdir $HOME/.vim
        mkdir $HOME/.vim/bundle
        git clone https://github.com/gmarik/vundle $HOME/.vim/bundle/vundle || exit 1
        echo 'create vim plugin dir & clone vundle'
    else
        echo '.vim dir already exists and initialized'
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
