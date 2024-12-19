return {
    -- Visual indentation vertical lines
    "lukas-reineke/indent-blankline.nvim",

    config = function()
        require("ibl").setup {
            scope = {
                -- removes underline
                show_start = false,
                show_end = false
            }
        }
    end
}
