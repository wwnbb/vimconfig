return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'Shougo/neosnippet-snippets'

  use 'sheerun/vim-polyglot'
  use 'isobit/vim-caddyfile'

  use 'akinsho/toggleterm.nvim'

  use 'icymind/NeoSolarized'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'ray-x/lsp_signature.nvim'
  use 'SirVer/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use { 'L3MON4D3/LuaSnip', run = 'make install_jsregexp' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'rafamadriz/friendly-snippets' }

  use 'terrortylor/nvim-comment'
  use { 'nvim-tree/nvim-tree.lua' }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use 'jose-elias-alvarez/null-ls.nvim'
  use 'mfussenegger/nvim-dap'
  use 'leoluz/nvim-dap-go'
  use 'rcarriga/nvim-dap-ui'
  use 'mfussenegger/nvim-dap-python'
  use 'theHamsta/nvim-dap-virtual-text'

  use 'nvim-lua/plenary.nvim'

  use 'nvim-neotest/neotest'
  use 'nvim-neotest/neotest-python'
  use 'nvim-neotest/neotest-go'
  use {'krivahtoo/silicon.nvim', run = './install.sh build'}

  use 'vim-test/vim-test'

  use 'tpope/vim-fugitive'
  use 'rbong/vim-flog'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }


  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = {
      'nvim-telescope/telescope-dap.nvim',
      'nvim-telescope/telescope-github.nvim',
      'sopa0/telescope-makefile',
    },
    config = function()
      local tele = require('telescope')
      tele.load_extension('fzf')
      tele.load_extension('make')
      tele.load_extension('dap')
      tele.load_extension('gh')
    end
  }

  use 'echasnovski/mini.nvim'
  use { 'edkolev/tmuxline.vim', tag = '*' }
  use {
    'smjonas/inc-rename.nvim',
    config = function()
      require('inc_rename').setup { input_buffer_type = 'dressing', }
    end,
  }
  use { 'stevearc/dressing.nvim' }

  use {
    "danymat/neogen",
    config = function()
      require('neogen').setup {}
    end,
    requires = "nvim-treesitter/nvim-treesitter",
  }
  use { "github/copilot.vim" }
  use { 'akinsho/git-conflict.nvim', tag = "*" }
  use { 'ray-x/navigator.lua', requires = { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' } }
end)
