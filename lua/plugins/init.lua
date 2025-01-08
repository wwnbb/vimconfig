return {
	"Shougo/neosnippet-snippets",
	"sheerun/vim-polyglot",
	"isobit/vim-caddyfile",
	"akinsho/toggleterm.nvim",
	"icymind/NeoSolarized",
	"neovim/nvim-lspconfig",
	"ray-x/lsp_signature.nvim",
	"SirVer/ultisnips",
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
	},
	"terrortylor/nvim-comment",
	"nvim-tree/nvim-tree.lua",
	"nvim-neotest/nvim-nio",
	"ishan9299/nvim-solarized-lua",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"nvim-lua/plenary.nvim",
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/neotest-python",
			"fredrikaverpil/neotest-golang",
		},
	},
	{
		"krivahtoo/silicon.nvim",
		build = "./install.sh build",
	},
	"vim-test/vim-test",
	"tpope/vim-fugitive",
	"rbong/vim-flog",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-telescope/telescope-dap.nvim",
			"nvim-telescope/telescope-github.nvim",
			"sopa0/telescope-makefile",
		},
		config = function()
			local tele = require("telescope")
			tele.load_extension("fzf")
			tele.load_extension("make")
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
