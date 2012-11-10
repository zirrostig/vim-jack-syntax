" Syntax highlighting for the Jack Language
" Used in The Elements of Computing Systems (TECS) Book
"
" Author:    Zachary Stigall
" Email:     zirrostig <at> lanfort.org
" Date:      9 Nov 2012

if exists("b:current_syntax")
    finish
endif

" Reserved Words
syn keyword jack_reserved   class constructor method function
syn keyword jack_reserved   int boolean char void
syn keyword jack_reserved   var static field
syn keyword jack_reserved   let do if else while return
syn keyword jack_reserved   true false null
syn keyword jack_reserved   this

" Integers
syn match jack_int_pos       '\d\+'
syn match jack_int_neg       '-\d\+'
syn cluster jack_int         contains=jack_int_pos,jack_int_neg

" Identifier
syn match jack_identifier    '\v\h\w*'

" Symbols
syn keyword jack_list_sep      ,
syn keyword jack_line_term     ;
syn keyword jack_assign_comp   =
syn keyword jack_member        .
syn keyword jack_operator      + - * / & | ~ < >

" Regions
syn region jack_block                start=/{/ end=/}/ fold transparent
syn region jack_exp                  start=/(/ end=/)/
syn region jack_index                start=/[/ end=/]/ contains=jack_int_pos
syn region jack_string               start=/"/ end=/"/

" Comments
syn keyword jack_comment_todo        TODO FIXME XXX NOTE        contained
syn match   jack_comment_line        '\/\/.*$'                  contains=comment_todo,@spell
syn region  jack_comment_multiline   start='\/\*' end='\*\/'    contains=comment_todo,@spell
syn region  jack_comment_api         start='\/\*\*' end='\*\/'  contains=comment_todo,@spell
