if &compatible
  set nocompatible               " Be iMproved
endif
set runtimepath^=/home/ghostbrain/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin('/home/ghostbrain/.vim/dein')
call dein#add('Shougo/dein.vim')

call dein#add('tpope/vim-fugitive')
call dein#add('gregsexton/gitv')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-endwise')
call dein#add('scrooloose/syntastic')
call dein#add('scrooloose/nerdtree')
call dein#add('Shougo/unite.vim')
call dein#add('bling/vim-airline')
call dein#add('nanotech/jellybeans.vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('godlygeek/tabular')
call dein#add('plasticboy/vim-markdown')
call dein#add('rking/ag.vim')

call dein#end()
filetype plugin indent on
syntax enable

