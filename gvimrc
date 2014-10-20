colorscheme hybrid
if has("mac")
  set fuopt=maxhorz,maxvert
  set guifont=Ubuntu\ Mono\ derivative\ Powerline:h18
else
  set guifont=Ubuntu\ Mono\ derivative\ Powerline Medium\ 13
end

set guioptions-=T  "remove toolbar
set guioptions-=m  "remove menu

set lines=47
set columns=161

" Allow local settings overrides with ~/.gvimrc.local
if filereadable(glob("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
