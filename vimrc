
"--
"-- Settings
"--

" forget vi compatibility - REQUIRED
set nocompatible
 
" turn filetype off and 
" load pathogen (we'll turn filetype back on later)
filetype off
execute pathogen#infect()

" text editing settings
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab
set foldmethod=indent
set foldlevel=99
set backspace=indent,eol,start

" hate beeps
set visualbell
set history=100

" highlight search matches
set hlsearch
" search ahead while typing
set incsearch
set showmatch

set number

" ignore these file types
set wildignore=*.swp,*.bak,*.pyc,*.class

syntax on

set background=dark
" set gfn=Monaco:h12
colorscheme jellybeans
" colorscheme solarized

" Tell rope to bite me
let g:pymode_rope = 0
" Tell rope to be less search intensive
let g:pymode_rope_lookup_project = 0


"--
"-- auto commands
"--

if has("autocmd")
    filetype on
    filetype plugin on
    filetype plugin indent on

    " based on file type
    "--
    augroup filetype_autocmds
        autocmd!
        " enforce some PEP-8 settings for python code
        autocmd Filetype python set expandtab
	    autocmd Filetype python set softtabstop=4
	    autocmd Filetype python set shiftwidth=4
        autocmd FileType python set omnifunc=pythoncomplete#Complete
        " highlight characters past column 80
        autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
        autocmd FileType python match Excess /\%80v.*/
	    " don't let lines auto wrap
        autocmd FileType python set nowrap
	    " translate my retrun into return
	    autocmd FileType python abbr retrun return
        " turn on spell check for text like docs
        " and auto-break lines at 80 characters
        autocmd FileType markdown setlocal spell
        autocmd FileType markdown set textwidth=79
        " enable the file extension .md as type markdown
        autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    augroup END

    " nerdtree autocmds
    "--
    augroup nerdtree_group
        autocmd!
        " open nerdtree automatically if vim started with no file
        autocmd vimenter * if !argc() | NERDTree | endif
    augroup END

    " auto reload .vimrc when it changes
    "--
    augroup reload_vimrc
        autocmd!
        autocmd BufWritePost $MYVIMRC source $MYVIMRC
    augroup END

endif


"--
"-- key mappings
"--

" null map Q (enter ex mode)
nnoremap Q <nop>

" unhighlight found items
nmap <silent> <Leader>/ :nohlsearch<CR>

" Markdown to HTML  
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr></cr></leader>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Select all text in current buffer
map <Leader>a ggVG

" Toggle NERDTree on and off
map <Leader>nt :NERDTreeToggle<CR>

" Toggle Tagbar
map <Leader>tb :TagbarToggle<CR>

" Toggle gundo
nnoremap <leader>gu :GundoToggle<CR>
