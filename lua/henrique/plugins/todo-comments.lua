-- Highlight, list and search todo comments in your projects
-- https://github.com/folke/todo-comments.nvim
return {
    "folke/todo-comments.nvim",
    lazy = true,
    event = "VimEnter",
    enabled = true,
    -- TODO: a todo
    -- WARN: a warning
    -- PERF: a performance remark
    -- NOTE: a note
    -- FIXME: a fixme
    -- XXX: something else
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = { signs = false },
}
