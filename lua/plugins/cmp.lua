return {
    "saghen/blink.cmp",
	lazy = false, -- lazy loading handled internally
	-- optional: provides snippets for the snippet source
	dependencies = {
        "rafamadriz/friendly-snippets",
        "L3MON4D3/LuaSnip",
    },
	version = "v0.*",
	opts = {
	    -- 'default' for mappings similar to built-in completion
	    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
	    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
	    -- see the "default configuration" section below for full documentation on how to define
		-- your own keymap.
		keymap = {
            preset = "default",
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<CR>"] = { "accept", "fallback" },
            ["<Tab>"] = { function(cmp)
                if cmp.snippet_active() then return cmp.accept()
                else return cmp.select_next() end
                end, "snippet_forward", "fallback"
            },
        },
        -- to be removed with following updates
        completion = {
            trigger = {
                show_on_insert_on_trigger_character = false,
            },
        },
		appearance = {
		    -- Sets the fallback highlight groups to nvim-cmp's highlight groups
		    -- Useful for when your theme doesn't support blink.cmp
		    -- will be removed in a future release
		    use_nvim_cmp_as_default = true,
		    -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		    -- Adjusts spacing to ensure icons are aligned
		    nerd_font_variant = "mono"
		},
        accept = {
            auto_brackets = {
                enabled = true
            },
            default_brackets = {
                "(", ")",
                "[", "]",
                "{", "}",
                "'", "'",
                "\"", "\"",
            },
        },
        documentation = {
            auto_show = true,
        },
        -- experimental signature help support
        signature = {
            enabled = true
        },
	},
	-- allows extending the providers array elsewhere in your config
	-- without having to redefine it
	--opts_extend = { "sources.default" }
}
