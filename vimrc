set encoding=utf-8
set nocompatible
syntax on

filetype off
" Disable FuzzyFinder for old version of VIM
if v:version < '702'
  let g:pathogen_disabled = []
  call add(g:pathogen_disabled, 'l9')
  call add(g:pathogen_disabled, 'vim-fuzzyfinder')
  call add(g:pathogen_disabled, 'vimclojure')
endif

call pathogen#infect()
filetype plugin indent on

compiler ruby

highlight FoldColumn  gui=bold    guifg=grey65     guibg=Grey90
highlight Folded      gui=italic  guifg=Black      guibg=Grey90
highlight LineNr      gui=NONE    guifg=grey60     guibg=Grey90
set hlsearch
set number
set showmatch
set incsearch
set background=dark
set hidden
set backspace=indent,eol,start
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set ruler
set wrap
set dir=/tmp//
set scrolloff=5
set foldmethod=syntax
set foldlevelstart=20
set foldcolumn=0
set ignorecase
set smartcase

let g:AckAllFiles = 0
let g:AckCmd = 'ack --type-add ruby=.feature --ignore-dir=tmp 2> /dev/null'

let html_use_css=1
let html_number_lines=0
let html_no_pre=1

let vimclojure#WantNailgun = 0
let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

let g:rubycomplete_buffer_loading = 1

let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.(exe|so|dll|bak|orig|sw[po]|class|png|jpeg|jpg)$',
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|tmp|node_modules|vendor|source_maps|coverage)$'
  \ }
let g:ctrlp_match_window  = 'top,order:ttb,min:1,max:20,results:20'
let g:ctrlp_reuse_window = 'startify'

let g:no_html_toolbar = 'yes'

" Delete this line (or set g:autoclose_on to 1) to enable autoclose parens
let g:autoclose_on = 1
" au BufWinLeave * silent! mkview
" au BufWinEnter * silent! loadview

autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

autocmd FileType tex setlocal textwidth=78
autocmd BufNewFile,BufRead *.txt setlocal textwidth=78

autocmd FileType ruby runtime ruby_mappings.vim
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

imap <C-L> <SPACE>=><SPACE>
map <silent> <LocalLeader>cj :!clj %<CR>
map <silent> <LocalLeader>rt :!ctags -F `ack --ruby -f`<CR>
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
map <silent> <LocalLeader>ff :CtrlP<CR>
map <silent> <LocalLeader>fr :CtrlPClearCache<CR>
map <silent> <LocalLeader>be :CtrlPBuffer<CR>
map <silent> <LocalLeader>gd :e product_diff.diff<CR>:%!git diff<CR>:setlocal buftype=nowrite<CR>
map <silent> <LocalLeader>pd :e product_diff.diff<CR>:%!svn diff<CR>:setlocal buftype=nowrite<CR>
map <silent> <LocalLeader>nh :nohls<CR>
map <LocalLeader>aw :Ack '<C-R><C-W>'
map <silent> <LocalLeader>bd :bufdo :bd<CR>
map <silent> <LocalLeader>cc :TComment<CR>
map <silent> <LocalLeader>uc :TComment<CR>

" Travis hotkeys
nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical<CR>

"ws -- white space: removes all trailing whitespace from a file
map <silent> <LocalLeader>ws :%s/\s\+$//<CR>

"fl -- format line: expands a single line of parameters into multiple lines
map <silent> <LocalLeader>fl :s/\([;,{]\) */\1\r  /g<CR>:s/  }/}/g<CR>:nohls<CR>

"ss -- string-to-symbol: converts hash with string keys to symbol keys
map <silent> <LocalLeader>ss :%s/\[['"]\(.\{-}\)['"]]/[:\1]/g<CR>:nohls<CR>

"command Wsudo w !sudo tee %       <----uncomment for Shift+W sudo save"
cnoremap <Tab> <C-L><C-D>

if version >= 700
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us
  autocmd FileType tex setlocal spell spelllang=en_us
endif

if &t_Co == 256
  colorscheme vividchalk
endif

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
map <silent> <LocalLeader>hws :highlight clear ExtraWhitespace<CR>

" Highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%81v.*/
highlight LineLengthError ctermbg=black guibg=black
autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

"Set filetypes
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru,Guardfile,*.god}     set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                                         set ft=markdown
au BufNewFile,BufRead {*.coffee,*.coffee.erb}                                         set filetype=coffee
au BufNewFile,BufRead {*.eco,*.eco.erb}                                               set filetype=mason
au BufNewFile,BufRead {*.less,*.less.erb}                                             set filetype=less
au BufNewFile,BufRead *.js.erb                                                        set filetype=javascript
au BufNewFile,BufRead *.raml                                                          set filetype=yaml
au BufNewFile,BufRead {*.handlebars,*.hbs}                                            set filetype=handlebars
au BufRead,BufNewFile *.hamlbars                                                      set filetype=haml
au BufRead,BufNewFile *.jar,*.war,*.ear,*.sar,*.rar                                   set filetype=zip

set laststatus=2
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
set statusline+=%-40f\                    " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\                " file type
set statusline+=%10(L(%l/%L)%)\           " line
set statusline+=%2(C(%v/125)%)\           " column
set statusline+=%P                        " percentage of file

" Fix copy/paste on Ubuntu
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Create a VIM scratch file with F4
map <F4> :tabe ~/vim_scratch.txt<CR>
imap <F4> :tabe ~/vim_scratch.txt<CR>

" Ctags
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F5> :TlistToggle<cr>
nnoremap <F6> :GundoToggle<CR>

" Close window if NERDTree is only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Open NERDTree on launch if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" returns true iff is NERDTree open/active
function! RCisNTOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" returns true iff focused window is NERDTree window
function! RCisNTFocused()
  return -1 != match(expand('%'), 'NERD_Tree')
endfunction

" returns true iff focused window is FuzzyFinder
function! RCisFFFocused()
  return -1 != match(expand('%'), 'fuf')
endfunction

" returns true iff focused window is rspec
function! RCisRspecFocused()
  return -1 != match(expand('%'), 'rb_test_output')
endfunction

" calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! RCsyncTree()
  if &modifiable && RCisNTOpen() && !RCisNTFocused() && !RCisFFFocused() && !RCisRspecFocused() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

autocmd BufEnter * call RCsyncTree()

" Fix numpad escape character issue
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Op 0
imap <Esc>On .
imap <Esc>OR *
imap <Esc>OQ /
imap <Esc>Ol +
imap <Esc>OS -

"Map esc to jj
:imap jj <Esc>

" Enable PowerLine
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

" VIM Split Enhancements
nnoremap <M-Right> <C-W>l
nnoremap <M-Left> <C-W>h
nnoremap <M-Down> <C-W>j
nnoremap <M-Up> <C-W>k

" Pane resizing
noremap <C-M-Left> :vertical resize -2<CR>
noremap <C-M-Right> :vertical resize +2<CR>
noremap <C-M-Up> :resize +1<CR>
noremap <C-M-Down> :resize -1<CR>

" Disable Markdown folding
let g:vim_markdown_folding_disabled=1

" Enable Rubocop/Syntastic integration
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_html_tidy_ignore_errors=["proprietary attribute \"ng-", "trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]

" Vundle configuration
"call vundle#rc()
"Bundle 'gmarik/vundle'
"Bundle 'Valloric/YouCompleteMe'

" Allow local settings overrides with ~/.vimrc.local
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Fix segmentation fault issue with RVM / ZSH
let g:syntastic_shell = "/bin/sh"
