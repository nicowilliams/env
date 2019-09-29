
" NO ALTERNATE SCREEN!!!!!
set t_ti= t_te=

set background=dark
" set modelines=0
set encoding=utf-8
set nocompatible
set syntax=enable
syntax on
set ai
set smarttab
set shiftwidth=2
set softtabstop=4
set tabstop=8
set showmode
set tw=72
set hlsearch
filetype plugin on
filetype indent on

set expandtab
set cinoptions=p0,t0,+4,(0,u4,U1,:0
set formatoptions=croqt
" set comments=sr:/*,mb:*,ex:*/,://

autocmd BufNewFile,BufRead /home/nico/ws/heimdal/* set shiftwidth=4 softtabstop=4 expandtab tw=79
autocmd BufNewFile,BufRead /home/nico/ws/jq/* set shiftwidth=2 softtabstop=2 expandtab tw=110
autocmd BufNewFile,BufRead /home/nico/ws/postgres/* set shiftwidth=4 softtabstop=4 noexpandtab tw=110

function! Paste_Func()
    let s:inPaste = &paste
    if !s:inPaste
        set paste
    endif

    echom s:inPaste
    augroup paste_callback
        autocmd!
        autocmd InsertLeave <buffer> call Paste_End()
    augroup END

    startinsert
endfunction

function! Paste_End()
    augroup paste_callback
        autocmd!
    augroup END
    augroup! paste_callback

    if !s:inPaste
        set nopaste
    endif
endfunction

map _i :call Paste_Func()<cr>
