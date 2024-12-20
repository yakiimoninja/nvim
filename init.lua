require("binds")
require("options")
require("manager")
require("colorscheme")
-- Load ginit
vim.api.nvim_create_autocmd("UIEnter", {
    once = true,
    callback = function() require("ginit") end
})
