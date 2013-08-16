"function! Dec2Hex()
"  let lstr = getline(".")
"  let decstr = matchstr(lstr, '\<[0-9]\+\>')
"  while decstr != ""
"    let decstr = printf("0x%x", decstr)
"    exe 's#\<[0-9]\+\>#'.decstr."#"
"    let lstr = getline(".")
"    let decstr = matchstr(lstr, '\<[0-9]\+\>')
"  endwhile
"endfunction

" Return the hex string of a number.
func! Dec2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc

" Convert each character in a string to a two-digit hex string.
func! String2hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Dec2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endfunc
