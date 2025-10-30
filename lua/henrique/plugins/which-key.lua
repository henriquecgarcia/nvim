return {
    "folke/which-key.nvim",
    --event = { "BufReadPre", "BufNewFile" },
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 250
    end,
    opts = {
        spec = {
            { "<leader>d",  group = "diagnostics" },
            { "<leader>f",  group = "find shite" },
            { "<leader>g",  group = "git things" },
            { "<leader>gl", desc = "git logg" },
            { "<leader>q",  desc = "trouble (this buffer)" },
        },
        notify = false, -- disable warnings for mappings
        win = {
            wo = {
                winblend = 15,
            },
        },
        expand = 3, -- expand groups when <= n mappings
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.add(opts.spec)
    end,
}
