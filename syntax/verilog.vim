" Vim syntax file
" Language:	Verilog
" Maintainer:	Mun Johl <mj@core.rose.hp.com>
" Last Update:  Fri Aug 27 16:16:00 PDT 1999

" Chih-Tsun Huang <cthuang@larc.ee.nthu.edu.tw>
" Last Update:  Tue Aug 30 CST 1999

" You can change the default settings in the ~/.vimrc
" such as
"
"    :au BufReadPost * if exists("b:current_syntax")
"    :au BufReadPost *   if b:current_syntax == "verilog"
"    :au BufReadPost *     let verilog_minlines = 50
"    :au BufReadPost *     syntax on 
"    :au BufReadPost *   endif 
"    :au BufReadPost * endif 
"
" Insert the following commands between if/endif statements,
" before "syntax on"
" 1. to disable forced sync, using
"    :au BufReadPost *   let verilog_no_force_sync = 1
"
" 2. to enable C comment highlight style, using
"    :au BufReadPost *   let c_comment_strings = 1
"
" 3. to disable mismatched brackets checking, using
"    :au BufReadPost *   let verilog_no_bracket_error = 1
"    which disables forced sync, too.
"
" 4. to modify the minimum sync lines, using
"    :au BufReadPost *   let verilog_minlines = 200

" Remove any old syntax stuff hanging around
syn clear
"set iskeyword=@,48-57,_,192-255,+,-,?

" A bunch of useful Verilog keywords
syn keyword verilogType        input output inout reg wire parameter
syn keyword verilogType        integer real
syn keyword verilogBlock       always initial
syn keyword verilogStatement   disable assign deassign force release
syn keyword verilogStatement   posedge negedge wait or
syn keyword verilogStatement   buf pullup pull0 pull1 pulldown
syn keyword verilogStatement   tri0 tri1 tri trireg
syn keyword verilogStatement   wand wor triand trior
syn keyword verilogStatement   defparam
syn keyword verilogStatement   time

syn keyword verilogLabel       fork join
syn keyword verilogConditional if else default
syn keyword verilogRepeat      forever repeat while for

syn keyword verilogTodo contained TODO
" for revision control tags
syn match   verilogCommentSpecial contained "$[A-Z][a-zA-Z]\+:.*\$" oneline
syn match   verilogCommentSpecial contained "[A-Z][a-zA-Z0-9_\- ]\+:" oneline

syn match   verilogOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

"syn region  verilogComment start="/\*" end="\*/" contains=verilogTodo,verilogCommentSpecial
"syn match   verilogComment "//.*" oneline contains=verilogTodo,verilogCommentSpecial

syn match   verilogGlobal "`[a-zA-Z0-9_]\+"
syn match   verilogGlobal "$[a-zA-Z0-9_]\+\>"

syn match   verilogConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   verilogNumber "\(\<\d\+\|\)'[bB]\s*[0-1_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[oO]\s*[0-7_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[dD]\s*[0-9_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   verilogNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"
syn match   verilogNumber "[0-9]\+\s*[np]s"

syn region  verilogString	start=+L\="+ skip=+\\\\\|\\"+ end=+"+

syn cluster verilogCluster contains=verilogCharacter,verilogConditional,verilogRepeat,verilogString,verilogTodo,verilogComment,verilogCommentSpecial,verilogConstant,verilogLabel,verilogNumber,verilogOperator,verilogStatement,verilogGlobal,verilogDirective,verilogType,verilogBlock,cString,cComment,cCommentError,cCommentString,cComment2String,cCommentSkip         

if exists("verilog_no_bracket_error")
  syn keyword verilogBlock       function endfunction
  syn keyword verilogBlock       module endmodule
  syn keyword verilogLabel       begin end
  syn keyword verilogConditional case casex casez endcase
  syn keyword verilogStatement   task endtask
  syn region  verilogPortbyname matchgroup=SpecialChar start="\.[a-zA-Z0-9_]\+(" end=")" contains=ALLBUT,verilogCommentSpecial oneline
