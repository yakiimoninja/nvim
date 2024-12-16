return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
    },

    config = function()

        -- example using `opts` for defining servers
        local opts = {
            servers = {
                lua_ls = {},
                rust_analyzer = {},
            }
        }

        local lspconfig = require("lspconfig")
        for server, config in pairs(opts.servers) do
            -- passing config.capabilities to blink.cmp merges with the capabilities in your
            -- `opts[server].capabilities, if you've defined it
            config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
        end

        require("fidget").setup({})
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                --"jq", json formatter
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
                                }
                            }
                        }
                    }
                end,
            }
        })

--      local cmp_select = { behavior = cmp.SelectBehavior.Select }

--      cmp.setup({
--          snippet = {
--              expand = function(args)
--                  require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--              end,
--          },
--          mapping = cmp.mapping.preset.insert({
--              ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
--              ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
--              ["<CR>"] = cmp.mapping.confirm({
--                  behavior = cmp.ConfirmBehavior.Replace,
--                  select = true,
--              }),
--              ["<C-Space>"] = cmp.mapping.complete(),
--          }),
--          sources = cmp.config.sources({
--              { name = 'nvim_lsp' },
--              { name = 'luasnip' }, -- For luasnip users.
--          }, {
--              { name = 'buffer' },
--          })
--      })

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

