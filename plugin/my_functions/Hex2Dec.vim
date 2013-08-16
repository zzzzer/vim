function! Hex2Dec(hex) 

  let l:digits = '0123456789abcdef'
  let l:ret = 0
  let l:len = strlen(a:hex)

  let l:idx = l:len

  let l:pwr = 1

  while l:idx > 0 

    let l:cur_digit = strpart(a:hex, l:idx-1, 1)

    let l:cur_val   = stridx(l:digits, l:cur_digit)

    let l:ret = l:ret + l:cur_val * l:pwr

    let l:pwr = l:pwr * 16
    let l:idx = l:idx - 1

  endwhile

  return l:ret

endfunction

function! Dhex(hex)
  echo Hex2Dec(a:hex)
endfunction

function! DisplayHex2DecUnderCursor()

  let arg = expand("<cword>")

  if stridx(arg, 'h') == 0
    let loc_val = strpart(arg, 1,strlen(arg))
  else
    let loc_val = arg
  endif

  echo Hex2Dec( loc_val  )

endfunction

command! H2D        :call DisplayHex2DecUnderCursor()
