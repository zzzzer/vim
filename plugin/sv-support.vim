  let s:plugin_dir  = $HOME.'/.vim/'
"
"
"  Modul global variables    {{{1
"
let s:SV_AuthorName              = ""
let s:SV_AuthorRef               = ""
let s:SV_Company                 = ""
let s:SV_CopyrightHolder         = ""
let s:SV_Email                   = ""
let s:SV_Project                 = ""

let s:SV_Debugger                = 'term'
let s:SV_DoOnNewLine             = 'no'
let s:SV_LineEndCommColDefault   = 49
let s:SV_LoadMenus               = "yes"
let s:SV_MenuHeader              = "yes"
let s:SV_OutputGvim              = "vim"
let s:SV_Root                    = 'B&ash.'         " the name of the root menu of this plugin
let s:SV_SyntaxCheckOptionsGlob  = ""
let s:SV_Template_Directory      = s:plugin_dir."sv-support/templates/"
let s:SV_Template_File           = "sv-file-header"
let s:SV_Template_Frame          = "sv-frame"
let s:SV_Template_Function       = "sv-function-description"
let s:SV_Template_Task           = "sv-task-description"
let s:SV_Template_Avm_Named      = "sv-avm_named_component-description"
"let s:SV_XtermDefaults           = "-fa courier -fs 12 -geometry 80x24"
"let s:SV_Printheader             = "%<%f%h%m%<  %=%{strftime('%x %X')}     Page %N"
"let s:SV_Wrapper                 = s:plugin_dir.'sv-support/scripts/wrapper.sh'

let s:SV_FormatDate            = '%Y-%m-%d'
let s:SV_FormatTime            = '%X %Z'
let s:SV_FormatYear            = '%Y'
"------------------------------------------------------------------------------
"  date and time    {{{1
"------------------------------------------------------------------------------
function! SV_InsertDateAndTime ( format )
  if a:format == 'd'
    return strftime( s:SV_FormatDate )
  end
  if a:format == 't'
    return strftime( s:SV_FormatTime )
  end
  if a:format == 'dt'
    return strftime( s:SV_FormatDate ).' '.strftime( s:SV_FormatTime )
  end
  if a:format == 'y'
    return strftime( s:SV_FormatYear )
  end
endfunction    " ----------  end of function SV_InsertDateAndTime  ----------

"------------------------------------------------------------------------------
"  Substitute tags    {{{1
"------------------------------------------------------------------------------
function! SV_SubstituteTag( pos1, pos2, tag, replacement )
  "
  " loop over marked block
  "
  let  linenumber=a:pos1
  while linenumber <= a:pos2
    let line=getline(linenumber)
    "
    " loop for multiple tags in one line
    "
    let  start=0
    while match(line,a:tag,start)>=0        " do we have a tag ?
      let frst=match(line,a:tag,start)
      let last=matchend(line,a:tag,start)
      if frst!=-1
        let part1=strpart(line,0,frst)
        let part2=strpart(line,last)
        let line=part1.a:replacement.part2
        "
        " next search starts after the replacement to suppress recursion
        "
        let start=strlen(part1)+strlen(a:replacement)
      endif
    endwhile
    call setline( linenumber, line )
    let  linenumber=linenumber+1
  endwhile

endfunction    " ----------  end of function  Bash_SubstituteTag  ----------

"------------------------------------------------------------------------------
"  Bash-Comments : Insert Template Files    {{{1
"------------------------------------------------------------------------------
function! SV_CommentTemplates (arg)

  "----------------------------------------------------------------------
  "  SV templates
  "----------------------------------------------------------------------
  if a:arg=='frame'
    let templatefile=s:SV_Template_Directory.s:SV_Template_Frame
  endif

  if a:arg=='function'
    let templatefile=s:SV_Template_Directory.s:SV_Template_Function
  endif

  if a:arg=='task'
    let templatefile=s:SV_Template_Directory.s:SV_Template_Task
  endif

  if a:arg=='header'
    let templatefile=s:SV_Template_Directory.s:SV_Template_File
  endif

  if a:arg=='avm_named_component'
    let templatefile=s:SV_Template_Directory.s:SV_Template_Avm_Named
  endif

  if filereadable(templatefile)
    let  length= line("$")
    let  pos1  = line(".")+1
    let l:old_cpoptions  = &cpoptions " Prevent the alternate buffer from being set to this files
    setlocal cpoptions-=a
    if  a:arg=='header'
      :goto 1
      let  pos1  = 1
      exe '0read '.templatefile
    else
      exe 'read '.templatefile
    endif
    let &cpoptions  = l:old_cpoptions    " restore previous options
    let  length= line("$")-length
    let  pos2  = pos1+length-1
    "----------------------------------------------------------------------
    "  frame blocks will be indented
    "----------------------------------------------------------------------
    if a:arg=='frame'
      let  length  = length-1
      silent exe "normal =".length."+"
      let  length  = length+1
    endif
    "----------------------------------------------------------------------
    "  substitute keywords
    "----------------------------------------------------------------------
    "
    call  SV_SubstituteTag( pos1, pos2, '|FILENAME|',        expand("%:t")               )
    call  SV_SubstituteTag( pos1, pos2, '|DATE|',            SV_InsertDateAndTime('d') )
    call  SV_SubstituteTag( pos1, pos2, '|DATETIME|',        SV_InsertDateAndTime('dt'))
    call  SV_SubstituteTag( pos1, pos2, '|TIME|',            SV_InsertDateAndTime('t') )
    call  SV_SubstituteTag( pos1, pos2, '|YEAR|',            SV_InsertDateAndTime('y') )
    call  SV_SubstituteTag( pos1, pos2, '|AUTHOR|',          g:SV_AuthorName     )
    call  SV_SubstituteTag( pos1, pos2, '|EMAIL|',           g:SV_Email          )
    call  SV_SubstituteTag( pos1, pos2, '|AUTHORREF|',       g:SV_AuthorRef      )
    call  SV_SubstituteTag( pos1, pos2, '|PROJECT|',         g:SV_Project        )
    call  SV_SubstituteTag( pos1, pos2, '|COMPANY|',         g:SV_Company        )
    call  SV_SubstituteTag( pos1, pos2, '|COPYRIGHTHOLDER|', g:SV_CopyrightHolder)
    call  SV_SubstituteTag( pos1, pos2, '|DEPARTMENT|',      g:SV_Department)
    call  SV_SubstituteTag( pos1, pos2, '|CALL_ARG|',        g:call_arg)
    "
    " now the cursor
    "
    exe ':'.pos1
    normal 0
    let linenumber=search('|CURSOR|')
    if linenumber >=pos1 && linenumber<=pos2
      let pos1=match( getline(linenumber) ,"|CURSOR|")
      if  matchend( getline(linenumber) ,"|CURSOR|") == match( getline(linenumber) ,"$" )
        silent! s/|CURSOR|//
        " this is an append like A
        :startinsert!
      else
        silent  s/|CURSOR|//
        call cursor(linenumber,pos1+1)
        " this is an insert like i
        :startinsert
      endif
    endif

  else
    echohl WarningMsg | echo 'template file '.templatefile.' does not exist or is not readable'| echohl None
  endif
  return
endfunction    " ----------  end of function  SV_CommentTemplates  ----------
