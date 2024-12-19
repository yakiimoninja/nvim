return {
    -- Auto close parentheses brackets quotes etc.
    "windwp/nvim-autopairs",
    config = function()
        require("nvim-autopairs").setup {}
    end
}
