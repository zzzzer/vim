" Vim filetype plugin file
" Language:	CHDL
" Maintainer:	
" Last Change:	2009-03-02
" Version: 1.0

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif


au BufRead,BufNewFile *.vhd,*.vhdl		set filetype=vhdl

" Behaves just like Verilog
runtime! ftplugin/vhdl.vim
