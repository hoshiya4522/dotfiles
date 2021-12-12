let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='nord'
" let g:airline_theme='shades_of_purple'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
