filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
  Bundle 'gmarik/vundle'

" Experimenting
  Bundle 'robgleeson/hammer.vim'
  let g:HammerQuiet = 1

" Languages/Syntaxes/Frameworks {{{
  " Ruby {{{
  Bundle 'vim-ruby/vim-ruby'
  Bundle 'tpope/vim-endwise'
  Bundle 'tpope/vim-rake'
  Bundle 'tpope/vim-haml'
  Bundle 'ecomba/vim-ruby-refactoring'

  " " temporarily disable due to speed issues
  " "   see: https://github.com/tpope/vim-bundler/issues/4
  " Bundle 'tpope/vim-bundler'
  "
  " " Also this:
  " Bundle 'tpope/vim-rails'
  " }}}

  " Markdown/Textile/etc {{{
  Bundle 'tpope/vim-markdown'
  " }}}

  " Other {{{
  Bundle 'tpope/vim-cucumber'
  Bundle 'skammer/vim-css-color'
  Bundle 'kchmck/vim-coffee-script'
  Bundle 'pangloss/vim-javascript'
  Bundle 'css3'
  Bundle 'othree/html5-syntax.vim'
  Bundle 'tyok/js-mask'
  Bundle 'AnsiEsc.vim'
  Bundle 'mhz/vim-matchit'

  " }}}
" }}}

" Git {{{
  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-git'
  Bundle 'tjennings/git-grep-vim'
" }}}

" Text objects {{{
  Bundle 'kana/vim-textobj-user'
  Bundle 'nelstrom/vim-textobj-rubyblock'
  Bundle 'michaeljsmith/vim-indent-object'
  Bundle 'argtextobj.vim'
" }}}

" Utility {{{

  Bundle 'spiiph/vim-space'
  Bundle 'tpope/vim-surround'
  Bundle 'Raimondi/delimitMate'
  Bundle 'ShowMarks7'

  Bundle 'YankRing.vim'
  nnoremap <silent> ,y :YRShow<CR>

  Bundle 'AutoComplPop'
  let g:acp_completeoptPreview     = 1
  let g:acp_behaviorKeywordLength  = 3
  let g:acp_behaviorKeywordIgnores = [
    \ 'the', 'def', 'end',
    \ 'else', 'elsif', 'elif', 'endif', 'then',
    \ 'case', 'done', 'do'
    \ ]

  " only enable if a filetype is set
  let g:acp_enableAtStartup = 0
  autocmd FileType * AcpEnable

  Bundle 'Lokaltog/vim-easymotion'
  let g:EasyMotion_keys = "arstdhneio" " Colemak home row


  Bundle 'millermedeiros/vim-statline'
  let g:statline_syntastic         = 1
  let g:statline_fugitive          = 1
  let g:statline_rvm               = 0 " TODO: how to integrate with rbenv
  let g:statline_filename_relative = 1
  let g:statline_trailing_space    = 0 " I already auto-fix these

  Bundle 'Gundo'
  nnoremap <Leader>u :GundoToggle<CR>

  Bundle 'kien/rainbow_parentheses.vim'
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces


  Bundle 'Tabular'
  map <Leader>a= :Tabularize /=<CR>
  map <Leader>a> :Tabularize /=><CR>
  map <Leader>a: :Tabularize /\z:<CR>

  vmap <Leader>a= :Tabularize /=<CR>gv
  vmap <Leader>a> :Tabularize /=><CR>gv
  vmap <Leader>a: :Tabularize /\z:<CR>gv

  imap <Leader>a= <Esc>:Tabularize /=<CR>i
  imap <Leader>a> <Esc>:Tabularize /=><CR>i
  imap <Leader>a: <Esc>:Tabularize /\z:<CR>i

  " Auto-align
  "" Cucumber
  inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a
  function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
      let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
      let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
      Tabularize/|/l1
      normal! 0
      call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
  endfunction

  "" Assignments etc
  " These need more work:
  " TODO: - keep cursor position
  "       - don't align equals sign if inside hashrocket
  " inoremap => =><Esc>:Tabularize /=> <CR>i
  " inoremap =  =<Esc>:Tabularize /=<CR>i

  Bundle 'scrooloose/nerdcommenter'
  let NERDSpaceDelims = 1 " space between comment and code
  map  // <plug>NERDCommenterToggle
  vmap // <plug>NERDCommenterToggle gv
  map  <Leader>/ //
  vmap <Leader>/ //

  Bundle 'ZoomWin'
  map <Leader>z :ZoomWin<CR>
  imap <Leader>z <Esc>:ZoomWin<CR>

  Bundle 'vimwiki'
  let g:vimwiki_hl_cb_checked = 1
  let g:vimwiki_menu          = 'Plugin.Vimwiki'
  let g:vimwiki_badsyms       = ' '
  let g:vimwiki_use_mouse     = 1
  let g:vimwiki_dir_link      = 'index'
  let g:vimwiki_list          = [
    \  {
    \     'path': '~/Dropbox/Wiki/Text',
    \     'path_html': '~/Dropbox/Wiki/HTML',
    \     'nested_syntaxes': {
    \       'ruby': 'ruby'
    \     }
    \  }
    \]

  Bundle 'scrooloose/nerdtree'
  let g:NERDTreeIgnore      = ['\.rbc$', '\~$', '.DS_Store$']
  let g:NERDTreeChDirMode   = 2
  let g:NERDTreeMouseMode   = 3
  let g:NERDTreeQuitOnOpen  = 1
  let g:NERDTreeMinimalUI   = 1
  let g:NERDTreeDirArrows   = 1
  let g:NERDTreeHijackNetrw = 0
  map <Leader>n :NERDTreeToggle<CR>

  Bundle 'Command-T'
  let g:CommandTMaxFiles  = 20000
  let g:CommandTMaxHeight = 10

  Bundle 'Indent-Guides'
  let g:indent_guides_auto_colors = 0
  let g:indent_guides_enable_on_vim_startup = 1
  autocmd VimEnter * IndentGuidesEnable

  Bundle 'Syntastic'
  let g:syntastic_enable_signs  = 1
  let g:syntastic_auto_loc_list = 0
" }}}

autocmd BufWritePost bundles.vim source ~/.vim/bundles.vim
filetype plugin indent on

