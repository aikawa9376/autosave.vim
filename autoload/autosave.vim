" autosave.vim
" Version: 0.1.0
" Author : aikawa 
" License: zlib License

let s:save_cpo = &cpo
set cpo&vim

let s:save_timer = 0

function! autosave#timer(time)
  if g:autosave_enable 
    if s:save_timer
      call timer_stop(s:save_timer)
    endif
    let s:save_timer = timer_start(a:time, 'autosave#dosave')
  endif
endfunction

function! autosave#dosave(timer)
  if filewritable(expand('%'))
        \  && bufname() != '' && &modified
    write
  endif
endfunction

function! autosave#manual()
  if s:save_timer
    call timer_stop(s:save_timer)
  endif
  if filewritable(expand('%'))
        \  && bufname() != '' && &modified
    write
  endif
endfunction

function! autosave#toggle() abort
  if g:autosave_enable == 1
    let g:autosave_enable = 0
  else
    let g:autosave_enable = 1
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
