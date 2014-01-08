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

for dot_file in $dot_files
do
    if [ $dot_file != $self ]
    then
        link $dot_file
    fi
done
