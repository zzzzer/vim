" Vim color scheme
"
" Name:         hellokitty.vim
" Maintainer:   Michal Fojtik <mi@mifo.sk>
" Last Change:  22 Sep 2011
" License:      public domain
" Version:      1.0
"
" This theme is based on the Railscasts Textmate theme [1]. I used
" Jo Vermeulen's "vibrantink" theme for Vim [2] as my template for
" creating this theme.

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "hellokitty"

"if has("gui_running")
  hi link htmlTag                     xmlTag
  hi link htmlTagName                 xmlTagName
  hi link htmlEndTag                  xmlEndTag

  highlight Normal                    guifg=#15141C   guibg=#FF8AB9
  highlight Cursor                    guifg=#000000   guibg=#FFFFFF
  "highlight CursorLine               guibg=#323300

  highlight Comment                   guifg=#FADEE9   gui=italic
  highlight NonText                   guifg=#6C2D55
  highlight Constant                  guifg=#A319B3
  highlight Define                    guifg=#250752
  highlight Special                   guifg=#250752
  highlight Error                     guifg=#FFFFFF   guibg=#990000
  highlight Function                  guifg=#A319B3   gui=NONE
  highlight Identifier                guifg=#6D9CBE   gui=NONE
  highlight Include                   guifg=#CC7833   gui=NONE
  highlight Keyword                   guifg=#5C0791
  highlight LineNr                    guifg=#15141C   guibg=#FF00C3
  highlight Number                    guifg=#F70753
  highlight PreProc                   guifg=#491A04
  highlight Search                    guibg=#FFFF00
  highlight Statement                 guifg=#A319B3   gui=NONE
  highlight String                    guifg=#F70753
  highlight Question                  guifg=#F70753
  highlight Title                     guifg=#FFFFFF
  highlight Type                      guifg=#DA4939   gui=NONE
  highlight Visual                    guibg=#5A647E

  highlight DiffAdd                   guifg=#E6E1DC   guibg=#144212
  highlight DiffDelete                guifg=#E6E1DC   guibg=#660000

  highlight rubyBlockParameter        guifg=#FFFFFF
  highlight rubyClass                 guifg=#FFC66D
  highlight rubyConstant              guifg=#DA4939
  highlight rubyInstanceVariable      guifg=#D0D0FF
  highlight rubyInterpolation         guifg=#519F50
  highlight rubyLocalVariableOrMethod guifg=#D0D0FF
  highlight rubyPredefinedConstant    guifg=#DA4939
  highlight rubyPseudoVariable        guifg=#FFC66D
  highlight rubyStringDelimiter       guifg=#A5C261
  highlight rubyClassVariable         guifg=#FA0F6D
 
  highlight xmlTag                    guifg=#E8BF6A
  highlight xmlTagName                guifg=#E8BF6A
  highlight xmlEndTag                 guifg=#E8BF6A
"endif
