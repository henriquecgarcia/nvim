return {
    -- Adiciona o Monokai Pro
    {
        "loctvl842/monokai-pro.nvim",
        priority = 1000,
        config = function()
            require("monokai-pro").setup({
                filter = "pro", -- Opções: classic | octagon | pro | machine | ristretto | spectrum
                transparent_background = false,
                terminal_colors = true,
                devicons = true, -- Realça os ícones do `nvim-web-devicons`
                styles = {
                    comment = {italic = true},
                    keyword = {italic = true}, -- Qualquer outra palavra-chave
                    type = {italic = true}, -- (preferido) int, long, char, etc
                    storageclass = {italic = true}, -- static, register, volatile, etc
                    structure = {italic = true}, -- struct, union, enum, etc
                    parameter = {italic = true}, -- parâmetro passado na função
                    annotation = {italic = true},
                    tag_attribute = {italic = true} -- atributo de tag no ReactJS
                }
            })
            vim.cmd([[colorscheme monokai-pro]])
        end
    }, -- Configura o LazyVim para carregar o Monokai Pro
    {
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "monokai-pro"
		}
	}
}
