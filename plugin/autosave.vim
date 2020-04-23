" textobj-forward - Text objects for a range forward a character.
" Version: 0.1.0
" Author : aikawa
" License: zlib License

if exists('g:loaded_autosave')
  finish
endif
let g:loaded_autosave = 1

let s:save_cpo = &cpo
set cpo&vim

function! s:set(var, default)
  if !exists(a:var)
    if type(a:default)
      execute 'let' a:var '=' string(a:default)
    else
      execute 'let' a:var '=' a:default
    endif
  endif
endfunction

call s:set('g:autosave_save_time', 3000 )
call s:set('g:autosave_enable', 1 )

augroup autosave
  autocmd!
  autocmd TextChanged * call autosave#timer(g:autosave_save_time)
  autocmd TextChangedI * call autosave#timer(g:autosave_save_time)
  autocmd BufLeave * call autosave#timer(0)
augroup END

command! AutoSaveToggle call autosave#toggle()

let &cpo = s:save_cpo
unlet s:save_cpo
