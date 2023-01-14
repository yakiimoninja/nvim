-- Neovim Settings -- 

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.scrolloff = 8

vim.opt.lazyredraw = true
vim.opt.termguicolors = true

vim.opt.cmdheight = 2
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.colorcolumn = "100"
vim.wo.signcolumn = "yes"
vim.opt.wrap = false

vim.opt.wildmenu = true
vim.opt.wildmode = "full"

vim.opt.hidden = true
vim.opt.errorbells = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undo")

vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.showmatch = true

vim.wo.foldmethod = "syntax"
vim.opt.foldlevel = 99
vim.opt.updatetime = 300

vim.wo.cursorline = true
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

vim.opt.fileencoding = "utf-8"

-- removes ~ from buffers
vim.opt.fillchars:append { eob = " " }
