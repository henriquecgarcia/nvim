return {
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesitter-context").setup({
				enable = true,	-- Habilita o plugin
				max_lines = 3,	-- Número máximo de linhas fixadas no topo
				trim_scope = "outer",	-- Remove escopos externos grandes
				mode = "cursor",	-- Mostra apenas o escopo do cursor atual
			})
		end
	}
}