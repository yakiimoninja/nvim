return {

    -- Fuzzy finder
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function()

        require("telescope").setup {
            extensions = { fzf = {} }
        }
        require("telescope").load_extension("fzf")

        local builtin = require('telescope.builtin')
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find file" })
        vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find git file" })
        vim.keymap.set("n", "<leader>fs",
            function()
                builtin.grep_string({ search = vim.fn.input("Ripgrep find: ") });
            end, { desc = "Find file by string"})

        vim.keymap.set("n", "<leader>fn",
            function ()
                builtin.find_files {
                    cwd = vim.fn.stdpath("config")
                }
            end, { desc = "Fing nvim config file"})
    end
}
