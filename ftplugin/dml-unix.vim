" Vim filetype plugin
" Language:	Gembase dml file
" Maintainer:	Frank Sun <frank.sun.319@gmail.com>
" Last Change:	2008-07-20
" Version: 0.3

" Check vim version
if version < 700
    echo "Vim version must higher than 7.0"
    finish
endif

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
    finish
endif

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

" Hit keywords and a question mark "?" then trigger abbreviation completion
" Reason to do so is to avoid conflicting with comment
iabbrev <buffer> FORM? FORM<CR>END_FORM<UP><END>
iabbrev <buffer> MENU_FORM? MENU_FORM<CR>END_FORM<UP><END>
iabbrev <buffer> PROCEDURE_FORM? PROCEDURE_FORM<CR>END_FORM<UP><END>
iabbrev <buffer> QUERY_FORM QUERY?_FORM<CR>END_FORM<UP><END>
iabbrev <buffer> REPORT_FORM? REPORT_FORM<CR>END_FORM<UP><END>
iabbrev <buffer> TABLE_FORM? TABLE_FORM<CR>END_FORM<UP><END>
iabbrev <buffer> form? form<CR>end_form<UP><END>
iabbrev <buffer> menu_form? menu_form<CR>end_form<UP><END>
iabbrev <buffer> procedure_form? procedure_form<CR>end_form<UP><END>
iabbrev <buffer> query_form? query_form<CR>end_form<UP><END>
iabbrev <buffer> report_form? report_form<CR>end_form<UP><END>
iabbrev <buffer> table_form? table_form<CR>end_form<UP><END>

iabbrev <buffer> BEGIN_BLOCK? BEGIN_BLOCK<CR>END_BLOCK<UP><END>
iabbrev <buffer> begin_block? begin_block<CR>end_block<UP><END>

iabbrev <buffer> IF? IF ( )<CR>END_IF<UP><END><LEFT><LEFT>
iabbrev <buffer> if? if ( )<CR>end_if<UP><END><LEFT><LEFT>
iabbrev <buffer> WHILE? WHILE ( )<CR>END_WHILE<UP><END><LEFT><LEFT>
iabbrev <buffer> ELSE_IF? ELSE_IF ( )<LEFT><LEFT>
iabbrev <buffer> else_if? else_if ( )<LEFT><LEFT>
iabbrev <buffer> while? while ( )<CR>end_while<UP><END><LEFT><LEFT>
iabbrev <buffer> BEGIN_CASE? BEGIN_CASE ( )<CR>END_CASE<UP><END><LEFT><LEFT>
iabbrev <buffer> begin_case? begin_case ( )<CR>end_case<UP><END><LEFT><LEFT>
iabbrev <buffer> CASE? CASE ( )<LEFT><LEFT>
iabbrev <buffer> case? case ( )<LEFT><LEFT>

" Auto-complete parenthesis
inoremap ( ()<ESC>i
inoremap <silent>) <c-r>=<SID>:ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap <silent>} <c-r>=<SID>:ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap <silent>] <c-r>=<SID>:ClosePair(']')<CR>
inoremap < <><ESC>i
inoremap <silent>> <c-r>=<SID>:ClosePair('>')<CR>

function! <SID>:ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

" wether a character is lower or upper
function! CharCase(char)
    let char = char2nr(a:char)
    " upper case
    if char >= 65 && char <= 90
        return "upper"
    " lower case
    elseif char >= 97 && char <= 122
        return "lower"
    endif
endfunction

function! CompleteKeywords(findstart, base)
    if a:findstart
        " locate the start of the word
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && line[start - 1] != '[A-Za-z0-9%]'
            let start -= 1
        endwhile
        return start
    else
        let res = []
        " read the dict
        " For Unix
        for keyword in readfile($HOME . '/.vim/ftplugin/gembase/dict')
        " For Windows
        "for keyword in readfile($VIM . '\vimfiles\ftplugin\gembase\dict')
            if keyword =~ '^' . a:base
                if a:abse != '%' && CharCase(a:base[0]) == "lower"
                    let keyword = tolower(keyword)
                endif
                call add(res,keyword)
            endif
        endfor
        return res
    endif
endfunction

set omnifunc=CompleteKeywords

function! SuperCleverTab()
    " check if at beginning of line or after a space
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        " do we have omni completion available
        if &omnifunc != ''
            " use omni-completion 1. priority
            return "\<C-X>\<C-O>"
        else
            " use known-word completion
            return "\<C-N>"
        endif
    endif
endfunction

inoremap <silent><buffer><TAB> <C-R>=SuperCleverTab()<CR>

" Some functionalities running only in gui
if has("gui_running")

    " display a help tip when cursor over a folder
    setlocal ballooneval
    setlocal balloonexpr=FoldSpellBalloon()

    function! FoldSpellBalloon()
        let foldStart = foldclosed(v:beval_lnum )
        let foldEnd = foldclosedend(v:beval_lnum)
        let lines = []
        if foldStart >= 0
            " we are in a fold
            let numLines = foldEnd - foldStart + 1
            " if we have too many lines in fold, show only the first 14 and the last 14 lines
            if ( numLines > 31 )
                let lines = getline( foldStart, foldStart + 14 )
                let lines += [ '-- Snipped ' . ( numLines - 30 ) . ' lines --' ]
                let lines += getline( foldEnd - 14, foldEnd )
            else
                "less than 30 lines, lets show all of them
                let lines = getline( foldStart, foldEnd )
            endif
        endif
        " return result
        return join( lines, has( "balloon_multiline" ) ? "\n" : " " )
    endfunction

    " Add menu items
    imenu Gembase.Auto-Completion <F6>
    nmenu Gembase.Jump.Block.Next\ BEGIN ]]zz
    nmenu Gembase.Jump.Block.Next\ END []zz
    nmenu Gembase.Jump.Block.Prev\ BEGIN [[zz
    nmenu Gembase.Jump.Block.Prev\ END []zz
    nmenu Gembase.Jump.Comment.Next\ comment ]!zz
    nmenu Gembase.Jump.Comment.Prev\ comment [!zz
    nmenu Gembase.Matchit\ Jump %
    amenu <silent>Gembase.Spell\ check\ toggle <ESC>:call <SID>:SpellCheckToggle()<CR>

    function! <SID>:SpellCheckToggle()
        if &spell 
            let &spell = 0
            echo "Spell check close."
        else
            let &spell = 1
            echo "Spell check open."
        endif
    endfunction

    let b:undo_ftplugin += "balloonexpr< ballooneval<"

endif

let &cpo = cpo_save
