" Vim color scheme
"
" Name:       monochrome.vim
" Maintainer: Xavier Noria <fxn@hashref.com>
" License:    MIT

set background=dark

hi clear
if exists('syntax_on')
   syntax reset
endif

let g:colors_name = 'monochrome'

let s:white  = ['#ffffff', 15]
let s:black  = ['#0e1111', 16]
let s:bgray  = ['#121212', 233]
let s:lgray  = ['#eeeeee', 255]
let s:cgray  = ['#737373', 243]
let s:dgray  = ['#a8a8a8', 248]
let s:sblue  = ['#5f87af', 67]
let s:dblue  = ['#003355', 25]
let s:yellow = ['#ffff00', 226]
let s:bred   = ['#ff3636', 196] " bright red
let s:dred   = ['#b72a2a', 160] " dark red
let s:green  = ['#87ffaf', 121]

let s:default_fg = s:lgray
let s:default_bg = s:black

let s:italic    = 'italic'
let s:bold      = 'bold'
let s:inverse   = 'inverse'
let s:underline = 'underline'
let s:none      = 'NONE'

let s:default_lst = []
let s:default_str = ''

if !exists("g:monochrome_italic_comments")
  let g:monochrome_italic_comments = 0
endif
let s:comment_attr = g:monochrome_italic_comments ? s:italic : s:none

function! s:hi(...)
    let group = a:1
    let fg    = get(a:, 2, s:default_fg)
    let bg    = get(a:, 3, s:default_bg)
    let attr  = get(a:, 4, s:default_str)

    let cmd = ['hi', group]

    if fg != s:default_lst
        call add(cmd, 'guifg='.fg[0])
        call add(cmd, 'ctermfg='.fg[1])
    endif

    if bg != s:default_lst && bg != s:default_bg
        call add(cmd, 'guibg='.bg[0])
        call add(cmd, 'ctermbg='.bg[1])
    endif

    if attr != s:default_str
        call add(cmd, 'gui='.attr)
        call add(cmd, 'cterm='.attr)
    endif

    exec join(cmd, ' ')
endfunction


"
" --- Vim interface ------------------------------------------------------------
"

call s:hi('Normal')
call s:hi('Cursor', s:black, s:lgray)
call s:hi('CursorLine', s:default_lst, s:bgray, s:none)
call s:hi('CursorLineNr', s:white, s:default_bg, s:bold)
call s:hi('ColorColumn', s:default_fg, s:bgray)
call s:hi('Search', s:white, s:sblue)
call s:hi('Visual', s:default_lst, s:dblue)
call s:hi('ErrorMsg', s:white, s:dred)
call s:hi('Error', s:white, s:dred)

" Tildes at the bottom of a buffer, etc.
call s:hi('NonText', s:dgray)

" Folding.
call s:hi('FoldColumn', s:dgray)
call s:hi('Folded')

" Line numbers gutter.
call s:hi('LineNr', s:dgray)

" Small arrow used for tabs.
call s:hi('SpecialKey', s:sblue, s:default_bg, s:bold)

" File browsers.
call s:hi('Directory', s:white, s:default_bg, s:bold)

" Help.
call s:hi('helpSpecial')
call s:hi('helpHyperTextJump', s:sblue, s:default_bg, s:underline)
call s:hi('helpNote')

" Popup menu.
call s:hi('Pmenu', s:white, s:sblue)
call s:hi('PmenuSel', s:sblue, s:white)

" Notes.
call s:hi('Todo', s:black, s:yellow, s:bold)

" Signs.
call s:hi('SignColumn')

"
" --- Programming languages ----------------------------------------------------
"

call s:hi('Statement', s:white, s:default_bg, s:bold)
call s:hi('PreProc', s:white, s:default_bg, s:bold)
call s:hi('String', s:sblue)
call s:hi('Comment', s:cgray, s:default_bg, s:comment_attr)
call s:hi('Constant', s:dred)
call s:hi('Type', s:white, s:default_bg, s:bold)
call s:hi('Function')
call s:hi('Identifier')
call s:hi('Special')
call s:hi('MatchParen', s:default_fg, s:dgray)


"
" --- Diffs --------------------------------------------------------------------
"

call s:hi('diffFile', s:cgray)
call s:hi('diffNewFile', s:cgray)
call s:hi('diffIndexLine', s:cgray)
call s:hi('diffLine', s:cgray)
call s:hi('diffSubname', s:cgray)
call s:hi('diffAdded', s:white, s:green)
call s:hi('diffRemoved', s:white, s:dred)


"
" --- Markdown -----------------------------------------------------------------
"

call s:hi('Title', s:white, s:default_bg, s:bold)
call s:hi('markdownHeadingDelimiter', s:white, s:default_bg, s:bold)
call s:hi('markdownHeadingRule', s:white, s:default_bg, s:bold)
call s:hi('markdownLinkText', s:sblue, s:default_bg, s:underline)


"
" --- coc.nvim -----------------------------------------------------------------
"

call s:hi('CocErrorSign', s:bred)
call s:hi('CocErrorFloat', s:dred)
call s:hi('CocHintVirtualText', s:cgray)
