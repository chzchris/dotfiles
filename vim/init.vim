call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'

Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive' | Plug 'gregsexton/gitv'
Plug 'vinsonchuong/vim-stdtabs'
Plug 'sheerun/vim-polyglot'

Plug 'kana/vim-textobj-user'
Plug 'thinca/vim-textobj-between'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'whatyouhide/vim-textobj-erb'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-lastpat'
Plug 'kana/vim-textobj-line'
Plug 'sgur/vim-textobj-parameter'
Plug 'saaguero/vim-textobj-pastedtext'
Plug 'kana/vim-textobj-syntax'
Plug 'whatyouhide/vim-textobj-xmlattr'

Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-grepper'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'

Plug 'ervandew/supertab'
call plug#end()

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set clipboard=unnamed

set nowrap
set number
set numberwidth=5
set undofile

set shiftwidth=2
set expandtab
set tabstop=2

set completeopt-=preview
let g:SuperTabDefaultCompletionType = 'context'

colorscheme solarized
set background=dark
let g:lightline={'colorscheme': 'solarized_dark'}

let g:unite_cursor_line_highlight='CursorLine'
let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_selecta'])

let mapleader="\<Space>"
nnoremap <Leader>f :Unite -no-split -hide-source-names -start-insert file_rec/async file/new<CR>
nnoremap <Leader>u :UndotreeToggle<CR>
nnoremap <Leader>g :tab split README.md \| Gstatus<CR>
nnoremap <Leader><CR> :execute "!rspec %:" . line(".")<CR>
nnoremap <Leader>j :Java %<CR>
nnoremap <Leader>i :JavaImportOrganize<CR>
nnoremap <Leader>s :JavaSearch<CR>
let g:EclimJavascriptValidate=0

command! -nargs=* Ag Grepper -noprompt -tool ag -grepprg ag --nogroup --nocolor --column <args>

"Change vim treeview style
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

"Allow Tree to be toggled
let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
nnoremap <Leader>= :call ToggleNetrw()<CR>
