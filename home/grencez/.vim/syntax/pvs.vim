" Vim syntax file
" Language:	PVS
" Maintainer:	Alex Klinkhamer <grencez@codelove.org>
" Last Change:	2012 Sep 23
" Filenames:	*.pvs

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
	finish
endif

syntax case ignore

" Comments
syn keyword pvsTodo    contained TODO FIXME XXX
syn region  pvsComment start="%" skip="\\$" end="$" keepend contains=pvsTodo

" Constants
syn region  pvsString  start=+"+ skip=+\\"+ end=+"+
syn match   pvsNumber  "\<[0-9]\+\>"
syn keyword pvsBoolean true false TRUE FALSE

" Identifiers
syn keyword pvsSyntax begin end
syn keyword pvsSyntax if then else endif
syn keyword pvsSyntax not with forall
syn keyword pvsSyntax type var
syn keyword pvsSyntax recursive measure lambda
syn keyword pvsSyntax theory conjecture axiom lemma

syn keyword pvsLambda lambda

" Define the default highlighting.
hi def link pvsComment Comment
hi def link pvsString String
hi def link pvsTodo Todo
hi def link pvsNumber Number
hi def link pvsBoolean Boolean
hi def link pvsSyntax Statement
hi def link pvsLambda Constant

let b:current_syntax = "pvs"

" vim: ts=8
