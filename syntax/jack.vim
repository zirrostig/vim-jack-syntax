"Syntax highlighting for the Jack Language
"Used in The Elements of Computing Systems (TECS) Book
"
"Author:    Zachary Stigall
"Email:     zirrostig <at> lanfort.org
"Date:      10 Nov 2012

if exists("b:current_syntax")
    finish
endif

"Reserved Words
syn keyword jack_reserved_class         class
syn keyword jack_reserved_define        constructor method function skipwhite nextgroup=jack_primitive,jack_type
syn keyword jack_reserved_primitive     int boolean char void skipwhite=jack_identifier,jack_function_def
syn keyword jack_reserved_declare       var static field skipwhite nextgroup=jack_primitive,jack_type
syn keyword jack_reserved_conditional   if else
syn keyword jack_reserved_do            do      skipwhite nextgroup=jack_function
syn keyword jack_reserved_let           let     skipwhite nextgroup=jack_identifier
syn keyword jack_reserved_repeat        while
syn keyword jack_reserved_label         return
syn keyword jack_reserved_label         return skipwhite nextgroup=jack_exp,jack_identifier
syn keyword jack_reserved_bool          true false
syn keyword jack_reserved_null          null
syn keyword jack_reserved_reference     this

"Integers
"Negative Integers, are the '-' operator followed by an int
syn match jack_int           '\d\+' skipwhite nextgroup=jack_operator

"Identifier
syn match jack_type          '\v\h\w*'              skipwhite nextgroup=jack_function_def,jack_identifier
syn match jack_identifier    '\v\h\w*'
syn match jack_identifier    '\v\h\w*'              skipwhite nextgroup=jack_operator,jack_assign_comp,jack_index
syn match jack_function      '\v(\h\w*\.)*(\h\w*)'  skipwhite nextgroup=jack_exp
syn match jack_function_def  '\v\h\w*'              skipwhite nextgroup=jack_exp

"Symbols
syn match jack_list_sep      ','
syn match jack_line_term     ';$'
syn match jack_assign_comp   '='    skipwhite nextgroup=jack_exp,jack_int,jack_identifier,jack_string,jack_function,jack_reserved_bool,jack_reserved_null,jack_reserved_reference
syn match jack_member        '.'
syn match jack_operator      '+'    skipwhite nextgroup=jack_exp,jack_int,jack_identifier
syn match jack_operator      '-'    skipwhite nextgroup=jack_exp,jack_int,jack_identifier
syn match jack_operator      '*'    skipwhite nextgroup=jack_exp,jack_int,jack_identifier
syn match jack_operator      '/'    skipwhite nextgroup=jack_exp,jack_int,jack_identifier
syn match jack_operator      '&'    skipwhite nextgroup=jack_exp,jack_int,jack_identifier
syn match jack_operator      '|'    skipwhite nextgroup=jack_exp,jack_int,jack_identifier
syn match jack_operator      '\~'   skipwhite nextgroup=jack_exp,jack_int,jack_identifier
syn match jack_operator      '<'    skipwhite nextgroup=jack_exp,jack_int,jack_identifier
syn match jack_operator      '>'    skipwhite nextgroup=jack_exp,jack_int,jack_identifier

"Regions
syn region jack_block               start=/{/   end=/}/                 fold transparent contained keepend
syn region jack_exp                 start=/(/   end=/)/                 keepend contains=jack_exp,jack_string,jack_int,jack_reserved_bool,jack_reserved_null,jack_reserved_reference,jack_list_sep,jack_identifier
syn region jack_index               start=/\[/  end=/\]/                keepend contains=expresion,jack_int_pos,jack_int_neg,jack_identifier
syn region jack_string              start=/"/   end=/"/     skip=+//+   contained

"Comments
syn keyword jack_comment_todo       TODO FIXME XXX NOTE         contained
syn match   jack_comment_line       '\/\/.*$'                   contains=jack_comment_todo,@spell
syn region  jack_comment_multiline  start='\/\*' end='\*\/'     contains=jack_comment_todo,@spell
syn region  jack_comment_api        start='\/\*\*' end='\*\/'   contains=jack_comment_todo,@spell

"------------
"Highlighting
hi link jack_reserved_class         Structure
hi link jack_reserved_define        Function
hi link jack_reserved_primitive     Type
hi link jack_type                   Type
hi link jack_reserved_declare       StorageClass
hi link jack_reserved_conditional   Conditional
hi link jack_reserved_do            Keyword
hi link jack_reserved_let           Keyword
hi link jack_reserved_repeat        Repeat
hi link jack_reserved_label         Label
hi link jack_reserved_bool          Boolean
hi link jack_reserved_null          Constant
hi link jack_reserved_reference     Identifier
hi link jack_identifier             Identifier
hi link jack_function               Identifier
hi link jack_function_def           Function
hi link jack_int                    Number
hi link jack_string                 String
hi link jack_list_sep               Delimiter
hi link jack_line_term              Delimiter
hi link jack_assign_comp            Operator
hi link jack_member                 Operator
hi link jack_operator               Operator
hi link jack_comment_line           Comment
hi link jack_comment_multiline      Comment
hi link jack_comment_api            Comment
hi link jack_comment_todo           Todo
