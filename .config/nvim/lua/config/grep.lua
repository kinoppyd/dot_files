-- ag を :grep のバックエンドとして使用
vim.opt.grepprg = "ag --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"


-- :Grep {pattern}
--
-- 例:
--   :Grep foo
--   :Grep "foo bar"
--
-- silent:
--   ag の出力を全画面表示しない
--
-- grep!:
--   検索直後に最初の結果へジャンプしない
vim.api.nvim_create_user_command("Grep", function(opts)
  vim.cmd("silent grep! " .. opts.args)
  vim.cmd("copen")
end, {
  nargs = "+",
  desc = "Search with ag and open QuickFix",
})


-- QuickFix 上で <CR> を押したとき、
-- コード側には該当箇所を表示するが、
-- フォーカスは QuickFix に残す
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",

  callback = function(event)
    vim.keymap.set("n", "<CR>", function()
      local qf_win = vim.api.nvim_get_current_win()
      local qf_line = vim.api.nvim_win_get_cursor(qf_win)[1]

      -- 選択中の QuickFix 項目をコード側に表示
      vim.cmd("cc " .. qf_line)

      -- QuickFix にフォーカスを戻す
      if vim.api.nvim_win_is_valid(qf_win) then
        vim.api.nvim_set_current_win(qf_win)
      end
    end, {
      buffer = event.buf,
      silent = true,
      desc = "Preview QuickFix item",
    })
  end,
})
