function! s:testf()
  :normal i===================================
  :normal i=
  :normal i= Header test
  :normal i=
  :normal i===================================
  "echo "Testing..."
endfunction

function! Testf3()
  echo "Testing... (3)"
endfunction

function! s:insert_header()
  :r ~/my_header.txt
endfunction

command! Tstf        :call <SID>testf()
command! MyHeader    :call <SID>insert_header()
