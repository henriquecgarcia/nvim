local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Salvar com Ctrl + S
map('n', '<C-s>', ':w<CR>', opts)
map('i', '<C-s>', '<Esc>:w<CR>a', opts)
map('v', '<C-s>', '<Esc>:w<CR>', opts)

-- Fechar janela com Ctrl + Q
map('n', '<C-q>', ':q<CR>', opts)