return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    --event = "VeryLazy",
    cmd = "Telescope",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    --config = function(lazy, opts)
    config = function()
        local telescope = require("telescope")
        telescope.load_extension("fzf")
        --telescope.load_extension("file_browser")
        telescope.setup({
            defaults = {
                border = false,
                sorting_strategy = "ascending",
                wrap_result = true,
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.45,
                        width = 0.90,
                        height = 0.75,
                        preview_cutoff = 90,
                    },
                },
            },
            pickers = {
                colorscheme = {
                    enable_preview = true,
                },
                find_files = {
                    hidden = true,
                    wrap_results = false, -- this is not about the preview
                },
                live_grep = {
                    additional_args = function()
                        return { "--hidden", "--glob", "!**/.git/*" }
                    end,
                },
                grep_string = {
                    additional_args = function()
                        return { "--hidden", "--glob", "!**/.git/*" }
                    end,
                },
                ["lsp_references"] = { wrap_results = true },
                ["lsp_definitions"] = { wrap_results = true },
                ["diagnostics"] = { wrap_results = true },
                ["buffers"] = { sort_mru = true, sort_lastused = true, ignore_current_buffer = false },
            },
        })
    end,
}
