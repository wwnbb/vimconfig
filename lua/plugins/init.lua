return {
	"Shougo/neosnippet-snippets",
	"sheerun/vim-polyglot",
	"isobit/vim-caddyfile",
	"neovim/nvim-lspconfig",
	"SirVer/ultisnips",
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
	},
	"terrortylor/nvim-comment",
	"nvim-tree/nvim-tree.lua",
	"ishan9299/nvim-solarized-lua",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		version = "*",
	},
	{
		"krivahtoo/silicon.nvim",
		build = "./install.sh build",
	},
	"tpope/vim-fugitive",
	"rbong/vim-flog",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"sopa0/telescope-makefile",

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-dap.nvim",
			"nvim-telescope/telescope-github.nvim",
		},
		config = function()
			local tele = require("telescope")
			tele.load_extension("fzf")
			tele.load_extension("dap")
			tele.load_extension("gh")
		end,
	},
	"echasnovski/mini.nvim",
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup({ input_buffer_type = "dressing" })
		end,
	},
	"stevearc/dressing.nvim",
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("neogen").setup({})
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		version = "*",
	},
	"NvChad/nvim-colorizer.lua",
	"wwnbb/neovim-tailwind-classes-fold",
	"folke/neodev.nvim",
	"ellisonleao/glow.nvim",
	"github/copilot.vim",
	"cormacrelf/dark-notify",
	"lewis6991/gitsigns.nvim",
}
