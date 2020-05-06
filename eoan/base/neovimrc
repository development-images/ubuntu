" Install vimplug plugin manager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" Execute vimplug to install plugins
" If you configure any plugins here you must run ":PlugInstall" to install them
" Plugins may be updated with ":PlugUpdate"
call plug#begin('~/.vim/bundle')
  Plug 'sheerun/vim-polyglot'
  Plug 'lambdalisue/suda.vim'
  Plug 'vim-scripts/perl-mauke.vim'
  Plug 'godlygeek/tabular'
  Plug 'elzr/vim-json'
  Plug 'plasticboy/vim-markdown'
  Plug 'ryanoasis/vim-devicons'         " look at beauty icons
  Plug 'vim-airline/vim-airline'        " Lean & mean status/tabline for vim that's light as air
  Plug 'vim-airline/vim-airline-themes' " airline theme...
  Plug 'pbrisbin/vim-mkdir'             " Automatically create missing directories when saving
call plug#end()

if (has("termguicolors"))
  set termguicolors
endif

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Detect .md as markdown instead of modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Enable vim json plugin
hi! def link jsonKeyword Identifier
let g:vim_json_syntax_conceal = 1

" Set the background as dark
set background=dark

" Configure tab settings
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set mouse-=a

" Disable markdown folding by default
let g:vim_markdown_folding_disabled = 1

" Install any missing plugins automatically
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Push F8 to disable auto indent
nnoremap <F8> :setl noai nocin nosi inde=<CR>

" Push control + w to delete a word
imap <C-w> <C-o>db

" Add work around for vim adding '<Paste>' sometimes
au InsertLeave * set nopaste

" Set auto sudo plugin to escalate privs if file is read only "
" https://github.com/lambdalisue/suda.vim "
let g:suda_smart_edit = 1
