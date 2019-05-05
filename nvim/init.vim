set diffopt=vertical
set hidden
set ruler

" line options
set cursorline
set nowrap
set number
set relativenumber
set textwidth=75
match ErrorMsg /\%>75v.\+/
match ErrorMsg /\s\s*$/

set splitbelow
set splitright

" tap options
set expandtab shiftwidth=4 tabstop=4

set smartcase

" Persistent undo
if has('persistent_undo')
    set undodir=$HOME/.vim_undo_dir
    set undofile
end

function! DeleteTrailingWhitespace()
    normal ma
    let _s=@/
    %s/\s\+$//e
    let @/=_s
    normal `a
endfunction

nnoremap <silent> <BS> :nohlsearch<CR>
nnoremap <silent> <F5> :call DeleteTrailingWhitespace()<CR>
nnoremap <silent> <leader>l :set list!<CR>
nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l
tnoremap <M-h> <c-\><c-n><c-w>h
tnoremap <M-j> <c-\><c-n><c-w>j
tnoremap <M-k> <c-\><c-n><c-w>k
tnoremap <M-l> <c-\><c-n><c-w>l

packadd minpac
call minpac#init()

call minpac#add('airblade/vim-gitgutter')
call minpac#add('alvan/vim-closetag')
call minpac#add('cohama/lexima.vim')
call minpac#add('ervandew/supertab')
call minpac#add('godlygeek/tabular', {'type': 'opt'})
call minpac#add('junegunn/fzf')
call minpac#add('luochen1990/rainbow')
call minpac#add('mhinz/vim-grepper')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('benekastah/neomake')

" C/C++
call minpac#add('majutsushi/tagbar', {'type': 'opt'})
call minpac#add('octol/vim-cpp-enhanced-highlight')
call minpac#add('vim-scripts/a.vim')

" CSV
call minpac#add('mechatroner/rainbow_csv')

" Javascript
call minpac#add('ap/vim-css-color')
call minpac#add('mxw/vim-jsx')
call minpac#add('pangloss/vim-javascript')

" Color schemes
call minpac#add('NLKNguyen/papercolor-theme')
call minpac#add('ajh17/spacegray.vim')
call minpac#add('cocopon/iceberg.vim')
call minpac#add('dikiaap/minimalist')
call minpac#add('henrynewcomer/vim-theme-papaya')

command PackUpdate call minpac#update()
command PackClean call minpac#clean()

colorscheme minimalist

" neovim
set clipboard+=unnamedplus

" rainbow
let g:rainbow_active=1

" Use the same symbols as TextMate for tabstops and EOLs<Paste>
set listchars=tab:▸\ ,eol:¬

" Improve the display of wrapped lines
set showbreak=↪

let g:grepper={}
let g:grepper.tools=['rg']

" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>

" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

let &path.="include"
