local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Salvar com Ctrl + S
map('n', '<C-s>', ':w<CR>', opts)
map('i', '<C-s>', '<Esc>:w<CR>a', opts)
map('v', '<C-s>', '<Esc>:w<CR>', opts)

-- Fechar janela com Ctrl + Q
map('n', '<C-q>', ':q<CR>', opts)

-- Função para mover linhas ou blocos de código para cima
function MoveLineUp()
	vim.cmd("m .-2")
	vim.cmd("normal! ==")
end

-- Função para mover linhas ou blocos de código para baixo
function MoveLineDown()
	vim.cmd("m .+1")
	vim.cmd("normal! ==")
end

-- Função para duplicar a linha atual ou bloco de código selecionado
function DuplicateLineOrSelection()
	vim.cmd("t .")
end

-- Mapeamentos de teclas para as funções acima
vim.api.nvim_set_keymap('n', '<A-k>', ':lua MoveLineUp()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-j>', ':lua MoveLineDown()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-d>', ':lua DuplicateLineOrSelection()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-d>', 'y`>p`<P', { noremap = true, silent = true })
