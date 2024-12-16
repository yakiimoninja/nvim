return {
    -- Folder tree and icons
    "nvim-tree/nvim-tree.lua",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()

        local function open_nvim_tree()
            -- open the tree
            require("nvim-tree.api").tree.open()
        end

        require("nvim-tree").setup({
            respect_buf_cwd = true, -- 0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
            -- disables netrw completely
            --disable_netrw = true,
            -- hijack netrw window on startup
            --hijack_netrw = true,
            -- open the tree when running this setup function
            --open_on_setup = false,
            -- will not open on setup if the filetype is in this list
            --ignore_ft_on_setup = {},
            -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
            open_on_tab = true,
            -- hijack the cursor in the tree to put it at the start of the filename
            hijack_cursor = true,
            -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
            update_cwd = true,
            filters = {
                -- this option hides files and folders starting with a dot `.`
                dotfiles = false,
            },
            -- show lsp diagnostics in the signcolumn
            diagnostics = {
                enable = true,
                show_on_dirs = false,
                icons = { hint = "", info = "", warning = "", error = "" },
            },
            git = { enable = true, ignore = true, timeout = 400 },
            -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
            update_focused_file = {
                -- enables the feature
                enable = true,
                -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
                -- only relevant when `update_focused_file.enable` is true
                update_cwd = true,
                -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
                -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
                ignore_list = { ".git", "node_modules", ".cache" },
            },
            -- configuration options for the system open command (`s` in the tree by default)
            system_open = {
                -- the command to run this, leaving nil should work in most cases
                cmd = nil,
                -- the command arguments as a list
                args = {},
            },

            trash = { cmd = "trash-put", require_confirm = true },

            actions = {
                change_dir = { enable = true, global = false },
                open_file = {
                    quit_on_open = false,
                    resize_window = true,
                    window_picker = {
                        enable = true,
                        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                        exclude = {
                            filetype = {
                                "notify",
                                "packer",
                                "qf",
                                "diff",
                                "fugitive",
                                "fugitiveblame",
                            },
                            buftype = { "nofile", "terminal", "help" },
                        },
                    },
                },
            },
            renderer = {
                indent_markers = {
                    enable = true,
                    icons = {
                        corner = "└",
                        edge = "│",
                        none = " ",
                    },
                },
                icons = {
                    padding = " ", -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
                    symlink_arrow = " >> ", --  defaults to ' ➛ '. used as a separator between symlinks' source and target.
                    show = {
                        git = true,
                        folder = true,
                        file = true,
                        folder_arrow = true,
                    },
                    glyphs = {
                        default = "",
                        symlink = "",
                        git = {
                            unstaged = "",
                            staged = "S",
                            unmerged = "",
                            renamed = "➜",
                            deleted = "",
                            untracked = "U",
                            ignored = "◌",
                        },
                        folder = {
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                        },
                    },
                },
                highlight_git = true, -- will enable file highlight for git attributes (can be used without the icons).
                highlight_opened_files = "all", -- 0 -> "none" 1 -> "icon" 2 -> "name" 3 -> "all"
                add_trailing = true, -- append a trailing slash to folder names
                group_empty = true, --  compact folders that only contain a single folder into one node in the file tree
            },
            view = {
                -- show line numbers in tree disabled
                number = false,
                relativenumber = false,
                -- width of the window, can be either a number (columns) or a string in `%`
                width = 30,
                -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
                side = "left",
            },
        })

        --vim.api.nvim_create_autocmd('BufEnter', {
        --    command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
        --    nested = true,
        --})

        -- nvim-tree first file open fix
        vim.o.splitright = true

        -- Nvim Tree Toggle bind
        vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvim tree toggle" })
    end

}
