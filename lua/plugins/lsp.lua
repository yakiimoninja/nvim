-- https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp",
        "j-hui/fidget.nvim",
    },

    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        require("fidget").setup()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
            },
            automatic_installation = true,
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                },
                            }
                        }
                    }
                end,
            },
        })

        vim.keymap.set("n", "<Leader>lf", function() vim.lsp.buf.format() end, { desc = "Format code" })
        vim.keymap.set("n", "<Leader>ld", function() vim.diagnostic.open_float() end, { desc = "Show diagnostic" })
        vim.keymap.set("n", "<Leader>ln", function() vim.diagnostic.goto_next() end, { desc = "Next diagnostic" })
        vim.keymap.set("n", "<Leader>lp", function() vim.diagnostic.goto_prev() end, { desc = "Previous diagnostic" })
        --vim.keymap.set("n", "<Leader>lld", function() vim.lsp.buf.show_line_diagnostics() end, { desc = "Line diagnostic" })
        vim.keymap.set("n", "<Leader>lR", function() vim.lsp.buf.rename() end, { desc = "Rename" })
        vim.keymap.set("n", "<Leader>lI", function() vim.lsp.buf.incoming_calls() end, { desc = "Incoming calls" })
        vim.keymap.set("n", "<Leader>lO", function() vim.lsp.buf.outgoing_calls() end, { desc = "Outgoing calls" })
        vim.keymap.set("n", "<Leader>li", function() vim.lsp.buf.implementation() end, { desc = "Implementations" })
        vim.keymap.set("n", "<Leader>lr", function() vim.lsp.buf.references() end, { desc = "References" })
        vim.keymap.set("n", "<Leader>la", function() vim.lsp.buf.code_action() end, { desc = "Actions" })
        vim.keymap.set("n", "<Leader>lD", function() vim.lsp.buf.declaration() end, { desc = "Declaration" })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
