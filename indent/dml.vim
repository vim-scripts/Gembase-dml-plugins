" Vim indent file
" Language:	    Gembase dml file
" Maintainer:       Frank Sun <frank.sun.319@gmail.com>
" Latest Revision:  2008-07-17
" Version: 2.7

if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal shiftwidth=4
setlocal smarttab
setlocal expandtab
setlocal indentexpr=GetDmlIndent()
setlocal indentkeys-=0{,0},:,0#
setlocal indentkeys+==~ELSE,=~ELSE_IF,=~CASE,=~END_FORM,=~END_BLOCK,=~END_CASE,=~END_IF,=~END_WHILE

if exists("*GetDmlIndent")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

let s:slip = 8

function <SID>:IsNonNull(lnum)
    return getline(a:lnum) =~ '^\s*\%(!\|$\)' ? 0 : 1
endfunction

function <SID>:PrevNonNull(lnum)
    if a:lnum == 1
        return <SID>:IsNonNull(a:lnum) == 0 ? 0 : 1
    else
        for lnum in range(a:lnum,1,-1)
            if <SID>:IsNonNull(lnum) == 0
                continue
            else
                return lnum
            endif
        endfor
        return 0
    endif
endfunction

function <SID>:BlockBeginning(lnum)
    let pnum = a:lnum
    let lnum = <SID>:PrevNonNull(pnum - 1)
    while 1
        if lnum == 0
            " 0 means current is empty or a comment and on the top of the file
            return <SID>:IsNonNull(pnum) == 1 ? pnum : 0
        endif
        let lnum = <SID>:PrevNonNull(pnum - 1)
        if getline(lnum) =~ '&\s*$'
            let pnum = lnum
        else
            return pnum
        endif
    endwhile
endfunction

function <SID>:LastBlockBeginning(lnum)
    let lnum = <SID>:BlockBeginning(a:lnum)
    if lnum != 0
        let lnum = <SID>:PrevNonNull(lnum - 1)
        if lnum != 0
            return <SID>:BlockBeginning(lnum)
        endif
    endif
    " 0 means current line is not in any block, or this is the first block
    return 0
endfunction

function <SID>:LastBlockEnding(lnum)
    let lnum = <SID>:BlockBeginning(a:lnum)
    if lnum != 0
        let lnum = <SID>:PrevNonNull(lnum - 1)
        if lnum != 0 && <SID>:BlockBeginning(lnum) != 0
            return lnum
        endif
    endif
    return 0
endfunction

function <SID>:FindLastCharacter(lnum)
    let line = getline(a:lnum)
    for position in range(len(line)-1,0,-1)
        if line[position] !~ '\s'
            return [a:lnum,position+1]
        endif
    endfor
    return 0
endfunction

"Notice: the first line must contains character '('
function <SID>:MatchParenPos(start,end)
    " locate character '('
    let line = getline(a:start)
    let length = len(line)
    let counter = 0
    for head in range(length)
        if line[head] == '('
            let head += 1
            let counter = 1
            break
        endif
    endfor

    " Continuously locate character ')' in the first line
    for tail in range(head + 1,length)
        let character = line[tail - 1]
        if character == '('
            let counter += 1
        elseif character == ')'
            let counter -= 1
        endif
        if counter == 0
            return [a:start,tail]
        endif
    endfor
    " locate character ')' in continuous lines if it doesn't exist in the first line
    if a:start < a:end
        for lnum in range(a:start + 1,a:end)
            if <SID>:IsNonNull(lnum) == 1
                let line = getline(lnum)
                for tail in range(len(line))
                    let character = line[tail]
                    if character == '('
                        let counter += 1
                    elseif character == ')'
                        let counter -= 1
                    endif
                    if counter == 0
                        return [lnum,tail + 1]
                    endif
                endfor
            endif
        endfor
    endif
    return 0
endfunction

function GetDmlIndent()
    let cbnum = <SID>:BlockBeginning(v:lnum)
    if cbnum == 0 
        return 0
    endif

    let lbnum = <SID>:LastBlockBeginning(v:lnum)
    let line = getline(<SID>:PrevNonNull(v:lnum - 1))

    " judge current line's indent according to above lines
    if line !~ '&\s*$'
        let ind = indent(lbnum)
        let line = getline(lbnum)
        if line =~? '^\s*\<\%(FORM\|MENU_FORM\|PROCEDURE_FORM\|QUERY_FORM\|REPORT_FORM\|TABLE_FORM\)\>'
            \ || line =~? '^\s*\<\%(BEGIN_BLOCK\|BEGIN_CASE\|ELSE\|CASE\)\>'
            let ind = ind + &sw
        endif
        if line =~? '^\s*\<\%(IF\|WHILE\|ELSE_IF\)\>\s*('
            let lenum = <SID>:LastBlockEnding(v:lnum)
            let matchpos = <SID>:MatchParenPos(lbnum,lenum)
            let lastpos = <SID>:FindLastCharacter(lenum)
            if matchpos == lastpos
                let ind = ind + &sw
            endif
        endif
    else
        let ind = indent(cbnum)
        let ind = ind + s:slip
    endif

    " indent current line accompany to inputed keywords
    if getline(v:lnum) =~? '^\s*\<\%(END_FORM\|END_BLOCK\|END_CASE\|END_IF\|END_WHILE\|ELSE\|CASE\|ELSE_IF\)\>'
        let ind = ind - &sw
    endif

    return ind
endfunction

if has("gui_running")
    nmenu Gembase.Auto-Indent gg=G
endif

let &cpo = s:cpo_save
unlet s:cpo_save
" Vim indent file
