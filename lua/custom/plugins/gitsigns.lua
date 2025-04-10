return {
	'lewis6991/gitsigns.nvim',
	lazy = false,
	config = function()
		require('gitsigns').setup {
		preview_config = {
			border = 'rounded',
			row = 1,
			col = 0,
		},
		current_line_blame = true, -- Habilita blame virtual sempre ativo
		current_line_blame_opts = {
			delay = 0, -- Exibe o blame instantaneamente
			virt_text_pos = 'eol', -- Exibe no final da linha
		},
		}
	end,
	keys = function()
		local default_opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap('n', '<leader>gs', ':Gitsigns preview_hunk <CR>', default_opts)
		vim.api.nvim_set_keymap('n', '<leader>gn', ':Gitsigns next_hunk <CR>', default_opts)
		vim.api.nvim_set_keymap('n', '<leader>gp', ':Gitsigns prev_hunk <CR>', default_opts)
	end,
	}