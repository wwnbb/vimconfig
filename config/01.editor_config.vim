" No more stupid wrapping
set nowrap
" Dont create swap file
set noswapfile
" Copies using system clipboard
set clipboard^=unnamed,unnamedplus
" highlights current line
set cursorline
" Keep your cursor centered vertically on the screen
set scrolloff=20

set pumheight=19

" Tab = 4 spaces
set tabstop=4
set shiftwidth=4
set sta
set et
set sts=4

" enable mouse support
set mouse=a mousemodel=popup

" markdown file recognition
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" relative line numbers
" Sets relative line numbers in normal mode, absolute line numbers in insert
" mode
set number
set relativenumber

" Set colors in terminal
" Solarized, dark, with true color support
set termguicolors
set background=light
colorscheme NeoSolarized

" crontab filetype tweak (the way vim normally saves files confuses crontab
" so this workaround allows for editing
au FileType crontab setlocal bkc=yes

" fix jump
nnoremap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>

set hidden

" terminal settings
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

"LANGUAGE SPECIFIC
"
"############# python ###########
"
au BufNewFile,BufRead *.py setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

"############# lua ##############
"
au BufNewFile,BufRead *.lua setlocal et ts=2 sw=2 sts=2



" ###################### COLORS ########################
hi NeotestPassed guifg=#859900
hi NeotestFailed guifg=#F70067
hi NeotestRunning guifg=#268bd2
hi NeotestSkipped guifg=#2aa198
hi NeotestFile guifg=#859900
hi NeotestDir guifg=#268bd2
hi NeotestNamespace guifg=#d33682
hi NeotestFocused gui=bold,underline cterm=bold,underline
hi NeotestIndent guifg=#8B8B8B
hi NeotestExpandMarker guifg=#8094b4
hi NeotestAdapterName guifg=#F70067
hi NeotestWinSelect guifg=#00f1f5 gui=bold
hi NeotestMarked guifg=#F79000 gui=bold
hi NeotestTarget guifg=#F70067
hi NeotestTest guifg=#657b83

let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0

let g:python3_host_prog="/Users/admin/.config/nvim/.venv/bin/python"
