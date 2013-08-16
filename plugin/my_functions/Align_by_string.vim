function! Align_by_string(pat, col_in) 

"ruby << EOF
"
"  cb = VIM::Buffer.current
"  cw = VIM::Window.current
"
"  [row, col] = cw.cursor
"  line = cb[row]
"
"  VIM::command(echo "Line:".line)
"
"EOF

  let [lnum, col] = searchpos(a:pat, '', line("."))

  let s = getline(lnum)
  let repl = substitute(s, a:pat, repeat(' ', a:col_in-col).a:pat, '')
  call setline(lnum, repl)

endfunction
