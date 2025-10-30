-- A pretty diagnostics, references, telescope results, quickfix and location
-- list to help you solve all the trouble your code is causing.
-- https://github.com/folke/trouble.nvim
return {
    "folke/trouble.nvim",
    lazy = false,
    opts = {
        open_no_results = true,
        auto_close = true,
        indent_guides = false,
    },
    keys = {
        -- TODO: add more keymaps
        {
            "<leader>q",
            "<cmd>Trouble diagnostics toggle filter.buf=0 focus=false<cr>",
            desc = "Diagnostics (Trouble)",
        },
        -- {
        --     "<leader>z",
        --     "<cmd>Trouble lsp_document_symbols toggle filter.buf=0 focus=false win.position=right<cr>",
        --     desc = "Symbols (Trouble)",
        -- },
    },
}
