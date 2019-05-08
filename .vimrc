let g:debuggerPort = 62343
syntax enable
"set background=dark
"colorscheme solarized
" Highlight trailing whitespace and tabs
highlight TrailingSpaces ctermbg=yellow
match TrailingSpaces /\s\+$\| \+$\|\t\+$/
set number
"set ls=2
"set laststatus=2
"set statusline+=%F
"set statusline="%F%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
"highlight BeginSpaces ctermbg=yellow
"match BeginSpaces /^\s\s+/

" no tabs allowed going forward!
":set tabstop=4 shiftwidth=4 expandtab"
:set tabstop=4 shiftwidth=4

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" this isn't working
fun! <SID>ConvertLeadingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/^\t/    /e
    call cursor(l, c)
endfun

autocmd FileType cfm,cfc,js,c,cpp,java,php,ruby,python,perl,yaml autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd FileType cfm,cfc,js,c,cpp,java,php,ruby,python,perl,yaml autocmd BufWritePre <buffer> :call <SID>ConvertLeadingWhitespaces()
