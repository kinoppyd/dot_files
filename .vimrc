set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'vim-perl/vim-perl'
Bundle 'hotchpotch/perldoc-vim'
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = "'"

Bundle 'thinca/vim-quickrun'
" quickrunのショートカット
nmap <Leader>r <plug>(quickrun)

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'

Bundle 'gregsexton/gitv'
noremap <Space>g :Gitv<CR>

Bundle 'tpope/vim-pathogen'
execute pathogen#infect()
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'

Bundle 'scrooloose/nerdtree'
noremap <Space>n :NERDTreeToggle<CR>

Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'

Bundle 'nanotech/jellybeans.vim'
Bundle 'altercation/vim-colors-solarized'


filetype plugin indent on

set guioptions-=T

"" ========== FileFormat
"" 文字コードはUTF8優先
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,default,latin
"" 改行コードはLF優先
set fileformats=unix,dos,mac

"" ========== カラースキーマ
colorscheme jellybeans
"" ========== シンタックスハイライト
syntax enable
"" ファイル名でスタイル判断
autocmd BufNewFile,BufRead *.cgi set filetype=perl
autocmd BufNewFile,BufRead *.psgi set filetype=perl
autocmd BufNewFile,BufRead *.rb set filetype=ruby

"" ========== バックアップ関連
"" スワップファイルなし
set noswapfile
"" 自動バックアップ無し
set nobackup

au GUIEnter * simalt ~x

"" クリップボード
set clipboard=unnamed,autoselect

"" ========== 自動整形
map <Space>pt <ESC>:% ! perltidy -pbp<CR>
map <Space>ptv <ESC>:'<,'> ! perltidy -pbp<CR>

"" ==========バッファ
"" C-JとC-Kにもバッファ移動をマップ
""nmap <C-J> :bp<CR>
""nmap <C-K> :bn<CR>

"" ==========インデント系
"" タブ文字を4文字で表示
set tabstop=4
"""" tabキーでスペース挿入
set expandtab
set softtabstop=4
"""" 自動整形のインデント幅を4にする
set shiftwidth=4
"" タブと改行を記号表示
set list
set listchars=tab:>\ ,eol:<

"" ========== 検索系
set hlsearch
"" インクリメンタルサーチ
set incsearch 
"" 大文字小文字は無視する
set ignorecase
"" ただし、明確に大文字を使った場合は認識
set smartcase
"" ESC2回で検索ハイライトを消す
nnoremap <ESC><ESC> :nohlsearch<CR>
"" 検索ハイライトで、次に飛ばない
nmap * *N

"" =========== Tab系
noremap <Space>t :tablast <bar> :tabnew<CR>
noremap <Space>c :tablast <bar> :tabclose<CR>
noremap <C-j> :tabprevious<CR>
noremap <C-k> :tabnext<CR>
noremap <Space>j :bp<CR>
noremap <Space>k :bn<CR>

set hidden
set wildmenu
set wildmode=longest:full,full
set number
set t_vb=
set ruler
set mouse=a
set nowrap

nnoremap <Space>. :<C-u>tabedit ~/_vimrc<CR>

"" ========== 全角時ハイライト
if has('multi_byte_ime') || has('xim')
	highlight Cursor guifg=NONE guibg=WHITE
	highlight CursorIM guifg=NONE guibg=DarkRed
endif

"" ========== vimgrep QuickFix連携用キーマップ
autocmd QuickFixCmdPost *grep*,make cwindow

"" ========== vimgrep用キーマップ
nnoremap <C-y> :cprevious<CR>   ""前へ
nnoremap <C-h> :cnext<CR>       ""次へ
nnoremap [Q :<C-u>cfirst<CR> ""最前へ
nnoremap ]Q :<C-u>clast<CR>  ""最後へ

"" ========== snippets
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <C-k> <Plug>(neocomplcache_snippets_expand)


"" ========== tags候補表示
nnoremap <C-]> g<C-]>

"" ========== Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

 " Use smartcase.
let g:neocomplcache_enable_smart_case = 0
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 0
" Select with <TAB>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

let g:neocomplcache_ctags_arguments_list = {
  \ 'perl' : '-R -h ".pm"'
  \ }

let g:neocomplcache_snippets_dir = "~/.vim/snippets"
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'    : '',
    \ 'perl'       : $VIM . '/pulgins/dict/perl.dict'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" for snippets
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
smap <C-k> <Plug>(neocomplcache_snippets_expand)
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]

 
"unite general settings
"インサートモードで開始
let g:unite_enable_start_insert = 1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50
 
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''
 
"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  "ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)
  "入力モードのときjjでノーマルモードに移動
  imap <buffer> jj <Plug>(unite_insert_leave)
  "入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  "ctrl+jで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  "ctrl+jで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  "ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  "ctrl+tでタブで開く
  nnoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabopen')
  inoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabopen')
endfunction"}}}


