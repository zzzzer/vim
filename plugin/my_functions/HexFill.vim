function! HexFill(extended_length)

  let val = expand( "<cword>")

  if stridx(val, 'h') == 0
    let loc_val = strpart(val, 1,strlen(val))
    let loc_val_length = strlen(loc_val)
    while loc_val_length < a:extended_length
      let loc_val = "0".loc_val
      let loc_val_length += 1
    endwhile
  else
    echo "Error! Value did not include --- 'h ---"
  endif

  let loc_val = "h".loc_val

  let lnum = line(".")
  let s = getline(lnum)

  let repl =substitute(s, val, loc_val, "")

  call setline(lnum, repl)

endfunction

command! DoHexFill    :call HexFill(4)


" 'h0FF
