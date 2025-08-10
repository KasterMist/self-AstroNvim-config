return
{
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		opts = {
		  transparent_background = true,
		  custom_highlights = function(colors)
			-- stylua: ignore
			return {
			  LineNr     = { fg = colors.surface2 },
			  Visual     = { bg = colors.overlay0 },
			  Search     = { bg = colors.surface2 },
			  IncSearch  = { bg = colors.mauve },
			  CurSearch  = { bg = colors.mauve },
			  MatchParen = { bg = colors.mauve, fg = colors.base, bold = true },
			}
		  end,
		  integrations = {
			barbar = true,
			blink_cmp = true,
			gitsigns = true,
			mason = true,
			noice = true,
			nvimtree = true,
			rainbow_delimiters = true,
			snacks = {
			  enabled = true,
			  indent_scope_color = "flamingo", -- catppuccin color (eg. `lavender`) Default: text
			},
			which_key = true,
			flash = true,
			lsp_trouble = true,
      },
    }
	},

	{
		'romgrk/barbar.nvim',
		version = '^1.0.0',
		dependencies = {
			'lewis6991/gitsigns.nvim',
			'nvim-tree/nvim-web-devicons',
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {},
	},
	
	{
		'HiPhish/rainbow-delimiters.nvim',
		submodules = false,
		main = 'rainbow-delimiters.setup',
		ops = {}
	},

	{
  	"folke/noice.nvim",
  	event = "VeryLazy",
  	opts = {
    	-- add any options here
  	},
  	dependencies = {
    	-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    	"MunifTanjim/nui.nvim",
    	-- OPTIONAL:
    	--   `nvim-notify` is only needed, if you want to use the notification view.
    	--   If not available, we use `mini` as the fallback
    	"rcarriga/nvim-notify",
    }
	},

}
