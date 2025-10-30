-- keyboard shortcuts
--

-- Leader key. Base for any key combo
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", ":Oil --float<CR>", { desc = "Oil" })

-- List recently opened files
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<CR>", { noremap = true, desc = "File history" })

-- Find files
vim.keymap.set(
    "n",
    "<leader>ff",
    ":Telescope find_files hidden=true no_ignore=false<CR>",
    { noremap = true, desc = "File search" }
)

-- Live find string (using ripgrep)
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, desc = "String search" })

-- Find string under cursor (using ripgrep)
vim.keymap.set(
    "n",
    "<leader>fs",
    ":Telescope grep_string<CR>",
    { noremap = true, desc = "Search text under cursor in cwd/grep search string" }
)

vim.keymap.set("n", "<leader><leader>", ":Telescope buffers<CR>", { noremap = true, desc = "Show open buffers" })
-- todo-comments.nvim
vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { noremap = true, desc = "Find TODOs" })
vim.keymap.set(
    "n",
    "<leader>gla",
    ":Telescope git_commits<CR>",
    { noremap = true, desc = "Git log (across all files)" }
)
vim.keymap.set("n", "<leader>glf", ":Telescope git_bcommits<CR>", { noremap = true, desc = "Git log (this file)" })
vim.keymap.set("n", "<leader>gd", function()
    if next(require("diffview.lib").views) == nil then
        vim.cmd("DiffviewOpen")
    else
        vim.cmd("DiffviewClose")
    end
end, { noremap = true, desc = "Git diff/stage" })
vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { noremap = true, desc = "Git blame" })

-- Remapping of existing Vim key binds
-- vim.keymap.set("n", "w", "W") -- skip punctuation when moving to start of next word
-- vim.keymap.set("n", "e", "E") -- skip punctuation when moving to end of next word
-- vim.keymap.set("n", "b", "B") -- skip punctuation when moving to end of previous word

--vim.keymap.set("n", "<leader>i", "gg=G``", { noremap = true, desc = "Re-indent whole file" }) -- '``' makes it stay at current line+column position

-- Thanks https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move whole lines/blocks down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move whole lines/blocks up in visual mode
vim.keymap.set("n", "<C-d>", "<C-d>zz")      -- eye-friendly down scrolling
vim.keymap.set("n", "<C-u>", "<C-u>zz")      -- eye-friendly up scrolling
vim.keymap.set("n", "J", "mzJ`z")            -- when merging lines, keep cursor at current position

-- vim.keymap.set(
--     "n",
--     "<leader>s",
--     [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
--     { noremap = true, desc = "Replace word below cursor" }
-- )

-- Apply conform.nvim formatting on keypress (same as on save)
-- vim.keymap.set({ "n", "v" }, "<leader>o", function()
--     local conform = require("conform")
--     conform.format({
--         lsp_fallback = true,
--         async = false,
--         timeout_ms = 500,
--     })
-- end, { desc = "Format file or range (in visual mode)" })

-- Go to next diagnostic item (any severity)
vim.keymap.set("n", "<leader>da", function()
    vim.diagnostic.jump({ count = 1 })
    vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to next diagnostic" })

-- Go to next diagnostic item (error severity)
vim.keymap.set("n", "<leader>de", function()
    vim.diagnostic.jump({ severity = vim.diagnostic.severity.ERROR, count = 1 })
    vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to next error diagnostic" })

-- Go to next diagnostic item (warning severity)
vim.keymap.set("n", "<leader>dw", function()
    vim.diagnostic.jump({ severity = vim.diagnostic.severity.WARN, count = 1 })
    vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to next warning diagnostic" })

-- Toggle LSP diagnostics
vim.keymap.set({ "n", "v" }, "<leader>dd", function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Turn diagnostics on/off" })

-- By default, show virtual_text and hide virtual_lines.
-- This keymap allows to do the opposite. Can be useful when there are multiple
-- severities on the same line
vim.keymap.set("n", "<leader>tdd", function()
    vim.diagnostic.config({
        virtual_lines = not vim.diagnostic.config().virtual_lines,
        virtual_text = not vim.diagnostic.config().virtual_text,
    })
end, { desc = "Toggle diagnostic virtual lines and virtual text" })

-- Enclose word with double quotes
-- vim.keymap.set("n", "<leader>wq", 'ciw""<Esc>P', { desc = "Enclose in double quotes" })

-- Pomodoro timer
vim.keymap.set("n", "<leader>p", ":TimerStart 30m<CR>", { desc = "Pomodoro" })

-- Go to context via treesitter-context
vim.keymap.set("n", "fc", function()
    require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

-- Claude wrote this SSH clusterfuck
local function get_ssh_hosts()
    local known_hosts_path = vim.fn.expand("~/.ssh/known_hosts")
    local hosts = {}

    if vim.fn.filereadable(known_hosts_path) == 1 then
        local file = io.open(known_hosts_path, "r")
        if file then
            for line in file:lines() do
                -- Parse known_hosts format: hostname[,hostname] key-type key [comment]
                local host = line:match("^([^%s,]+)")
                if host and not host:match("^#") and not host:match("^%|") then
                    -- Remove bracketed IP addresses and ports
                    host = host:gsub("%[(.-)%].*", "%1")
                    host = host:gsub(":.*", "")
                    if host ~= "" and not vim.tbl_contains(hosts, host) then
                        table.insert(hosts, host)
                    end
                end
            end
            file:close()
        end
    end

    return hosts
end

vim.keymap.set("n", "<leader>ss", function()
    local hosts = get_ssh_hosts()

    if #hosts == 0 then
        vim.notify("No SSH hosts found in ~/.ssh/known_hosts", vim.log.levels.WARN)
        return
    end

    require("fzf-lua").fzf_exec(hosts, {
        prompt = "SSH target: ",
        actions = {
            ["default"] = function(selected)
                if selected and #selected > 0 then
                    local host = selected[1]
                    local ssh_url = "oil-ssh://" .. host .. "/"
                    require("oil").open(ssh_url)
                end
            end,
        },
        -- winopts = { height = 0.2, width = 0.2, row = 0.5, border = "single", treesitter = true },
        winopts = { height = 0.3, width = 0.5, row = 0.5, title = "Where do you want to go today?", backdrop = 100 },
    })
end, { desc = "SSH to host" })
