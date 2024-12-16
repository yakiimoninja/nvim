-- noremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"

vim.g.mapleader = " "

-- Centered CTRL down or up
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Centered next or previous searches
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Replace word bind
vim.keymap.set("n", "<leader>fr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Find and replace all" })

-- Highlighted row move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Line below goes to current cursor line
vim.keymap.set("n", "J", "mzJ`z")

-- Pasting over highlighted text keep original content in clipboard
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste" })

-- Making scripts executable from inside vim
vim.keymap.set("n", "<leader>fx", "<cmd>!chmod +x %<CR>", { desc = "File to executable" }, { silent = true })

-- Format JSON bind
vim.keymap.set("n", "<leader>fj", "<cmd>%!jq<CR>", { desc= "Format JSON file"})
