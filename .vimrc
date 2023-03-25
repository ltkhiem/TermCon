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

"Vim Copilot
Plugin 'github/copilot.vim'

"Vim LaTex
Plugin 'lervag/vimtex'

"Vim markdown preview
Plugin 'iamcco/markdown-preview.nvim'

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

" ----- LaTeX settings -----
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0
let g:vimtex_compiler_latexmk = {
      \ 'options' : [
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \   '-pdf',
      \   '-shell-escape',
      \   '-xelatex',
      \   '-outdir=' . expand('%:p:h'),
      \ ],
      \}
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_open_on_error = 0
let g:vimtex_mapleader = ','

" ----- Markdown Preview Settings -----
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'dark'

" ----- Competitive Programming C++ settings -----
autocmd FileType cpp nnoremap     <leader>rm    :!g++ -g --std=c++11 % -o %:r<CR>
autocmd FileType cpp nnoremap     <leader>rr    :!./%:r<CR>
autocmd FileType cpp nnoremap     <leader>rt    :!for f in %:r.*.test; do echo "TEST: $f"; ./%:r < $f; done<CR>
autocmd FileType cpp set tabstop=4
autocmd FileType cpp set shiftwidth=4
autocmd FileType cpp set expandtab
autocmd FileType cpp set softtabstop=4

