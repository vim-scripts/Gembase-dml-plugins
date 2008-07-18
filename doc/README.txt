                              GEMBASE DML PLUGINS

AUTHOR: Frank Sun <frank.sun.319@gmail.com>
VERSION: 0.9.02
DATE: 2007-07-17
VIM ENVIRONMENT: version 7

DESCRIPTION

This package includes two scripts, one provides syntax highlight for dml file, and the other provides auto-indentation function. I plan to write a ftplugin script to provide intelligent completion function in the near future.

1. Syntax highlight

Highlighted language-elements listed as below:

          a) preprocessing statement;
          b) comment;
          c) six kinds of forms and its end_form keyword;
          d) six kinds of blocks and its end_block keyword;
          e) structure such as if, while and case statement, and highlighted their adjacent parenthesis;
          f) operator, constant and quote;
          g) system variable and user-defined variable;
          h) all qualifiers of form and block;
          i) a few metadata keywords.

2. Auto-indentation

In the insert mode, it will auto-indent form, block, structures and continuous lines marked with character “&”. In the normal mode, you can use it to check codes validity (hit keys: "gg=G"). Some mismatched keywords and abuse of character "&" were found in dml files when I run it.

By default, shiftwidth equals to 4 spaces (If you need a tab with 8 spaces, try to hit "ctrl + v + tab“), value of syntactic indent equals to shiftwidth, and continue line marked with character "&" indents 8 spaces (you can configure it by changing the variable "s:slip" in indent script).

3. TODO

          a) add more metadata keyword to syntax plugin;
          b) when handling an ending statement, check its mate to decide whether indent;
          c) ftplugin script.

INSTALL DETAILS

1. For Unix:

          put the filetype script into directory $HOME/.vim/
          put the syntax script into directory $HOME/.vim/syntax/
          put the indent script into directory $HOME/.vim/indent/

2. For Windows:

          put the filetype script into directory $VIM\vimfiles\
          put the syntax script into directory $VIM\vimfiles\syntax\
          put the indent script into directory $VIM\vimfiles\indent\
