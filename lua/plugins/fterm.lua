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
        vim.keymap.set("n", "<leader>rr", function()
            require("FTerm").scratch({ cmd = { "cargo", "run" } })
        end)

        vim.keymap.set("n", "<leader>g", function()
            require("FTerm").scratch({ cmd = { "lazygit" } })
        end)

        local fterm = require("FTerm")

        local tui = fterm:new({
            dimensions = {
                height = 0.9,
                width = 0.9
            }
        })
        -- CTRL D to exit 
        vim.keymap.set("n", "<leader>t", function()
            tui:toggle()
        end)
    end
}
