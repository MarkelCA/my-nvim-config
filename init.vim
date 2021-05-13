"ENV VARIABLE 
let $INIT = '~/.config/nvim/init.vim' 

"EDITOR
	set nu
	set rnu
	set mouse=a "Habilita el ratón para desplazarse
	set clipboard=unnamed "Habilita el portapapeles del sistema 
    nnoremap # *N
    nnoremap * *N
    let g:airline_powerline_fonts = 1

"File and format
	set nobackup 
	set noundofile 
	set encoding=utf-8 
	set showmatch "para mostrar el parentesis que cierra cuando me situo encima de uno
    set tabstop=4
    set shiftwidth=4
    set expandtab
"NERDTree
	let NERDTreeQuitOnOpen=1

" Atajos
	let mapleader=" "
	nmap <Leader>s <Plug>(easymotion-s2)
	nmap <Leader>nt :NERDTreeFind<CR>	
	nmap <Leader>w : w<CR>
	nmap <Leader>q : q<CR>
	nmap <Leader>t zt
	nmap <Leader>b zb
	nmap <Leader>m zz
	nmap <Leader>c :! 
    noremap  J 10j
    noremap  K 10k
    noremap <S-y> "+y
    noremap <C-j><C-j> :,+j<CR>
    tnoremap <Esc> <C-\><C-n>
    "nnoremap <C-j> <C-d>
    "nnoremap <C-k> <C-u>

	let g:user_emmet_leader_key=',' "emmet key
    nnoremap <S-Right> :tabnext<CR>
    nnoremap <S-Left> :tabprevious<CR>
    nnoremap <S-l> :tabnext<CR>
    nnoremap <S-h> :tabprevious<CR>
    nnoremap :c :! gcc % && ./a.out<CR> 
    "compile and run
    nnoremap :cc :! gcc %<CR>
    "compile and run
    nnoremap :ccp :! g++ %<CR>
    nnoremap :s :! gcc % && size<CR>
    nnoremap :p :! python3 % <CR>
    nnoremap  <S-f> :CocFix<CR>


" PLUGINS VIM-PLUG
call plug#begin('~/.vim/plugged')
    " Themes
    Plug 'morhetz/gruvbox'
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    "Plug 'itchyny/lightline.vim' "Barra inferior tuneada
    Plug 'yuezk/vim-js'
    Plug 'maxmellon/vim-jsx-pretty'
    " Barra inferior
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " IDE
    Plug 'easymotion/vim-easymotion'
    Plug 'scrooloose/nerdtree'
    Plug 'christoomey/vim-tmux-navigator'
    " Use release branch (recommend)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Search files
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

    " Atajos
    Plug 'mattn/emmet-vim'
    Plug 'preservim/nerdcommenter'

    " Git
    Plug 'tpope/vim-fugitive'
call plug#end()

"VUNDLE PLUGINS
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    "Enable Vundle
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'nelsyeung/twig.vim' "Twig syntax highlight
    "Rainbow brackets
    Plugin 'frazrepo/vim-rainbow'

    " Autoclose pairs
    Plugin 'spf13/vim-autoclose'

call vundle#end()            " required
filetype plugin on
"............ESTILOS.......................
    set guifont=DejaVu\ Sans\ Mono
	syntax enable "Subrayado de sintaxis
	set numberwidth=1
	set showcmd "muestra los comando que estoy ejecutando
	set ruler "mostrar numero de linea (por defecto en nvim)
	set laststatus=2 "muestra la barra (no esta por defecto en vim)
	syntax on
	"let g:rainbow_active = 1 "Enable rainbow brackets
	set t_Co=256
	set cursorline
    colorscheme onehalfdark
    "colorscheme gruvbox
    hi Normal guibg=NONE ctermbg=NONE
    au BufReadPost *.theme set syntax=php " set syntax to php for drupal theme files
    au BufReadPost *.install set syntax=php " set syntax to php for drupal module install files
    au BufReadPost *.module set syntax=php " set syntax to php for drupal module files

" COC AUTOCOMPLETION
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> T :call <SID>show_documentation()<CR>

" Use K to show documentation in preview window.
nnoremap <silent> T :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Maps double i to escape
":imap ii <Esc>
