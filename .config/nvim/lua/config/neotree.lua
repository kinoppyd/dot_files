-- Neotree
vim.api.nvim_set_keymap("n", "<leader>n", ":Neotree float toggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>N", ":Neotree left toggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>b", ":Neotree buffers float toggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>g", ":Neotree git_status float toggle<CR>", { noremap = true, silent = true })
