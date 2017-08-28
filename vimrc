so ~/.vim/vimrc.base
so ~/.vim/vimrc.vimbits

so ~/.vim/vimrc.neocomplete
so ~/.vim/vimrc.extended
so ~/.vim/vimrc.python
so ~/.vim/vimrc.easymotion_incsearch

set number
if has('gui_running')
"set the position and size when the window should start and how much
  set lines=70 columns=150
  winpos 10 0
  set guifont=DejaVu\ Sans\ Mono\ 10 
  "this doesnt work so good with nx in non 'gui' mode

endif
