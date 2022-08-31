for f in split(glob('~/.config/nvim/config/*'), '\n')
	exe 'source' f
endfor

for f in split(glob('~/.config/nvim/lua/*'), '\n')
	exe 'source' f
endfor

augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $HOME/.config/nvim/config/*.vim source % | echom "Reloaded " . $MYVIMRC | redraw
augroup END

let g:python3_host_prog = "~/.pyenv/versions/neovim3/bin/python3"
