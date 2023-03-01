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


" SOLARIZED HEX     16/8 TERMCOL  XTERM/HEX   L*A*B      RGB         HSB
" --------- ------- ---- -------  ----------- ---------- ----------- -----------
" base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
" base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
" base01    #586e75 10/7 brgreen  240 #585858 45 -07 -07  88 110 117 194  25  46
" base00    #657b83 11/7 bryellow 241 #626262 50 -07 -07 101 123 131 195  23  51
" base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
" base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
" base2     #eee8d5  7/7 white    254 #e4e4e4 92 -00  10 238 232 213  44  11  93
" base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
" yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
" orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
" red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
" magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
" violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
" blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
" cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
" green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60
"
hi CmpItemKind guifg=#839496 guibg=#fdf6e3
hi CmpItemAbbrMatch guifg=#b58900 guibg=#fdf6e3
hi CmpItemAbbrMatchFuzzy guifg=#b58900 guibg=#fdf6e3

let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0

let g:python3_host_prog="/Users/admin/.config/nvim/.venv/bin/python"
