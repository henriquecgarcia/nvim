-- Example configuration for nvim-treesitter in LazyVim
-- This might be in lua/plugins/treesitter.lua or a similar location
return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		rainbow = {
			enable = true,
			-- Optional: List of languages to disable rainbow for
			-- disable = { "jsx", "cpp" },
			-- Optional: Which query to use for finding delimiters (e.g., "rainbow-parens")
			-- query = 'rainbow-parens',
			-- Optional: Highlight the entire buffer at once (can be resource-intensive for large files)
			-- strategy = require 'ts-rainbow.strategy.global',
			-- Optional: Do not enable for files with more than n lines
			-- max_file_lines = 3000,
		},
	},
-- ... other nvim-treesitter configurations
}
