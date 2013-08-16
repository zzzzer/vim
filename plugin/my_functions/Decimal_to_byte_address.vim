function! Decimal_to_byte_address(val)

  let lnum = line(".")
  let byte_adjusted_val = a:val*4
  let address = Dec2Hex(byte_adjusted_val)
  let sv_string = "'h".address

  let s = getline(lnum)
  let repl = substitute(s, a:val, sv_string, '')
  call setline(lnum, repl)

endfunction

function! Decimal_to_byte_address_under_cursor()
  echo Decimal_to_byte_address( expand("<cword>") )
endfunction

command! DecimalToByteAddress    :call Decimal_to_byte_address_under_cursor()
