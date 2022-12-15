call plug#begin()
Plug 'Shougo/neosnippet-snippets'

Plug 'sheerun/vim-polyglot'
Plug 'isobit/vim-caddyfile'

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

Plug 'nvim-lua/plenary.nvim', {'tag': '*'}
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest', {'tag': 'v2.1.0'}

Plug 'nvim-neotest/neotest-go'
Plug 'nvim-neotest/neotest-python'
Plug 'nvim-neotest/neotest-plenary'

Plug 'vim-test/vim-test'

Plug 'tpope/vim-fugitive'
Plug 'kkoomen/vim-doge', { 'do': 'npm i --no-save && npm run build:binary:unix' }
Plug 'kevinhwang91/rnvimr'

Plug 'nvim-lua/plenary.nvim'

" TELESCOPE
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'fannheyward/telescope-coc.nvim'
Plug 'tom-anders/telescope-vim-bookmarks.nvim'

"Plugin collection
Plug 'echasnovski/mini.nvim', {'branch': 'stable'}
Plug 'edkolev/tmuxline.vim', {'tag': '*'}

call plug#end()

lua require('dap-python').setup('/Users/admin/.pyenv/shims/python')