else
  " Try to mark {}, [], (), module/endmodule and begin/end mismatches
  " (also case|casex|casez/endcase, function/endfunction, task/endtask
  syn region verilogCaseMatch matchgroup=Statement start="\<case[xz]\{0,1}\>" end="\<endcase\>" contains=ALLBUT,verilogCaseError,verilogCommentSpecial
  syn match  verilogCaseError "\<endcase\>"
  syn region verilogFuncMatch matchgroup=Statement start="\<function\>" end="\<endfunction\>" contains=ALLBUT,verilogFuncError,verilogCommentSpecial
  syn match  verilogFuncError "\<endfunction\>"
  syn region verilogTaskMatch matchgroup=Statement start="\<task\>" end="\<endtask\>" contains=ALLBUT,verilogTaskError,verilogCommentSpecial
  syn match  verilogTaskError "\<endtask\>"
  syn region verilogModuleMatch matchgroup=Statement start="\<module\>" end="\<endmodule\>" contains=ALLBUT,verilogModuleError,verilogCommentSpecial
  syn match  verilogModuleError "\<endmodule\>"
  syn region verilogBeginMatch matchgroup=Label start="\<begin\>" end="\<end\>" contains=ALLBUT,verilogBeginError,verilogCommentSpecial
  syn match  verilogBeginError "\<end\>"
  syn region  verilogParen matchgroup=Statement start="(" end=")" contains=ALLBUT,verilogParenError,verilogCommentSpecial
  syn match  verilogParenError ")"
  " Ports connected by name
  syn region  verilogPortbyname matchgroup=SpecialChar start="\.[a-zA-Z0-9_]\+(" end=")" contains=ALLBUT,verilogParenError,verilogCommentSpecial oneline
  syn region  verilogBrace matchgroup=Special start="{" end="}" contains=ALLBUT,verilogBraceError,verilogCommentSpecial
  syn match  verilogBraceError "}"
  syn region  verilogBracket matchgroup=Special start="\[" end="]" contains=ALLBUT,verilogBracketError,verilogCommentSpecial
  syn match  verilogBracketError "]"
  if !exists("verilog_no_force_sync")
    syn sync match verilogModuleMatch grouphere NONE "\<endmodule\>"
  endif
endif

if exists("c_comment_strings")
  " C comment style is used from c.vim since Verilog uses the same style :p
  "
  " A comment can contain cString, cCharacter and cNumber.
  " But a "*/" inside a cString in a cComment DOES end the comment!  So we
  " need to use a special type of cString: cCommentString, which also ends on
  " "*/", and sees a "*" at the start of the line as comment again.
  " Unfortunately this doesn't very well work for // type of comments :-(
  syntax match	cCommentSkip	contained "^\s*\*\($\|\s\+\)"
  syntax region cCommentString	contained start=+L\="+ skip=+\\\\\|\\"+ end=+"+ end=+\*/+me=s-1 contains=cCommentSkip
  syntax region cComment2String	contained start=+L\="+ skip=+\\\\\|\\"+ end=+"+ end="$"
  syntax region  cCommentL	start="//" skip="\\$" end="$" keepend contains=cComment2String,verilogTodo,verilogCommentSpecial
  syntax region cComment	start="/\*" end="\*/" contains=cCommentString,verilogTodo,verilogCommentSpecial
  " keep a // comment separately, it terminates a preproc. conditional
  hi link cCommentL cComment
  syntax match	cCommentError	"\*/"
else
  syn region  verilogComment start="/\*" end="\*/" contains=verilogTodo
  syn match   verilogComment "//.*" oneline
endif

" Directives
syn match   verilogDirective   "//\s*synopsys\>.*$"
syn region  verilogDirective   start="/\*\s*synopsys\>" end="\*/"
syn region  verilogDirective   start="//\s*synopsys dc_script_begin\>" end="//\s*synopsys dc_script_end\>"

"Modify the following as needed.  The trade-off is performance versus
"functionality.
if !exists("verilog_minlines")
  let verilog_minlines = 50
endif
exec "syn sync minlines=" . verilog_minlines

if !exists("did_verilog_syntax_inits")
  let did_verilog_syntax_inits = 1
 " The default methods for highlighting.  Can be overridden later

  hi link verilogCharacter       Character
  hi link verilogConditional     Conditional
  hi link verilogRepeat          Repeat
  hi link verilogString          String
  hi link verilogTodo            Todo
  hi link verilogComment         Comment
  hi link verilogCommentSpecial  Special
  hi link verilogConstant        Constant
  hi link verilogLabel           Label
  hi link verilogNumber          Number
  hi link verilogOperator        Special
  hi link verilogStatement       Statement
  hi link verilogGlobal          Define
  hi link verilogDirective       SpecialComment
  hi link verilogType            Statement
  hi link verilogBlock           Statement
" cComment style
  hi link cString                String
  hi link cComment               Comment
  hi link cCommentError          cError
  hi link cCommentString         cString
  hi link cComment2String        cString
  hi link cCommentSkip           cComment

  hi link verilogModuleError     Error
  hi link verilogBeginError      Error
  hi link verilogFuncError       Error
  hi link verilogTaskError       Error
  hi link verilogCaseError       Error
  hi link verilogParenError      Error
  hi link verilogBracketError    Error
  hi link verilogBraceError      Error
endif

let b:current_syntax = "verilog"

" vim: ts=8

