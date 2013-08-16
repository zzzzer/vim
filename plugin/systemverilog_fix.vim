function! s:fix_indent()
  :so ~/.vim/indent/verilog_systemverilog.vim
endfunction

command! FixIndent   :call <SID>fix_indent()
