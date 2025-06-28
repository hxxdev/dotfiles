" set termguicolors
" sets terminal to support 24-bit RGB colors rather than 16 colors.
" terminal foreground color(text color).
" let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
" " terminal background color.
" let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
" set termguicolors
colorscheme catppuccin
" colorscheme challenger_deep
" let g:lightline = { 'colorscheme': 'challenger_deep'}
syntax on
filetype on
au BufWinEnter,BufRead,BufNewFile *.md set filetype=markdown
