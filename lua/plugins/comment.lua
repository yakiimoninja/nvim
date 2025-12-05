return {
    -- Comment highlighted
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup {
            mappings = false,

            -- Toggle current line or with count
            vim.keymap.set('n', '<leader>cl', function()
                return vim.v.count == 0
                    and '<Plug>(comment_toggle_linewise_current)'
                    or '<Plug>(comment_toggle_linewise_count)'
            end, { expr = true }, { desc = "Line" }),

            -- Toggle in Op-pending mode
            -- vim.keymap.set('n', '<leader>cl', '<Plug>(comment_toggle_linewise)', {desc = "Comment line"})
            -- Toggle in VISUAL mode
            vim.keymap.set('x', '<leader>cl', '<Plug>(comment_toggle_linewise_visual)', { desc = "Comment line" }),
            -- Fixes gc still being active keymap
            vim.keymap.del("n", "gc"),
        }
    end
}
