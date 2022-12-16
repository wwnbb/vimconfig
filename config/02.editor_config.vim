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
hi default NeotestPassed ctermfg=Green guifg=#96F291
hi default NeotestFailed ctermfg=Red guifg=#F70067
hi default NeotestRunning ctermfg=Blue guifg=#014ad1
hi default NeotestSkipped ctermfg=Cyan guifg=#00f1f5
hi default link NeotestTest Normal
hi default NeotestNamespace ctermfg=Magenta guifg=#D484FF
hi default NeotestFocused gui=bold,underline cterm=bold,underline
hi default NeotestFile ctermfg=Cyan guifg=#607060
hi default NeotestDir ctermfg=Cyan guifg=#0081d1
hi default NeotestIndent ctermfg=Grey guifg=#8B8B8B
hi default NeotestExpandMarker ctermfg=Grey guifg=#8094b4
hi default NeotestAdapterName ctermfg=Red guifg=#F70067
hi default NeotestWinSelect ctermfg=Cyan guifg=#00f1f5 gui=bold
hi default NeotestMarked ctermfg=Brown guifg=#F79000 gui=bold
hi default NeotestTarget ctermfg=Red guifg=#F70067
hi default link NeotestUnknown Normal

" Coc autocomplete coloring
hi CocMenuSel guibg=#E8DCB8
hi CocSearch guifg=#B68C25
