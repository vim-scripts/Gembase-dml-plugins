                              GEMBASE DML PLUGINS

AUTHOR: Frank Sun <frank.sun.319@gmail.com>
VERSION: 1.03
DATE: 2008-08-29
VIM ENVIRONMENT: version 7

DESCRIPTION
===========

This package includes three scripts, a syntax script, an auto-indentation file and a ftplugin, which mainly provides omni-completion, suited declaration auto-completion and some accessorial functionalities.

1. Syntax highlight
-------------------

Highlighted language-elements listed as below:

    (1) preprocessing statement;
    (2) comment;
    (3) six kinds of forms and its end_form keyword;
    (4) six kinds of blocks and its end_block keyword;
    (5) structure such as if, while and case statement, and highlighted their adjacent parenthesis;
    (6) operator, constant and quote;
    (7) system variable and user-defined variable;
    (8) all qualifiers of form and block;
    (9) most of metadata keywords.

2. Auto-indentation
-------------------

In the insert mode, it will auto-indent form, block, structures and continuous lines marked with character ¡°&¡±. In the normal mode, you can use it to check codes validity (hit keys: "gg=G"). Some mismatched keywords and abuse of character "&" were found in dml files when I run it.

By default, shiftwidth equals to 4 spaces (If you need a tab with 8 spaces, try to hit "ctrl + v + tab¡°), value of syntactic indent equals to shiftwidth, and continue line marked with character "&" indents 8 spaces (you can configure it by changing the variable "s:slip" in indent script). 

3. ftplugin
-----------

This script provides several useful functionalities, the most useful two are:

     (1) in the insert mode, it provide both omni-completion and known-word-completion functionality by a function "SuperCleverTab()". It is very convenient, when you hit key "Tab", vim will pop a balloon to lists all candidate keywords, use "CTRL + N" or "CTRL + P" to move focus, use "CTRL + Y" to pick up a candidate and "CTRL + E" to return original status. If you want to print a "Tab", just try "CTRL + V + Tab". You can also manually remap the hot-key, besides, an menu item also provides to execute it.
     (2) in the insert mode, it will auto-complete suited declaration keywords after its beginning was inputed, for instance, if you input string "BEGIN_BLOCK?", NOTICE: the keyword must be followed by a question mark "?", then hit a space, system will auto-complete "END_BLOCK";

Others are some accessorial enhancements:

     (3) set comments to format dashed line with leader character "!" when hitting <CR> or using "o";
     (4) set hot-keys to support fast jumping among blocks by using "]]" (next "BEGIN_BLOCK"), "[[" (previous "BEGIN_BLOCK"), "][" (next "END_BLOCK"), "[]" (previous "END_BLOCK"), and among comments by using "]!" (next comment) and "[!" (previous comment);
     (5) support "matchit" plugin to jump between keywords within a structure by hitting key "%" in normal mode. Such as "IF" -> "ELSE_IF" -> "ELSE" -> "END_IF", etc.
     (6) also provides parenthesis auto-completion;
     (7) if you runs in GUI, it provides a menu column, which lists some functional item;
     (8) if you runs in GUI and made a folder, when cursor hangs over it, then system will display a help tip to show the less than 30 lines within folder.

4. Upgrade
----------

By default, GetLatestVimScripts plugin is included in Vim installation package, whose version is higher than v7. So you can use it to auto-download the newest package. Add below line into file "GetLatestVimScripts.dat":

                           2301 1 gembase-plugins

and use this command ":GetLatestVimScripts" to upgrade it.

5. TODO
-------

     (1) when handling an ending statement, check its mate to decide whether indent;
     (2) support fast jumping and matchit switching between six kinds of forms

6. Acknowledgments
------------------

I would like to thank Kim Schulz, without his excellent book "Hacking Vim", I can't complete ftplugin script in a few days.

INSTALL DETAILS
===============

1. For Unix:
------------

          run script "gembase-unix" to install or uninstall:
                ./gembase-unix -i
                ./gembase-unix -u

2. For Windows:
---------------

          put the filetype script into directory $VIM\vimfiles\
          put the syntax script into directory $VIM\vimfiles\syntax\
          put the indent script into directory $VIM\vimfiles\indent\
          put the ftplugin script (dml-windows.vim) into directory $VIM\vimfiles\ftplugin\, and rename it as "dml.vim" 
          put the file ".\ftplugin\gembase\dict" into directory $VIM\.vim\ftplugin\gembase\
