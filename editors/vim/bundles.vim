filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
  Bundle 'gmarik/vundle'

" source ~/.vim/~colder.vim

autocmd BufWritePost bundles.vim source ~/.vim/bundles.vim
filetype plugin indent on

