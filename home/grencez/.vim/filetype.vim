
" faust filetype file
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.fst		setfiletype faust
    au! BufRead,BufNewFile *.dsp		setfiletype faust
augroup END

autocmd BufRead,BufNewFile *.asd setf lisp
autocmd BufRead,BufNewFile *.pddl setf lisp
autocmd BufRead,BufNewFile *.4th setf forth
autocmd BufRead,BufNewFile *.v setf coq
"VIlisp (version 2.3)
"autocmd BufRead *.lsp,*.lisp so ~/hacking/vim/VIlisp/VIlisp.vim

" LyX document editing
autocmd BufRead,BufNewFile *.lyx set syntax=lyx foldmethod=syntax foldcolumn=3
autocmd BufRead,BufNewFile *.lyx syntax sync fromstart 

autocmd BufRead,BufNewFile *.s set ft=mips
autocmd BufRead,BufNewFile *.ms set ft=scheme lisp
autocmd BufRead,BufNewFile *.gplt set ft=gnuplot
autocmd BufRead,BufNewFile *.sxpr set ft=lisp lisp
autocmd BufRead,BufNewFile *.smt set ft=lisp lisp
"autocmd BufRead,BufNewFile *.blag set ft=txt tw=78
autocmd BufRead,BufNewFile *.html set sw=1
autocmd BufRead,BufNewFile *.asy set ft=asy cindent sw=2 ts=2
autocmd BufRead,BufNewFile ?akefile setlocal noexpandtab
autocmd BufRead,BufNewFile Jamfile set ft=jam 

autocmd BufNewFile,BufRead *.promela,*.pml,model set ft=promela sw=2 ts=2

au BufNewFile,BufRead *.cl setf opencl

au BufNewFile,BufRead *.pvs set ft=pvs sw=2 ts=2

au BufRead,BufNewFile *.maude,*.fm,*.itp set ft=maude
au BufRead,BufNewFile *.g set ft=antlr3
au BufRead,BufNewFile *.sis set ft=sisal

au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl

