return {
    -- Highlight all instanced of words under cursor
    "echasnovski/mini.cursorword",
    branch = "stable",
    config = function()
        require('mini.cursorword').setup {
            -- Delay (in ms) between when cursor moved and when highlighting appeared
            delay = 100,
        }
    end
}
