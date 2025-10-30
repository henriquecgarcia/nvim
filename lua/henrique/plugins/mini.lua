-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
        require("mini.icons").setup()
        -- require("mini.ai").setup({ n_lines = 500 })
        require("mini.trailspace").setup()
        require("mini.cursorword").setup()
        require("mini.ai").setup()
    end,
}
