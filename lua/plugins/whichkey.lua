return {
    -- Keybind cheatsheet
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        vim.o.timeoutlen = 300
        require("which-key").setup {
            -- your configuration comes here
            -- or leave it empty to  the default settings
            -- refer to the configuration section below
            icons = {
                group = ""
            },
        }
        -- Custom binds
        local wk = require("which-key")
        wk.add({
    		{ "<C-h>", desc = "Signature help" },
    		{ "<leader>f", group = "File / Format" },
    		{ "<leader>l", desc = "Lsp" },
    		--{ "<leader>la", desc = "Code actions" },
    		--{ "<leader>lc", desc = "Format code" },
    		--{ "<leader>ld", desc = "Diagnostics" },
    		--{ "<leader>lr", desc = "Rename" },
    		--{ "<leader>ls", desc = "Workspace symbols" },
    		{ "<leader>s", desc = "Replace" },
    		{ "<leader>x", desc = "Make executable" },
    		{ "K", desc = "Info" },
    		{ "[d", desc = "Previous diagnostic" },
    		{ "]d", desc = "Next diagnostic" },
    		{ "g", desc = "Go to" },
    		{ "gd", desc = "Definition" },
    		{ "gr", desc = "References" },
	    })

    end
}

--vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
--vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
--vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
