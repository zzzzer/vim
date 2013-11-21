so ~/.vim/vimrc.base

if v:version >= 700
  so ~/.vim/vimrc.extended
endif
set number
if has('gui_running')
"set the position and size when the window should start and how much
  set lines=70 columns=150
  winpos 10 0
  set guifont=DejaVu\ Sans\ Mono\ 10 
endif
