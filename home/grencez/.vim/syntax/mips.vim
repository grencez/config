" Vim syntax file
" Language:    MIPS Assembly
" Maintainer:  Alex Klinkhamer <grencez@gmail.com>

syntax clear

"-----------------------------------------------------------------------
" Arithmetic:

syn keyword mipsOpR      add     addu      sub     subu
syn keyword mipsOpI     addi    addiu
syn keyword mipsOpR     mult      div

"-----------------------------------------------------------------------
" Data Transfer:

syn keyword mipsOpI       ld       lw       lh      lhu       lb
syn keyword mipsOpI      lbu       sd       sw       sh       sb
syn keyword mipsOpI      lui
syn keyword mipsOpR     mfhi     mflo     mfcZ     mtcZ
syn keyword mipsOpI     lwcZ     swcZ

"-----------------------------------------------------------------------
" Logical:

syn keyword mipsOpR      and       or      slt      xor      nor
syn keyword mipsOpI     andi      ori     slti

"-----------------------------------------------------------------------
" Bitwise Shift:

syn keyword mipsOpR      sll      srl      sra 

"-----------------------------------------------------------------------
" Branch:

syn keyword mipsOpI      beq      bne
syn keyword mipsOpR       jr
syn keyword mipsOpJ        j      jal

"-----------------------------------------------------------------------
" Pseudo Instruction:

syn keyword mipsOpP       la       li      bgt      blt      bge
syn keyword mipsOpP      ble     bgtu     bgtz      nop     break
syn keyword mipsOpP  syscall 

" Comment:
syn match mipsComment    "#.*$"

" Number:
syn match mipsNumber     "\d\+\.\?\d*"

" Register:
syn match mipsRegister   "\$[^ ,)]\+"

" String:
syn match mipsString     '".*"'

" Label:
syn match mipsLabel     "[^ ]\+:"

" Segment
syn match mipsSegment  "\.text"
syn match mipsSegment  "\.data"


"highlight mipsOpR     ctermfg=green guifg=vreen
"highlight mipsOpI     ctermfg=cyan  guifg=cyan
"highlight mipsComment ctermfg=darkred   guifg=darkred
"highlight mipsOpP     ctermfg=cyan  guifg=cyan

hi link mipsSegment          PreProc
hi link mipsLabel              Label
hi link mipsString            String
hi link mipsChar           Character
hi link mipsRegister      Identifier
hi link mipsComment          Comment
hi link mipsNumber            Number
hi link mipsOpR             Function
hi link mipsOpI             Function
hi link mipsOpJ             Function
hi link mipsOpP            Statement

let b:current_syntax = "mips"

