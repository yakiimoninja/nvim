return {
    -- Lsps
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        -- LSP Support
        "neovim/nvim-lspconfig",
        {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup({
                    ui = {
                        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
                        border = "none",

                        icons = {
                            -- The list icon to use for installed packages.
                            package_installed = "◍",
                            -- The list icon to use for packages that are installing, or queued for installation.
                            package_pending = "◍",
                            -- The list icon to use for packages that are not installed.
                            package_uninstalled = "◍",
                        },

                        keymaps = {
                            -- Keymap to expand a package
                            toggle_package_expand = "<CR>",
                            -- Keymap to install the package under the current cursor position
                            install_package = "i",
                            -- Keymap to reinstall/update the package under the current cursor position
                            update_package = "u",
                            -- Keymap to check for new version for the package under the current cursor position
                            check_package_version = "c",
                            -- Keymap to update all installed packages
                            update_all_packages = "U",
                            -- Keymap to check which installed packages are outdated
                            check_outdated_packages = "C",
                            -- Keymap to uninstall a package
                            uninstall_package = "X",
                            -- Keymap to cancel a package installation
                            cancel_installation = "<C-c>",
                            -- Keymap to apply language filter
                            apply_language_filter = "<C-f>",
                        },
                    },

                    -- The directory in which to install packages.
                    --install_root_dir = path.concat { vim.fn.stdpath "data", "mason" },

                    pip = {
                        -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
                        -- and is not recommended.
                        --
                        -- Example: { "--proxy", "https://proxyserver" }
                        install_args = {},
                    },

                    -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
                    -- debugging issues with package installations.
                    log_level = vim.log.levels.INFO,

                    -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
                    -- packages that are requested to be installed will be put in a queue.
                    max_concurrent_installers = 4,

                    github = {
                        -- The template URL to use when downloading assets from GitHub.
                        -- The placeholders are the following (in order):
                        -- 1. The repository (e.g. "rust-lang/rust-analyzer")
                        -- 2. The release version (e.g. "v0.3.0")
                        -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
                        download_url_template = "https://github.com/%s/releases/download/%s/%s",
                    },
                })
            end
        },
        {
            "williamboman/mason-lspconfig.nvim",
            config = function()
                require("mason-lspconfig").setup({
                    ensure_installed = {
                        "lua_ls",
                        "rust_analyzer"
                    }
                })
            end
        },
        -- Autocompletion
        {
            "hrsh7th/nvim-cmp",
            config = function()
                local cmp_status_ok, cmp = pcall(require, "cmp")
                if not cmp_status_ok then
                    return
                end

                local snip_status_ok, luasnip = pcall(require, "luasnip")
                if not snip_status_ok then
                    return
                end

                require("luasnip/loaders/from_vscode").lazy_load()

                local check_backspace = function()
                    local col = vim.fn.col "." - 1
                    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
                end

                --   פּ ﯟ   some other good icons
                local kind_icons = {
                    Text = "",
                    Method = "m",
                    Function = "",
                    Constructor = "",
                    Field = "",
                    Variable = "",
                    Class = "",
                    Interface = "",
                    Module = "",
                    Property = "",
                    Unit = "",
                    Value = "",
                    Enum = "",
                    Keyword = "",
                    Snippet = "",
                    Color = "",
                    File = "",
                    Reference = "",
                    Folder = "",
                    EnumMember = "",
                    Constant = "",
                    Struct = "",
                    Event = "",
                    Operator = "",
                    TypeParameter = "",
                }
                -- find more here: https://www.nerdfonts.com/cheat-sheet

                cmp.setup {
                    snippet = {
                        expand = function(args)
                            luasnip.lsp_expand(args.body) -- For `luasnip` users.
                        end,
                    },
                    mapping = {
                        ["<C-k>"] = cmp.mapping.select_prev_item(),
                        ["<C-j>"] = cmp.mapping.select_next_item(),
                        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
                        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                        ["<C-e>"] = cmp.mapping {
                            i = cmp.mapping.abort(),
                            c = cmp.mapping.close(),
                        },
                        -- Accept currently selected item. If none selected, `select` first item.
                        -- Set `select` to `false` to only confirm explicitly selected items.
                        ["<CR>"] = cmp.mapping.confirm { select = true },
                        ["<Tab>"] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            elseif luasnip.expandable() then
                                luasnip.expand()
                            elseif luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                            elseif check_backspace() then
                                fallback()
                            else
                                fallback()
                            end
                        end, {
                            "i",
                            "s",
                        }),
                        ["<S-Tab>"] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            elseif luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end, {
                            "i",
                            "s",
                        }),
                    },
                    formatting = {
                        fields = { "kind", "abbr", "menu" },
                        format = function(entry, vim_item)
                            -- Kind icons
                            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                            vim_item.menu = ({
                                nvim_lsp = "[LSP]",
                                luasnip = "[Snippet]",
                                buffer = "[Buffer]",
                                path = "[Path]",
                            })[entry.source.name]
                            return vim_item
                        end,
                    },
                    sources = {
                        { name = "nvim_lsp" },
                        { name = "luasnip" },
                        { name = "buffer" },
                        { name = "path" },
                    },
                    confirm_opts = {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                    },
                    window = {
                        documentation = {
                            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                        },
                    },
                    experimental = {
                        ghost_text = false,
                        native_menu = false,
                    },
                }
                capabilities = vim.lsp.protocol.make_client_capabilities()
                capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
            end
        },
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "saadparwaiz1/cmp_luasnip",

        -- Snippets
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local lsp = require("lsp-zero")

        --lsp.preset("recommended")
        --lsp.ensure_installed({
        --    "lua_ls",
        --    "rust_analyzer",
        --})

        local cmp = require("cmp")
        local cmp_mappings = lsp.defaults.cmp_mappings({
            ["<Tab>"] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
        })

        -- disable completion with tab
        -- this helps with copilot setup
        cmp_mappings["<Tab>"] = nil
        cmp_mappings["<S-Tab>"] = nil

        lsp.setup_nvim_cmp({
            mapping = cmp_mappings
        })

        lsp.set_preferences({
            suggest_lsp_servers = false,
            sign_icons = {
                error = "E",
                warn = "W",
                hint = "H",
                info = "I"
            }
        })

        lsp.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }

            if client.name == "eslint" then
                vim.cmd.LspStop("eslint")
                return
            end

            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>ls", vim.lsp.buf.workspace_symbol, opts)
            vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
            vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
            vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
            -- Format Code
            vim.keymap.set("n", "<leader>lc", "<cmd>LspZeroFormat<CR>")
        end)

        lsp.setup()

        vim.diagnostic.config({
            virtual_text = true,
        })
    end
}
