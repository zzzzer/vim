augroup filetypedetect
au BufNewFile,BufRead *.v    setf verilog
"_systemverilog
au BufNewFile,BufRead *.sv   so $HOME/.vim/indent/verilog_systemverilog.vim
au BufNewFile,BufRead *.sv   setf verilog_systemverilog
au BufNewFile,BufRead *.svh  so $HOME/.vim/indent/verilog_systemverilog.vim
au BufNewFile,BufRead *.svh  setf verilog_systemverilog
au BufNewFile,BufRead *.vh   setf verilog_systemverilog
au BufNewFile,BufRead *.va   setf verilogams
au BufNewFile,BufRead *.vams setf verilogams
augroup END
