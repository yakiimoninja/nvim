return {
    -- Keybind cheatsheet
    "folke/which-key.nvim",
    config = function()
        vim.o.timeoutlen = 300
        require("which-key").setup {
            -- your configuration comes here
            -- or leave it empty to  the default settings
            -- refer to the configuration section below
        }
        -- Custom binds
        local wk = require("which-key")
        wk.register({
            ["<leader>"] = {
                f = {
                    "File / Format",
                    f = { "Find file" },
                    g = { "Find git file" },
                    s = { "Find string in file" },
                },
                l = {
                    "Lsp",
                    a = { "Code actions" },
                    c = { "Format code" },
                    d = { "Diagnostics" },
                    r = { "Rename" },
                    s = { "Workspace symbols" },

                },
                s = {
                    "Replace"
                },
                x = {
                    "Make executable"
                }
            },
            ["g"] = {
                "Go",
                d = { "Definition" },
                r = { "References" }
            },
            ["K"] = {
                "Info"
            },
            ["[d"] = {
                "Previous diagnostic"
            },
            ["]d"] = {
                "Next diagnostic"
            },
            ["<C-h>"] = {
                "Signature help"
            }
        })
    end
}


--vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
--vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
--vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
