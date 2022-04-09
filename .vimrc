set nocompatible
set backspace=indent,eol,start
filetype off

"-------------- Vim Plugins --------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Vundle - plugin manager
Plugin 'VundleVim/Vundle.vim' 

"Vim Airline
Plugin 'vim-airline/vim-airline'

"Vim color scheme
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'chriskempson/base16-vim'
Plugin 'dracula/vim'

"Track git status
Plugin 'airblade/vim-gitgutter'

"Vim Project tree view 
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

"Vim autocomplete
"Plugin 'Valloric/YouCompleteMe'

"Vim easytags
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'

"View list of files
Plugin 'kien/ctrlp.vim'

"Vim Auto-fill delimiters
Plugin 'Raimondi/delimitMate'

"Vim Rainbow CSV
Plugin 'mechatroner/rainbow_csv'

"Vim Smooth Scroll
Plugin 'terryma/vim-smooth-scroll'

"Vim icons for plugin
Plugin 'ryanoasis/vim-devicons'

"Vim syntax for nerdtree on common file extensions
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

"Vim color scheme
Plugin 'morhetz/gruvbox'

"Vim floating terminal
Plugin 'voldikss/vim-floaterm'

"Vim commentary, for commenting stuff out
Plugin 'tpope/vim-commentary'

call vundle#end()
filetype plugin indent on
"-----------------------------------------


"Set vim color scheme
set t_Co=256

"Set line number
set number

"Set relative line numbering
set relativenumber

"set norelativenumber  "turn relative line numbers off
"set relativenumber!   "toggle relative line numbers

"Set color scheme -- Uncomment the corresponding line for scheme
"colorscheme dracula
"let g:airline_theme='onehalfdark'
autocmd vimenter * ++nested colorscheme gruvbox

if &term =~ '256color'
	  " disable Background Color Erase (BCE) so that color schemes
	  " render properly when inside 256-color tmux and GNU screen.
	  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif

"Enable syntax to highlight code
syntax on

"Youcompleteme auto close preview window after insertion
let g:ycm_autoclose_preview_window_after_insertion = 1

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0


" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)


" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END


" ----- Gitgutter settings -----
" whether to show gitgutter in nerdtree or not
let g:gitgutter_eager = 1


" ----- Smooth scroll settings -----
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 6, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 6, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


" ----- Devicons settings ----- 
set encoding=UTF-8


" ----- Gruvbox settings -----
set background=dark

nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

" ----- Floaterm settings -----
cnoreabbrev ftn FloatermNew
cnoreabbrev ftt FloatermToggle

