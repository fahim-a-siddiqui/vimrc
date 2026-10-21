set nocompatible
syntax on
set modelines=0
set number
set encoding=utf-8
set wrap

set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set copyindent
set expandtab
set noshiftround

set hlsearch
set incsearch
set showmatch
set smartcase

set hidden
set ttyfast
set laststatus=2

set showcmd
set background=dark

" CompileAndRun() add-on feature
function! CompileAndRun()
        let ext = expand("%:e")
        if ext ==# "c"
                execute "!gcc %:p -o %:p:r -lm && %:p:r"
        elseif ext ==# "cpp"
                execute "!g++ %:p -o %:p:r && %:p:r"
        elseif ext ==# "asm"
                execute "!nasm -f elf64 %:p -o %:p:r.o && ld %:p:r.o -o %:p:r && %:p:r"
        elseif ext ==# "s"
                execute "!as %:p -o %:p:r.o && ld %:p:r.o -o %:p:r && %:p:r"
        elseif ext ==# "rs"
                execute "!rustc %:p -o %:p:r && %:p:r"
        elseif ext ==# "py"
                execute "!python3 %:p"
        elseif ext ==# "hs"
                execute "!runghc %:p"
        elseif ext ==# "ts"
                execute "!tsc %:p --outFile %:p:r.js && node %:p:r.js"
        elseif ext ==# "js"
                execute "!node %:p"
        endif
endfunction

nnoremap <F5> :call CompileAndRun() <CR>
