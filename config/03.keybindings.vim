"LEADER
let mapleader=","

"############## NAVIGATION ###############
" split pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>



"  better scrolling with c u / d
nnoremap <c-d> 10<c-e>
nnoremap <c-u> 10<c-y>

"#########################################


"############## COMPLETION ###############
set signcolumn=yes

"#########################################

nmap <silent> [c :cn<cr>
nmap <silent> ]c :cp<cr>

nmap <silent> ]l :ln<cr>
nmap <silent> ]l :lp<cr>

let g:doge_mapping = '<Leader>dg'

" DAP
nnoremap <silent><leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent><space>k :lua require'dap'.step_out()<CR>
nnoremap <silent><space>l :lua require'dap'.step_into()<CR>
nnoremap <silent><space>j :lua require'dap'.step_over()<CR>
nnoremap <leader>ds :lua require'dap'.close()<CR>
nnoremap <leader>dc :lua require'dap'.continue()<CR>
nnoremap <leader>dk :lua require'dap'.up()<CR>
nnoremap <leader>dj :lua require'dap'.down()<CR>
nnoremap <leader>d_ :lua require'dap'.disconnect();require'dap'.stop();require'dap'.run_last()<CR>
nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
nnoremap <leader>di :lua require'dap.ui.variables'.hover()<CR>
vnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>
nnoremap <leader>d? :lua require'dap.ui.variables'.scopes()<CR>
nnoremap <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<CR>
nnoremap <leader>di :lua require'dap.ui.widgets'.hover()<CR>
nnoremap <leader>d? :lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>


" NEOTEST
nnoremap <silent><leader>ti :lua require("neotest").output.open({ enter = true })<CR>
nnoremap <silent><leader>tr :lua require("neotest").run.run()<CR>
nnoremap <silent><leader>tc :lua require("neotest").run.run({strategy="dap"})<CR>
nnoremap <silent><leader>tf :lua require("neotest").run.run(vim.fn.expand("%"))<CR>
nnoremap <silent><leader>tw :lua require("neotest").run.run({suite=true})<CR>
nnoremap <silent><leader>tm :lua require("neotest").summary.toggle()<CR>
nnoremap <silent><leader>ta :lua require("neotest").run.attach()<CR>



 nnoremap <silent>[n <cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>
 nnoremap <silent>]n <cmd>lua require("neotest").jump.next({ status = "failed" })<CR>
"########################################




"############### COMMANDS ################
"
" Use ; for commands
nnoremap ; :

augroup prewrites
   autocmd!
    autocmd BufWritePre,FileWritePre * :%s/\s\+$//e | %s/\r$//e
augroup END

nnoremap <silent> <leader>l :redir @+<CR>:echom join([expand('%'),  line(".")], ':')<CR>:redir END<CR>

"#########################################


"############### EDITOR MISC #############
" change working directory to where the file in the buffer is located
" if user types `,cd`
nnoremap <space>d :cd %:p:h<CR>:pwd<CR>

nnoremap <silent> <space>c :e $NVIM_CONFIG<CR>

nnoremap <leader>/ :%s/
nnoremap <space>t :terminal<CR>
