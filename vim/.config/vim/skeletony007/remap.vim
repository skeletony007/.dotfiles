nnoremap <leader>pv :Ex<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

xnoremap <leader>p "_dP
noremap <leader>y "+y
nnoremap <leader>Y "+Y
noremap <leader>d "_d

nnoremap ]q :cnext<CR>zz
nnoremap [q :cprevious<CR>zz

nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
