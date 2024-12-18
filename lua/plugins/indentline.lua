return {
    -- Visual indentation vertical lines
    "lukas-reineke/indent-blankline.nvim",

    config = function ()
        require("ibl").setup()
    end
}
