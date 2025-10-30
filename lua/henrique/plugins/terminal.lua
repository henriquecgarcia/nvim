return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
		require("toggleterm").setup {
				direction = "float", -- Pode ser 'horizontal', 'vertical', 'tab', 'float'
				shade_terminals = true,
			}

			-- Apenas no modo normal
			vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
		end
	}
}