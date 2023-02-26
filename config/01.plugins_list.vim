call plug#begin()
Plug 'Shougo/neosnippet-snippets'

Plug 'sheerun/vim-polyglot'
Plug 'isobit/vim-caddyfile'

Plug 'akinsho/toggleterm.nvim'

" Appearance
Plug 'icymind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --immutable-cache'}

Plug 'terrortylor/nvim-comment'


Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'mfussenegger/nvim-dap-python'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

" Lua
Plug 'nvim-lua/plenary.nvim', {'tag': '*'}

" Neotest
Plug 'nvim-neotest/neotest', {'tag': 'v2.5.0'}
Plug 'nvim-neotest/neotest-go'
Plug 'nvim-neotest/neotest-python'

Plug 'vim-test/vim-test'

Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'kkoomen/vim-doge', { 'do': 'npm i --no-save && npm run build:binary:unix' }

Plug 'nvim-lua/plenary.nvim'

" TELESCOPE
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'fannheyward/telescope-coc.nvim'
Plug 'tom-anders/telescope-vim-bookmarks.nvim'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'nvim-telescope/telescope-github.nvim'
Plug 'sopa0/telescope-makefile'

"Plugin collection
Plug 'echasnovski/mini.nvim', {'branch': 'stable'}
Plug 'edkolev/tmuxline.vim', {'tag': '*'}


call plug#end()

lua require('dap-python').setup('/Users/admin/.pyenv/shims/python')
