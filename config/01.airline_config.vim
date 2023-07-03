" vim powerline options
let g:airline_theme='solarized'

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#exclude_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
set laststatus=3 " Only shows one status line
set showtabline=2 " always shows tab line
set noshowmode " Dont show -- INSERT MODE ---

set conceallevel=2

" Disable frustrating airline stuff on tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = ' '
let g:airline#extensions#tabline#show_close_button = 0

" '' '' '' '' '' '' '' '' '' '' '' '' '' ''
" '' '' '' '' '' '' '' '' '' '' '' '' '' ''
" '' '' '' '' '' '' '' '' '' ''

let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_symbols.space = "\ua0\ua0"
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = ''
let g:airline_right_sep = '«'
let g:airline_right_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = ' '
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#tabline#formatter = 'default'

let g:airline_skip_empty_sections = 1


" Simple mode names
let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''       : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ' '      : 'V',
      \ }

let g:airline_section_z = '%l:%c'

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction
map gm :call SynStack()<CR>
