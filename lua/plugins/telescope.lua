return {

    -- Fuzzy finder
    "nvim-telescope/telescope.nvim",
    version = '0.1.0',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fs', function()
            builtin.grep_string({ search = vim.fn.input("Ripgrep find: ") });
        end)
    end
}
