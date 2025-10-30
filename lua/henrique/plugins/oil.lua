-- File system operations for nerds
-- https://github.com/stevearc/oil.nvim
return {
    "stevearc/oil.nvim",
    lazy = true,
    cmd = "Oil",
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            columns = {
                -- "size",
                "icon",
                -- "mtime",
            },
            view_options = {
                show_hidden = true,
            },
            keymaps = {
                -- This should be matched to the open action in remap.lua
                ["<leader>e"] = "actions.close",
                ["<C-v>"] = "actions.select_vsplit",
                ["<C-x>"] = "actions.select_split",
                ["<C-c>"] = "actions.close",
                ["q"] = "actions.close",
                ["<Esc>"] = "actions.close",
            },

            float = {
                -- padding = 4,
                max_width = 0.65,
                max_height = 0.4,
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
            },
        })
    end,
}
