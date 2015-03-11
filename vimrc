so ~/.vim/vimrc.base
so ~/.vim/vimrc.vimbits

if v:version >= 700
  so ~/.vim/vimrc.extended
  so ~/.vim/vimrc.python
  so ~/.vim/vimrc.easymotion_incsearch
endif
set number
if has('gui_running')
"set the position and size when the window should start and how much
  set lines=70 columns=150
  winpos 10 0
  set guifont=DejaVu\ Sans\ Mono\ 10 
  "this doesnt work so good with nx in non 'gui' mode

endif
