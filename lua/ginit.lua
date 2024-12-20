-- syntax on
vim.cmd [[syntax on]]
vim.cmd [[highlight Cursor guifg=white guibg=black]]
vim.cmd [[highlight iCursor guifg=white guibg=steelblue]]
-- highlight Cursor guifg=white guibg=black
-- highlight iCursor guifg=white guibg=steelblue

vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
--set guicursor=n-v-c:block-Cursor
--set guicursor+=i:block-Cursor
--set guicursor+=n-v-c:blinkon0

-- Neovide conf
vim.cmd [[let g:neovide_refresh_rate=120]]
-- let g:neovide_refresh_rate=120
-- let neovide_remember_window_size = v:true
