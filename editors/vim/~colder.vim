" Default.
  set shell=bash
  set guifont=Monaco:h12
  set wrap

" CoffeeScript.
  autocmd BufNewFile,BufRead *.coffee setlocal shiftwidth=2 expandtab

" Javascript.
  Bundle 'JSON.vim'
  autocmd BufRead,BufNewFile *.json set filetype=json
  augroup json_autocmd
    autocmd!
    autocmd FileType json set autoindent
    autocmd FileType json set formatoptions=tcq2l
    autocmd FileType json set textwidth=78 shiftwidth=2
    autocmd FileType json set softtabstop=2 tabstop=8
    autocmd FileType json set expandtab
    autocmd FileType json set foldmethod=syntax
  augroup end
