" No more stupid wrapping
set nowrap
" Dont create swap file
set noswapfile
" Copies using system clipboard
set clipboard^=unnamed,unnamedplus
" highlights current line
set cursorline
" Keep your cursor centered vertically on the screen
set scrolloff=15 

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
"set relativenumber

" Set colors in terminal
" Solarized, dark, with true color support
set termguicolors
set background=light
colorscheme NeoSolarized

" crontab filetype tweak (the way vim normally saves files confuses crontab
" so this workaround allows for editing
au FileType crontab setlocal bkc=yes

set hidden

" terminal settings
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

"LANGUAGE SPECIFIC
"
"############## GO ##############

au BufNewFile,BufRead *.go setlocal noet ts=8 sw=8 sts=8

"############# python ###########
"
au BufNewFile,BufRead *.py setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

"############# lua ##############
"
au BufNewFile,BufRead *.lua setlocal et ts=2 sw=2 sts=2
