-- LSP activation (references lsp/<filename>
vim.lsp.enable({
    "lua",
    "go",
    "terraform",
    "yaml",
    "ansible",
    "marksman",
    "write-good",
    "woke",
    "tailwind",
    "docker-compose",
    "bicep",
    "proselint",
    "python",
    "elixir",
})

-- Set highlight on search
vim.opt.hlsearch = true

-- Incremental search, helps to find 'regex' for search
vim.opt.incsearch = true

-- Shows the effects of substitute etc. as you type
vim.opt.inccommand = "split"

-- Case-insensitive search
vim.opt.ignorecase = true

-- If given an uppercase, only display results with uppercase
vim.opt.smartcase = true

-- Show line numbers default
vim.opt.number = true

-- Show relative line numbers
vim.opt.relativenumber = true

-- Separate sign colum (extra column for Git/LSP)
vim.wo.signcolumn = "yes"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- indent using spaces instead of <Tab>
--vim.opt.breakindent = true

-- highlight columns
vim.opt.colorcolumn = "80,120"

-- Sync clipboard between OS and Neovim.
-- Remove this option if you want your OS clipboard to remain independent.
--vim.opt.clipboard = 'unnamedplus'

-- Always keep this amount of lines above and below the cursor
vim.opt.scrolloff = 5

-- Highlight current line
vim.opt.cursorline = true

-- Blink cursor in normal mode
--vim.opt.guicursor = 'n:blinkon300-blinkwait200-blinkoff300'

-- Disable word wrap, enable temporarily with `:set wrap` when needed
vim.opt.wrap = false

vim.opt.termguicolors = true
-- Themes:
vim.cmd.colorscheme("rose-pine")
-- vim.opt.background = "light" -- light, dark

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
-- https://neovim.io/doc/user/options.html
-- vim.opt.completeopt = "menuone,noselect"
vim.opt.completeopt = "menuone,noselect,fuzzy,nosort"

-- Split windows appear below, not above
vim.opt.splitbelow = true

-- Split windows appear to the right instead of left
vim.opt.splitright = true

-- Mode is shown in lualine, so we don't need it one line below
vim.opt.showmode = false

-- Hobo way to to force ansiblels being used for Ansible files
vim.filetype.add({
    pattern = {
        [".*/.*playbook.*.ya?ml"] = "yaml.ansible",
        [".*/.*tasks.*/.*ya?ml"] = "yaml.ansible",
        [".*/.*group_vars.*/.*ya?ml"] = "yaml.ansible",
        [".*/.*host_vars.*/.*ya?ml"] = "yaml.ansible",
        [".*/local.ya?ml"] = "yaml.ansible",
        [".*-ansible/.*ya?ml"] = "yaml.ansible",
    },
})

-- Rounded borders
vim.opt.winborder = "rounded"

-- Inline hints
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚",
            [vim.diagnostic.severity.WARN] = "󰀪",
            [vim.diagnostic.severity.HINT] = "󰌶",
            [vim.diagnostic.severity.INFO] = "",
        },
        -- linehl = {
        --     [vim.diagnostic.severity.ERROR] = "Error",
        --     [vim.diagnostic.severity.WARN] = "Warn",
        --     [vim.diagnostic.severity.INFO] = "Info",
        --     [vim.diagnostic.severity.HINT] = "Hint",
        -- },
    },
    virtual_text = true,
    virtual_lines = false,
    update_in_insert = true, -- potential perf problem?
    jump = {
        float = true,
    },
    -- virtual_lines = {
    --     current_line = true,
    -- },
})

-- Disable log because it's slowing down Neovim
vim.lsp.log_levels = "OFF"
