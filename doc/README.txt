                              GEMBASE DML PLUGINS

AUTHOR: Frank Sun <frank.sun.319@gmail.com>
VERSION: 0.9.05
DATE: 2007-07-17
VIM ENVIRONMENT: version 7

DESCRIPTION

This package includes three scripts, a syntax script, an auto-indentation file and a ftplugin, which supports fast jumpping, comment dashed list and matchit with "%". I plan to add omni-completion functionality into ftplugin in the near future.

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
          i) most of metadata keywords.

2. Auto-indentation

In the insert mode, it will auto-indent form, block, structures and continuous lines marked with character ¡°&¡±. In the normal mode, you can use it to check codes validity (hit keys: "gg=G"). Some mismatched keywords and abuse of character "&" were found in dml files when I run it.

By default, shiftwidth equals to 4 spaces (If you need a tab with 8 spaces, try to hit "ctrl + v + tab¡°), value of syntactic indent equals to shiftwidth, and continue line marked with character "&" indents 8 spaces (you can configure it by changing the variable "s:slip" in indent script). 

3. ftplugin

Functionality of this script is simple so far:

        a) set comments to format dashed line with leader character "!" when hitting <CR> or using "o";
        b) set hot-keys to support fast jumpping among blocks by using "]]" (next "BEGIN_BLOCK"), "[[" (previous "BEGIN_BLOCK"), "][" (next "END_BLOCK"), "[]" (previous "END_BLOCK"), and among comments by using "]!" (next comment) and "[!" (previous comment);
        c) support "matchit" plugin to jump betwteen keywords within a structure by hitting key "%" in normal mode. Such as "IF" -> "ELSE_IF" -> "ELSE" -> "END_IF", etc.

4. TODO

          a) when handling an ending statement, check its mate to decide whether indent;
          b) add omni-completion functionality;
          c) support fast jumpping and matchit switching between six kinds of forms

INSTALL DETAILS

1. For Unix:

          put the filetype script into directory $HOME/.vim/
          put the syntax script into directory $HOME/.vim/syntax/
          put the indent script into directory $HOME/.vim/indent/
          put the ftplugin script into directory $HOME/.vim/ftplugin/

2. For Windows:

          put the filetype script into directory $VIM\vimfiles\
          put the syntax script into directory $VIM\vimfiles\syntax\
          put the indent script into directory $VIM\vimfiles\indent\
          put the ftplugin script into directory $VIM\vimfiles\ftplugin\
