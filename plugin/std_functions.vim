function! s:clean_up()
  :%s/\t/  //g
  :%s/^ \+$//g
  :%s/. \+$//g
endfunction

command! CleanUp        :call <SID>clean_up(
