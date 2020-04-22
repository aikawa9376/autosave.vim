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

" “一定時間” の指定（単位はミリ秒）
let s:smile_time = 10000

augroup autosave
  autocmd!
  " インサートモードに入って s:smile_time が経過したら ShowSmile() を実行
  autocmd InsertEnter * let s:smile_timer = timer_start(s:smile_time, 'autosave#showsmile')
  " 入力があったら UpdateSmileTimer() を実行
  autocmd InsertCharPre * call autosave#timer(s:smile_timer)
augroup END


let &cpo = s:save_cpo
unlet s:save_cpo
