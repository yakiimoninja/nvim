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
        local wk = require("which-key")
        wk.register({
            f = {
                "File / Format", -- optional group name
                f = { "Find file" }, -- create a binding with label
                g = { "Find git file" }, -- create a binding with label
                s = { "Find string in file" }, -- create a binding with label
                c = { "Format code" }, -- create a binding with label
            },
            s = {
                "Replace"
            },
            x = {
                "Make executable"
            }
        }, { prefix = "<leader>" })
    end

}
