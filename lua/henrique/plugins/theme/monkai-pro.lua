return {
    'loctvl842/monokai-pro.nvim',
    priority = 1000,
    lazy = true,
    enabled = false,
    priority = 1000,
    opts = {},
    config = function()
        local monokai = require("monokai-pro")
        monokai.setup({
            filter = "pro", -- Options: classic | octagon | pro | machine | ristretto | spectrum
            transparent_background = false,
            terminal_colors = true,
            devicons = true, -- Highlights `nvim-web-devicons` icons
            styles = {
                comment = {italic = true},
                keyword = {italic = true}, -- Any other keyword
                type = {italic = true}, -- (preferred) int, long, char, etc
                storageclass = {italic = true}, -- static, register, volatile, etc
                structure = {italic = true}, -- struct, union, enum, etc
                parameter = {italic = true}, -- parameter passed in function
                annotation = {italic = true},
                tag_attribute = {italic = true} -- tag attribute in ReactJS
            }
        })
        vim.cmd([[colorscheme monokai-pro]])
    end
}