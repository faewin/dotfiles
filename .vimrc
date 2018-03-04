call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'gregsexton/MatchTag'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'juanedi/predawn.vim'
Plug 'junegunn/seoul256.vim'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'travisjeffery/vim-auto-mkdir'
Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/indentLine'
Plug 'yuttie/comfortable-motion.vim'
Plug 'mileszs/ack.vim'
"Plug 'tmhedberg/SimpylFold'

call plug#end()

let mapleader=','
noremap j gj
noremap k gk
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>tb :TagbarOpen<CR>
nnoremap <Leader>go :!clear && python %<CR>
autocmd VimEnter * nested :TagbarOpen
autocmd BufWritePre * :%s/\s\+$//e

"generic settings
syntax on
colorscheme predawn
set backspace=2
set clipboard=unnamed
set encoding=utf-8
set incsearch
set list lcs=tab:␉·,trail:·
set nobackup
set nohlsearch
set noswapfile
set nowritebackup
set number
set pastetoggle=<leader>p
set splitright
hi NonText ctermbg = none
hi Normal ctermbg  = none
"set list lcs=trail:·
"set list lcs=tab:␉\ \,trail:·

"indentLine
let g:indentLine_char = '|'

"status line
set laststatus=2
"set statusline=\ %f\ %m%r%y\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}\ %=%-14.(%l,%c%V%)\ \[%p%%]

"ctrl-p
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|pyc'

"Ultisnips
let g:UltiSnipsExpandTrigger       =  "<c-k>"
let g:UltiSnipsJumpForwardTrigger  =  "<c-k>"
let g:UltiSnipsJumpBackwardTrigger =  "<c-j>"

"syntastic
let g:syntastic_python_checkers          =  ['flake8']
let g:syntastic_always_populate_loc_list =  1
let g:syntastic_auto_loc_list            =  1
let g:syntastic_check_on_open            =  1
let g:syntastic_check_on_wq              =  0
let g:syntastic_quiet_messages           =  {
    \ 'regex': ['E221', 'E222']
    \ }

"lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active' : {
      \   'left' : [ [ 'mode', 'paste' ],
      \              [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'syntastic', 'lineinfo'],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ }
      \ }
let g:syntastic_mode_map = { 'mode': 'passive' }
augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

"test
let g:multi_cursor_quit_key='<C-c>'
nnoremap <C-c> :call multiple_cursors#quit()<CR>

