set tabstop=4 shiftwidth=4
set nu rnu
syntax enable
filetype plugin indent on

call plug#begin("~/.local/share/nvim/plugged")

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'
Plug 'junegunn/fzf'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'vim-airline/vim-airline'
Plug 'mboughaba/i3config.vim'
Plug 'LnL7/vim-nix'
Plug 'alvan/vim-closetag'

call plug#end()

let g:asyncomplete_auto_popup = 0

" Ctrl+p opens FZF
nnoremap <C-p> :FZF<CR>

set showcmd

" leader is space
let mapleader = " "

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> <leader>gd <plug>(lsp-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> <leader>n <plug>(lsp-next-diagnostic)
    nmap <buffer> <leader>p <plug>(lsp-previous-diagnostic)
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

augroup aureset
	autocmd!
augroup END

" shiftwidth
" tabstop
" softtabstop
" autocmd aureset BufNewFile,BufRead *.nix set sw=2
