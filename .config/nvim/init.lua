local opt = vim.opt
local api = vim.api

-- syntax
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- colorscheme
vim.cmd("colorscheme habamax")

-- leader
-- <Space>をleaderに、vimと違ってスペースはスペースらしい
vim.g.mapleader = " "
-- loacalleaderにバックスラッシュ
vim.g.maplocalleader = "\\"

-- 表示系
-- 行番号を表示
opt.number = true
-- カーソル行の強調
opt.cursorline = true
-- 制御記号表示
opt.list = true
-- タブ,改行記号,行末の空白を表示
opt.listchars = { tab = "> ", eol = "<", trail = "*" }
-- 折り返し表示しない
opt.wrap = false
-- eコマンド等でTabキーを押すとパスを補完する
opt.wildmode = "longest,full"
--  スクロールするときに残すライン数
opt.scrolloff = 3
-- ステータスラインの候補数を複数表示
opt.wildmenu = true
-- TAB補完時に、longestで最長一致を表示し、その後のTABでfull補完する
opt.wildmode = { "longest", "full" }

-- Tab
-- タブ文字の代わりにスペースを使う
opt.expandtab = true
-- プログラミング言語に合わせて適切にインデントを自動挿入
opt.smartindent = true
-- 各コマンドやsmartindentで挿入する空白の量
opt.shiftwidth = 2
-- Tabキーで挿入するスペースの数
opt.softtabstop = 2
-- 文字コード
-- バッファ内で扱う文字コード
opt.encoding = "utf-8"
-- 書き込む文字コード
opt.fileencoding = "utf-8"
-- 読み込む文字コード
opt.fileencodings = { "utf-8", "cp932" }

-- Clipboard
-- Vimの無名レジスタとシステムのクリップボードを連携
opt.clipboard:append { "unnamed", "unnamedplus" }

-- Swap
-- スワップファイルを使用しない
opt.swapfile = false
-- 自動バックアップなし
opt.backup = false

-- Search
-- 検索結果のハイライト
opt.hlsearch = true
-- インクリメンタルサーチ
opt.incsearch = true
-- ノーケース・センシティブ
opt.ignorecase = true
-- 明確に大文字を使った場合はケース・センシティブ
opt.smartcase = true
-- ESC2回押しで検索ハイライトを消す
api.nvim_set_keymap('n', '<ESC><ESC>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- バッファ
-- <leader>j で前のバッファに移動
api.nvim_set_keymap('n', '<leader>j', ':bp<CR>', { noremap = true, silent = true })
-- <leader>k で次のバッファに移動
api.nvim_set_keymap('n', '<leader>k', ':bn<CR>', { noremap = true, silent = true })
-- バッファ移動時、保存を矯正しない
opt.hidden = true

-- その他
-- カレントディレクトリを自動で移動
opt.autochdir = true

-- ruby実行してくれる君
api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function()
    api.nvim_set_keymap('n', '<leader>r', ':!ruby %<CR>', { noremap = true })
    api.nvim_set_keymap('n', '<leader>R', ':!bundle exec ruby %<CR>', { noremap = true })
  end,
})

require("config.lazy")
require("config.neotree")

