for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
	exe 'source' f
endfor

augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $HOME/.config/nvim/config/*.vim source % | echom "Reloaded " . $MYVIMRC | redraw
augroup END
