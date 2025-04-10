return {
	'github/copilot.vim',
	init = function()
		vim.g.copilot_no_tab_map = true -- Desabilita o mapeamento padrão do <Tab>
	end,
	config = function()
		vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { expr = true, silent = true })
	end,
}