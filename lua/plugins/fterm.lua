return {
    "numToStr/FTerm.nvim",
    config = function()

        -- Code Runner - execute commands in a floating terminal
        --        local runners = { lua = "lua" }

        --        vim.keymap.set("n", "<leader><Enter>", function()
        --            local buf = vim.api.nvim_buf_get_name(0)
        --            local ftype = vim.filetype.match({ filename = buf })
        --            local exec = runners[ftype]
        --            print(exec, buf)
        --            if exec ~= nil then
        --                require("FTerm").scratch({ cmd = { exec, buf } })
        --            end
        --       end)
        -- CTRL D to exit 
        vim.keymap.set("n", "<leader>tt",
            function()
                tui:toggle()
            end, { desc = "Terminal"})
        
        vim.keymap.set("n", "<leader>tr",
            function()
                require("FTerm").scratch({ cmd = { "cargo", "run" } })
            end, { desc = "Terminal run code"})

        vim.keymap.set("n", "<leader>tg",
            function()
                require("FTerm").scratch({ cmd = { "lazygit" } })
            end, { desc = "Terminal git"})

        local fterm = require("FTerm")

        local tui = fterm:new({
            dimensions = {
                height = 0.9,
                width = 0.9
            }
        })
    end
}
