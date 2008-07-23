                              GEMBASE DML PLUGINS

AUTHOR: Frank Sun <frank.sun.319@gmail.com>
VERSION: 1.0
DATE: 2007-07-17
VIM ENVIRONMENT: version 7

DESCRIPTION

This package includes three scripts, a syntax script, an auto-indentation file and a ftplugin, which mainly provides omni-completion, suited declaration auto-completion and some accessorial functionalities.

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

This script provides several useful functionalities, the most useful two are:

        a) in the insert mode, it provides omni-completion of almost all of Gembase language-keywords. If you inputed a prefix, you could hit keys "Ctrl + X + Ctrl + O" to complete its suffix. By default, it is binded to <F6>:
                            inoremap <F6> <C-X><C-O>
you can also manually remap it, besides, an menu item also provides to execute it;
        b) in the insert mode, it will auto-complete suited declaration keywords after its beginning was inputed, for instance, if you input string "BEGIN_BLOCK?", NOTICE: the keyword must be followed by a question mark "?", then hit a space, system will auto-complete "END_BLOCK";

Others are some accessorial enhancements:

        c) set comments to format dashed line with leader character "!" when hitting <CR> or using "o";
        d) set hot-keys to support fast jumping among blocks by using "]]" (next "BEGIN_BLOCK"), "[[" (previous "BEGIN_BLOCK"), "][" (next "END_BLOCK"), "[]" (previous "END_BLOCK"), and among comments by using "]!" (next comment) and "[!" (previous comment);
        e) support "matchit" plugin to jump between keywords within a structure by hitting key "%" in normal mode. Such as "IF" -> "ELSE_IF" -> "ELSE" -> "END_IF", etc.
        f) also provides parenthesis auto-completion;
        g) if you runs in GUI, it provides a menu column, which lists some functional item;
        i) if you runs in GUI and made a folder, when cursor hangs over it, then system will display a help tip to show the less than 30 lines within folder.

4. TODO

          a) when handling an ending statement, check its mate to decide whether indent;
          b) support fast jumping and matchit switching between six kinds of forms

INSTALL DETAILS

1. For Unix:

          put the filetype script into directory $HOME/.vim/
          put the syntax script into directory $HOME/.vim/syntax/
          put the indent script into directory $HOME/.vim/indent/
          put the ftplugin script into directory $HOME/.vim/ftplugin/
          put the file "./ftplugin/gembase/dict" into directory $HOME/.vim/ftplugin/gembase/

2. For Windows:

          put the filetype script into directory $VIM\vimfiles\
          put the syntax script into directory $VIM\vimfiles\syntax\
          put the indent script into directory $VIM\vimfiles\indent\
          put the ftplugin script into directory $VIM\vimfiles\ftplugin\
          put the file ".\ftplugin\gembase\dict" into directory $VIM\.vim\ftplugin\gembase\
