" Vim filetype plugin
" Language:	Gembase dml file
" Maintainer:	Frank Sun <frank.sun.319@gmail.com>
" Last Change:	2008-07-20
" Version: 0.3

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

let cpo_save = &cpo
set cpo-=C

let b:undo_ftplugin = "setl fo< com< commentstring< | unlet! b:match_ignorecase b:match_words"

" Set 'formatoptions' to insert the comment leader when hitting <CR> or using "o".
setlocal fo-=tc fo+=roql

" Set 'comments' to format dashed lists in comments
setlocal com=:!

" Comments start with a exclamatory mark
setlocal commentstring=!%s

" Move around blocks
noremap <silent><buffer> [[ m':call search('^\c\s*\<BEGIN_BLOCK\>',"bW")<CR>
noremap <silent><buffer> ]] m':call search('^\c\s*\<BEGIN_BLOCK\>',"W")<CR>
noremap <silent><buffer> [] m':call search('^\c\s*\<END_BLOCK\>',"bW")<CR>
noremap <silent><buffer> ][ m':call search('^\c\s*\<END_BLOCK\>',"W")<CR>

" Move around comments
noremap <silent><buffer> ]! :call search('^\(\s*!.*\n\)\@<!\(\s*!\)',"W")<CR>
noremap <silent><buffer> [! :call search('\%(^\s*!.*\n\)\%(^\s*!\)\@!',"bW")<CR>

" Let the matchit plugin know what items can be matched.
if exists("loaded_matchit")
  let b:match_ignorecase = 1
  let b:match_words =
        \ '\<begin_block\>:\<end_block\>,' .
        \ '\<if\>:\<else_if\>:\<else\>:\<end_if\>,' .
        \ '\<while\>:\<end_while\>,' .
        \ '\<begin_case\>:\<case\>:\<end_case\>,' .
        \ '(:)'
endif

nmenu Gembase.Block.Next\ BEGIN  ]]
nmenu Gembase.Block.Next\ END []
nmenu Gembase.Block.Prev\ BEGIN [[
nmenu Gembase.Block.Prev\ END []
nmenu Gembase.Comment.Next\ comment ]!
nmenu Gembase.Comment.Prev\ comment [!
nmenu Gembase.Matchit\ Jump %

let &cpo = cpo_save
