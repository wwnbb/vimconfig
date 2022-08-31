call plug#begin()
Plug 'Shougo/neosnippet-snippets'

Plug 'sheerun/vim-polyglot'
Plug 'isobit/vim-caddyfile'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'icymind/NeoSolarized'

Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

Plug 'terrortylor/nvim-comment'

"Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'mfussenegger/nvim-dap-python'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'theHamsta/nvim-dap-virtual-text'

Plug 'nvim-lua/plenary.nvim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'

Plug 'nvim-neotest/neotest-go'
Plug 'nvim-neotest/neotest-python'

Plug 'vim-test/vim-test'

Plug 'tpope/vim-fugitive'
Plug 'kkoomen/vim-doge', { 'do': 'npm i --no-save && npm run build:binary:unix' }
Plug 'kevinhwang91/rnvimr'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

"Plugin collection
Plug 'echasnovski/mini.nvim', {'branch': 'stable'}

call plug#end()

lua require('dap-python').setup('/Users/admin/.pyenv/shims/python')
