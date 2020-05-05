" Uncomment this line to enable vim pathogen
"execute pathogen#infect()

syntax on
set bg=dark

set nocompatible

set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2

" Backspace through everything in insert mode
set backspace=indent,eol,start

" Highlight search matches
set hlsearch

" To force the mouse working, uncomment the below lines. By default the mouse will be disabled.
set mouse-=a
"if has('mouse')
"  set mouse=a
"endif

" Automatic indents
filetype indent plugin on
set autoindent

" File backup settings
set noundofile
set nobackup
set nowritebackup

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Disable jumping to start of line
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Fix auto indents on write by using retab
autocmd BufWritePre * retab

" Disable auto comment
augroup auto_comment
  au!
  au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" Push control + w to delete a word
imap <C-w> <C-o>db

" Automatic paste mode for XTerm
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Easy paste plugin - https://github.com/roxma/vim-paste-easy
" This lets you paste code from screen due to the Xterm detection not working
augroup paste_easy
  au!
  autocmd InsertCharPre * call <sid>char_inserted()
  autocmd InsertLeave   * call <sid>stop_easy_paste()
  autocmd User MultipleCursorsPre  let s:lock = or(s:lock, 1)
  autocmd User MultipleCursorsPost let s:lock = and(s:lock, invert(0x01))
augroup END
command! PasteEasyDisable let g:paste_easy_enable=0
command! PasteEasyEnable let g:paste_easy_enable=1
let g:paste_easy_enable = get(g:,'paste_easy_enable',1)
let g:paste_char_threshold = get(g:,'paste_char_threshold', 1)
let g:paste_easy_message = get(g:,'paste_easy_message', 1)
let s:lock = 0
let s:start = reltime()
let s:past_easy_mode = 0
let s:paste_char_count = 0
if exists('*reltimefloat')
  let s:Reltimefloat = function('reltimefloat')
else
  func! s:Reltimefloat(rt)
    execute 'let f = ' . reltimestr(a:rt)
    return f
  endfunc
endif
func! s:char_inserted()
  if g:paste_easy_enable==0
    return
  endif
  if s:lock
    return
  endif
  if s:past_easy_mode
    return
  endif
  let l:passed = s:Reltimefloat(reltime(s:start))
  let s:start = reltime()
  if l:passed <= 0.01
    " no way a human could get fast like that
    let s:paste_char_count = s:paste_char_count + 1
    if s:paste_char_count >= g:paste_char_threshold
      call s:start_easy_paste()
    endif
  else
    let s:paste_char_count = 0
  endif
endfunc
func! s:start_easy_paste()
  if s:past_easy_mode
    return
  endif
  let s:counter = 0
  let s:changedtick = 0
  let s:past_easy_mode = 1
  set paste
  if !has('timers')
    return
  endif
  let s:changedtick = 0
  let s:counter = 0
  let s:timer = timer_start(50,function('s:on_timer'), {'repeat': -1})
endfunc
func! s:stop_easy_paste()
  if s:past_easy_mode==0
    return
  endif
  let s:past_easy_mode = 0
  set nopaste
  if g:paste_easy_message
    echom 'paste-easy end'
  endif
  if !has('timers')
    return
  endif
  call timer_stop(s:timer)
endfunc
func! s:on_timer(timer)
  if s:changedtick == b:changedtick
    let s:counter += 1
  else
    let s:counter = 0
  endif
  let s:changedtick = b:changedtick
  if s:counter >= 2
    call s:stop_easy_paste()
  endif
endfunc
