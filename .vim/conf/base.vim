"" ========== FileFormat
"" 文字コードはUTF8優先
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,default,latin
"" 改行コードはLF優先
set fileformats=unix,dos,mac

"" ========== シンタックスハイライト
syntax enable
"" ファイル名でスタイル判断
filetype on
autocmd BufNewFile,BufRead *.ru set filetype=ruby
autocmd BufNewFile,BufRead *.cap set filetype=ruby
autocmd BufNewFile,BufRead *.rake set filetype=ruby
autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile
autocmd BufNewFile,BufRead *.apib set filetype=apiblueprint

"" ========== バックアップ関連
"" スワップファイルなし
set noswapfile
"" 自動バックアップ無し
set nobackup
"" クリップボード
set clipboard=unnamed,autoselect

"" ==========インデント系
"" タブ文字を2文字で表示
set tabstop=2
"""" tabキーでスペース挿入
set expandtab
set softtabstop=2
"""" 自動整形のインデント幅を4にする
set shiftwidth=2
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
set t_Co=256

"" ========= 移動系
set scrolloff=4

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

