" textobj-forward - Text objects for a range forward a character.
" Version: 0.2.0
" Author : aikawa 
" License: zlib License

let s:save_cpo = &cpo
set cpo&vim

" 文字が入力された場合にタイマーをリセットする関数
function! autosave#timer(timer, time)
  call timer_stop(a:timer)
  let s:smile_timer = timer_start(a:time, 'ShowSmile')
endfunction

" スマイルコマンドを実行する関数
function! autosave#showsmile(timer)
  smile
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
