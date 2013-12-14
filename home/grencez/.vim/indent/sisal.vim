" Vim indent file
" Language:     SISAL
" Author:       Alex Klinkhamer
" URL:          http://grencez.codelove.org
" License:      Public Domain
" Last Change:  2011-02-16
" Version:      0.1

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal indentexpr=GetSisalIndent()
setlocal indentkeys=<Space>,end

" Only define the function once.
if exists("*GetSisalIndent")
    finish
endif

" blocks where both opening and closing are on the same line are ignored
" in fact, an block opening have to be the first and last thing on that line
" except for whitespaces
let s:comment = '^.*%.*$'
let s:blockbeg = '^.*\<\(for\|if\|let\)\>.*$'
let s:blockmid = '^\s*\<\(while\|in\|repeat\|returns\|until\|then\|else\)\>.*$'
let s:blockend = '^.*\<end\>\s\+\<\(for\|if\|let\)\>.*$'


function GetSisalIndent()

    " Get current line
    let line = getline(v:lnum)
    if line =~ '^\s*$'
        return 0
    endif

    " Find a non-blank line above the current line.
    let pnum = prevnonblank(v:lnum - 1)

    let pline = getline(pnum)

    if pnum == 0
        let ind = 0
    else
        " In most cases just keep previous indentation
        let ind = indent(pnum)
    endif

    if pline =~ s:comment
        let pline = substitute(pline, '%.*$', '', 'g')
    endif
    if line =~ s:comment
        let line = substitute(line, '%.*$', '', 'g')
    endif

    if line =~ s:blockend || line =~ s:blockmid
        if pline =~ s:blockend || !(pline =~ s:blockbeg || pline =~ s:blockmid)
            let ind = ind - &sw
        endif
    elseif pline =~ s:blockend
        " Nothing!
    elseif pline =~ s:blockbeg || pline =~ s:blockmid
        " Add a level if previous line is the begining of a block
        let ind = ind + &sw
    endif

    if ind < 0
        let ind = 0
    endif

    return ind
endfunction

function s:PrevMatchBlock(end)
    if a:end == 'od'
        let begin = '\<do\>'
        let end = '\<od\>'
    elseif a:end == '}'
        let begin = '{'
        let end = '}'
    else
        let begin = '\<if\>'
        let end = '\<fi\>'
    endif
    
    call search(end, 'bW')
    return searchpair(begin, '', end, 'Wbn')
endfunction
