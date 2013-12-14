" Vim indent file
" Language: MIPS Assembly

if exists ("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal indentexpr=GetMIPSIndent()


function GetMIPSIndent()
    let ind = 4
    let line = getline (v:lnum)

    if line =~ '^\s*\S\+:'
        let ind = 0
    elseif line =~ '^\s*#'
        let ind = 0
    endif

    return ind
endfunction


