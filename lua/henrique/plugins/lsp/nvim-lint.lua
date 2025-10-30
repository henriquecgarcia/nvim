-- You can see which linters are running with require("lint").get_running()
return {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    opts = {
        -- other config
        linters = {
            eslint_d = {
                args = {
                    "--no-warn-ignored", -- <-- this is the key argument
                    "--format",
                    "json",
                    "--stdin",
                    "--stdin-filename",
                    function()
                        return vim.api.nvim_buf_get_name(0)
                    end,
                },
            },
        },
    },
    config = function()
        local lint = require("lint")

        -- Only enable linters that have their executables available to avoid ENOENT errors
        local function installed_linters(names)
            local ret = {}
            local bin_map = {
                golangcilint = "golangci-lint",
                write_good = "write-good",
                eslint_d = "eslint_d",
            }
            for _, name in ipairs(names) do
                local bin = bin_map[name] or name
                if vim.fn.executable(bin) == 1 then
                    table.insert(ret, name)
                end
            end
            return ret
        end

        lint.linters_by_ft = {
            javascript = installed_linters({ "eslint_d" }),
            typescript = installed_linters({ "eslint_d" }),
            javascriptreact = installed_linters({ "eslint_d" }),
            typescriptreact = installed_linters({ "eslint_d" }),
            svelte = installed_linters({ "eslint_d" }),
            python = installed_linters({ "ruff" }),
            lua = installed_linters({ "woke" }),
            ansible = installed_linters({ "woke" }),
            markdown = installed_linters({ "woke", "proselint", "write_good" }),
            text = installed_linters({ "woke", "proselint", "write_good" }),
            sh = installed_linters({ "woke" }),
            go = installed_linters({ "golangcilint" }),
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>l", function()
            lint.try_lint()
        end, { desc = "Lint current file" })
    end,
}
