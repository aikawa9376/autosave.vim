" textobj-forward - Text objects for a range forward a character.
" Version: 0.2.0
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
  if filewritable(expand('%')) && bufname() != ''
    write
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
