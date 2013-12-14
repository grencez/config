" Vim syntax file
" Language:       Promela
" Maintainer:       Viliam Holub <holub@nenya.ms.mff.cuni.cz>
" Last Change:       2006 Oct 27
" Filenames:       *.sisal
" URL:              http://nenya.ms.mff.cuni.cz/~holub/
" Credits:        Some ideas has been stolen from the official c.vim file.

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

syntax case match

" Comments
syn keyword  sisalTodo         contained TODO FIXME XXX
syn region   sisalComment     start="%" skip="\\$" end="$" keepend contains=sisalTodo

" Promela constants
syn region       sisalString              start=+"+ skip=+\\"+ end=+"+
syn match       sisalNumber              "\<[0-9]\+\>"

" Statements
syn keyword        sisalStatement for end if then else while repeat function until returns old in
syn keyword        sisalOperator                  + - / * **

" Types
syn keyword sisalType  real

" Basic block definition
syntax region sisalBlock  start="{" end="}" transparent fold

" Define the default highlighting.
hi def link sisalComment        Comment
hi def link sisalString         String
hi def link sisalNumber         Number
hi def link sisalStatement      Statement
hi def link sisalOperator       Operator
hi def link sisalType           Type
hi def link sisalTodo           Todo

let b:current_syntax = "sisal"

