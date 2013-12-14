" Vim indent file
" Language:     Promela
" Author:       Oscar Hellström (oscar@oscarh.net)
" URL:          http://personal.oscarh.net
" License:      GPL (see http://www.gnu.org/licenses/gpl.txt)
" Last Change:  2006-02-16
" Version:      0.2
"
" Changelog:
"
" Version 0.2:
" Guards look for the correct begining of block, not just the closest.
" This means that guards will have the correct indentation even if there are
" nested blocks.
"
" Version 0.1:
" First try, introducing bugs :P

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal indentexpr=GetPromelaIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e
setlocal indentkeys+=od,fi,then,->,/,:,;

" Only define the function once.
if exists("*GetPromelaIndent")
    finish
endif

" blocks where both opening and closing are on the same line are ignored
" in fact, an block opening have to be the first and last thing on that line
" except for whitespaces
" TODO: maybe the begining and end of blocks sholud be more flexible?
let s:blockbeg = '^\s*\(.*{\|\<if\>\|\<do\>\)\s*$'
"let s:blockend = '^\s*\(}\s*$\|\<fi\>\|\<od\>\)\s*$'
let s:blockend = '^\s*\(}.*$\|\<fi\>;\?\|\<od\>;\?\)\s*$'
"let s:guard = '^\s*::.*\(->\|\<then\>\).*$'
let s:guard = '^\s*::.*$'

"function promela_offset_after(lnum)
"
"function promela_offset_on(lnum)
"
"    let line = getline(lnum)
"
"    " LABEL
"    if line =~ '^.*[^ :]\+:'
"        return -1 * true_indent(lnum -1)
"    endif
"
"    " COMMENT
"    if line =~ '^\s*/\*.*$'
"        return 1 + 
"    endif
"endfunction
"
"function true_indent(lnum)
"
"    let line = getline(lnum)
"    let label = '^.*[^ :]\+:'
"    let comment = '^\s*/\*.*$'
"    let offset = 0
"
"    while lnum > 0
"
"
"        if line =~ '^\s*$'
"            continue
"        elseif line =~ comment
"            let offset = offset - 1
"            break
"        elseif line =~ label
"            let offset = offset + 1
"        else
"            break
"        endif
"
"        let lnum = lnum + 1
"    endwhile
"
"    return &sw * offset + indent(lnum)
"endfunction


function GetPromelaIndent()

    " Get current line
    let line = getline(v:lnum)
    if line =~ '^\s*$'
        "return 0
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

    " LABEL
    let label = '^.*[^ :\[\]]\+:'
    while pline =~ label
        let pnum = prevnonblank(pnum - 1)
        let pline = getline(pnum)
        let ind = indent(pnum)
    endwhile

    if line =~ label
        return 0
    endif
    unlet label


    " Add a level if previous line is the begining of a block
    if pline =~ s:blockbeg
        if pline =~ '.*{.*'
            let ind = ind + &sw
        else
            let ind = ind + 2* &sw
        endif
    endif

    " COMMENT
    let comment = '^\s*/\*.*$'
    if line =~ comment
        let ind = ind + &sw
    endif

    if pline =~ comment
        let ind = ind - &sw
    endif
    unlet comment

    " CONTINUED COMMENT
    let cont_comment = '^\s*\*[ /].*$'
    if line =~ cont_comment
        let ind = ind + &sw + 1
    endif

    if pline =~ cont_comment
        let ind = ind - &sw - 1
    endif
    unlet cont_comment

    " Add one level if previous line is a guard
    if pline =~ s:guard
        "let ind = ind + &sw
        let ind = ind + 3
    endif
    if v:lnum == 0
        return 0
    endif

    " Other junk
    if line =~ s:guard || line =~ s:blockend
        " find previous guard or begining of the correct block
        let cnum = prevnonblank(v:lnum - 1)

        let nc = 0
        let shift = &sw
        let shift = 0


        if line =~ s:blockend
            let shift = 0
        endif
        let origline = line

        while cnum > 0
            let line = getline(cnum)
            if line =~ s:blockbeg 
                if nc == 0 " this is the begining of the correct block
                    if line =~ s:guard 
                        let shift = shift + 3
                    endif
                    return indent(cnum) + shift
                else
                    let nc = nc - 1
                endif
            elseif line =~ s:blockend " there is a nested block above
                let nc = nc + 1    
            elseif nc == 0 && line =~ s:guard && origline =~ s:guard
                return indent(cnum)
            endif
            " check line before
            let cnum = prevnonblank(cnum - 1)
        endwhile
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
