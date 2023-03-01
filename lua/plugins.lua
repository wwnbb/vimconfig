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
  use 'SirVer/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use { 'L3MON4D3/LuaSnip', run = 'make install_jsregexp' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'rafamadriz/friendly-snippets' }

  use 'terrortylor/nvim-comment'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use 'mfussenegger/nvim-dap'
  use 'leoluz/nvim-dap-go'
  use 'rcarriga/nvim-dap-ui'
  use 'mfussenegger/nvim-dap-python'
  use 'theHamsta/nvim-dap-virtual-text'

  use 'nvim-lua/plenary.nvim'

  use { 'nvim-neotest/neotest', tag = 'v2.5.0' }
  use 'nvim-neotest/neotest-go'
  use 'nvim-neotest/neotest-python'

  use 'vim-test/vim-test'

  use 'jose-elias-alvarez/null-ls.nvim'
  use 'tpope/vim-fugitive'
  use 'rbong/vim-flog'
  use { 'kkoomen/vim-doge', run = 'npm i --no-save && npm run build:binary:unix' }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = {
      'tom-anders/telescope-vim-bookmarks.nvim',
      'nvim-telescope/telescope-dap.nvim',
      'nvim-telescope/telescope-github.nvim',
      'sopa0/telescope-makefile'
    },
    config = function()
      require('telescope').load_extension('fzf')
    end
  }

  use 'echasnovski/mini.nvim'
  use { 'edkolev/tmuxline.vim', tag = '*' }
  use {
    'smjonas/inc-rename.nvim',
    config = function()
      require('inc_rename').setup{input_buffer_type = 'dressing',}
    end,
  }
  use {'stevearc/dressing.nvim'}
end)
