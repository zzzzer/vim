"        "  ibl   for inserting a block
"        ab ibl   {<ESC>o}<ESC>O
"
"        "  def   for inserting "#define" at the start of line
"        ab def   <ESC>0i#define
"
"        "  inc   for inserting "#include" at start of line
"        ab inc   <ESC>0i#include
"
"        "  elif  for inserting else if block
"        ab elif  else if () {<ESC>o}<ESC>k$2hi

        "Insert header
        ab _header_   <ESC>:call SV_CommentTemplates('header')<CR>

        ab _fkn_   <ESC>:call SV_CommentTemplates('function')<CR>
        ab _task_   <ESC>:call SV_CommentTemplates('task')<CR>

        "AVM
        ab _avm_named_component_   <ESC>:call SV_CommentTemplates('avm_named_component')<CR>

        "  mfor   for inserting "for" statement
        "ab mfor   for (;;) begin<ESC>oend<ESC>kwa
        ab mfor   for (int i=0; i<; i++) begin<ESC>oend<ESC>k^f<a

        ab fkn   function void ();<ESC>oendfunction<ESC>-wela

        ab tsk   task ();<ESC>oendtask<ESC>-wi

        "  mif    for inserting "if" statement
        ab mif    if () begin<ESC>oend<ESC>k$6hi

        "  mwhile for inserting "while" statement
 "       ab mwhile while () {<ESC>o}<ESC>k$2hi

        "  mmain  for inserting "main" routine
"        ab mmain  main (argc,argv) <ESC>oint argc;<ESC>ochar *argv;<ESC>o{<ESC>o}<ESC>O
