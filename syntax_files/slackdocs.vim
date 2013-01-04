" Vim syntax file
" Language:     slackdocs
" Maintainer:   Matthew Fillpot <mfilpot at gmail dot com>
" Last Change:  2012-12-24
" Version:      0.0.1
" URL:          https://github.com/mfillpot/slackdoc_templates
" License:      BSD
" Reference:    http://www.dokuwiki.org/syntax
" Credits:
"   Bill Powell <bill@billpowellisalive.com> -- original dokuwiki syntax file
"   Floriam Preinstorfer <nblock@archlinux.org> -- dokuwiki vim file
" Notes:
"   This file was derived from the dokuwiki vim file created by Florian
"   Preinstorfer (https://github.com/nblock/vim-dokuwiki) and modified 
"   to include highlighting for the modules used by docs.slackware.com

" For version 5.x: Clear all syntax items
" " For version 6.x: Quit when a syntax file was already loaded
if version < 600
 syntax clear
elseif exists("b:current_syntax")
 finish
endif

"Settings
" Set shift width for indent
setlocal shiftwidth=2
" Set the maximum line width
setlocal tw=77
" Set the tab key size to two spaces
setlocal softtabstop=2
" Let tab keys always be expanded to spaces
setlocal expandtab

" All syntax is case insensative
syntax case ignore

"syntax case /\8\8/ /\*\*/
"syntax keyword int type
"syntax keyword if then else fi

""" Patterns
" Keywords
syn match slackdocsLinebreak /\(\\\\$\|\\\\ \)/

syn match slackdocsTrailingSpace /\s\+$/

" No wiki regions
syn region slackdocsNowiki start=+%%+ end=+%%+
syn region slackdocsNowiki start=+<nowiki>+ end=+</nowiki>+

" Heading
syn match slackdocsHeading1 /^\s*=\{6}[^=]\+.*[^=]\+=\{6}\s*$/
"syn region slackdocsHeading1 start="/^\s*=\{6}[^=]\+." end="[^=]\+={6}\s*$/"re=e contains=slackdocsHeading1Content keepend extend 
"syn region slackdocsNoteBlock start="<note\(\s[^>]\+\)\?>"rs=s end="</note>"re=e contains=slackdocsNoteBlockContent keepend extend
"syn region slackdocsHeading1Content start="= "ms=e+1 end=" ="me=s-1 contained

syn match slackdocsHeading2 /^\s*=\{5}[^=]\+.*[^=]\+=\{5}\s*$/
syn match slackdocsHeading3 /^\s*=\{4}[^=]\+.*[^=]\+=\{4}\s*$/
syn match slackdocsHeading4 /^\s*=\{3}[^=]\+.*[^=]\+=\{3}\s*$/
syn match slackdocsHeading5 /^\s*=\{2}[^=]\+.*[^=]\+=\{2}\s*$/

" Highlight
syn region slackdocsBold start="\*\*" end="\*\*" contains=ALLBUT,slackdocsBold,@slackdocsNoneTextItem extend
syn region slackdocsItalic start="\/\/" end="\/\/" contains=ALLBUT,slackdocsItalic,@slackdocsNoneTextItem extend
syn region slackdocsUnderlined start="__" end="__" contains=ALLBUT,slackdocsUnderlined,@slackdocsNoneTextItem extend
syn region slackdocsMonospaced start="''" end="''" contains=ALLBUT,slackdocsMonospaced,@slackdocsNoneTextItem extend

syn region slackdocsStrikethrough start="<del>" end="</del>" contains=ALLBUT,@slackdocsNoneTextItem,slackdocsStrikethrough extend
syn region slackdocsSubscript start="<sub>" end="</sub>" contains=ALLBUT,@slackdocsNoneTextItem,slackdocsStrikethrough extend
syn region slackdocsSuperscript start="<sup>" end="</sup>" contains=ALLBUT,@slackdocsNoneTextItem,slackdocsStrikethrough extend

" Smileys: http://github.com/splitbrain/slackdocs/blob/master/conf/smileys.conf
syn match slackdocsSmiley "\(8-)\|8-O\|8-o\|:-(\|:-)\|=)\|:-\/\|:-\\\)" contains=@NoSpell
syn match slackdocsSmiley "\(:-\\\|:-?\|:-D\|:-P\|:-o\|:-O\|:-x\)" contains=@NoSpell
syn match slackdocsSmiley "\(:-X\|:-|\|;-)\|m(\|\^_\^\|:?:\|:!:\)\|LOL\|FIXME\|DELETEME" contains=@NoSpell

" Entities: http://github.com/splitbrain/slackdocs/blob/master/conf/entities.conf
syn match slackdocsEntities "\(<->\|->\|<-\|<=>\|640x480\)" contains=@NoSpell
syn match slackdocsEntities "\(=>\|<=[^>]\|>>\|<<\|---\|--\)" contains=@NoSpell
syn match slackdocsEntities "\((c)\|(tm)\|(r)\|\.\.\.\)" contains=@NoSpell

"Cluster most common items
syn cluster slackdocsTextItems contains=slackdocsBold,slackdocsItalic,slackdocsUnderlined,slackdocsMonospaced,slackdocsStrikethrough
syn cluster slackdocsTextItems add=slackdocsSubscript,slackdocsSuperscript,slackdocsSmiley,slackdocsEntities
syn cluster slackdocsTextItems add=slackdocsExternalLink,slackdocsInternalLink,slackdocsMediaLink
syn cluster slackdocsTextItems add=slackdocsFootnotes,slackdocsLinebreak,slackdocsNowiki,slackdocsCodeBlock,slackdocsFileBlock
syn cluster slackdocsNoneTextItem contains=ALLBUT,@slackdocsTextItems

" Links: http://github.com/splitbrain/slackdocs/blob/master/conf/scheme.conf
syn region slackdocsExternalLink start=+\(http\|https\|telnet\|gopher\|wais\|ftp\|ed2k\|irc\|ldap\):\/\/\|www\.+ end=+\(\ze[.,?:;-]*\_[^a-zA-Z0-9~!@#%&_+=/.,?:;-]\)+ contains=@NoSpell
syn region slackdocsInternalLink matchgroup=slackdocsLink start="\[\[" end="\]\]" contains=@NoSpell,slackdocsLinkMedia,slackdocsLinkNoMedia keepend extend
syn region slackdocsLinkMedia matchgroup=slackdocsLink start="|{{"ms=s-1,rs=s+1 end="}}\]\]"me=e-2,re=e-2 contained contains=slackdocsInternalMediaLink,slackdocsLinkCaption keepend
syn region slackdocsLinkNoMedia matchgroup=slackdocsLink start="|\({{\)\@!"ms=s-1,rs=s+1 end="\]\]" contained contains=slackdocsLinkCaption keepend
syn region slackdocsLinkCaption start="." end="\]\]"me=e-2 contained

" Images and other files
syn match slackdocsMediaSeparator "|" contained nextgroup=slackdocsMediaCaption
syn region slackdocsMediaCaption start="." end="}}"me=e-2 contained
syn region slackdocsMediaLink matchgroup=slackdocsLink start="{{" end="}}" contains=@NoSpell,slackdocsMediaSeparator extend
syn match slackdocsInternalMediaLink "{{\(\(}\|]]\)\@!\_.\)*}}\(]]\)\@=" contained contains=@NoSpell,slackdocsMediaLink

"Control Macros
syn region slackdocsControlMacros start="\~\~" end="\~\~" contains=@NoSpell

"Code Blocks
syn region slackdocsCodeBlockPlain start="^\(  \|\t\)\s*[^*-]" end="$"
syn region slackdocsCodeBlock start="<code\(\s[^>]\+\)\?>"rs=s end="</code>"re=e contains=slackdocsCodeBlockContent,slackdocsCodeLang keepend extend
syn region slackdocsFileBlock start="<file\(\s[^>]\+\)\?>"rs=s end="</file>"re=e contains=slackdocsFileBlockContent,slackdocsCodeLang keepend extend
syn region slackdocsCodeBlockContent start=">"ms=e+1 end="</code>"me=s-1 contained
syn region slackdocsFileBlockContent start=">"ms=e+1 end="</file>"me=s-1 contained
syn region slackdocsCodeLang start="\s\+\zs" end=">"me=e-1 contained contains=slackdocsCodeFileName,@NoSpell
syn region slackdocsCodeFileName start="\zs\s\+" end=">"me=e-1 contained contains=@NoSpell

" Lists
syn match slackdocsList "^\(  \|\t\)\s*[*-]" contains=@slackdocsTextItems

"Quotes
syn match slackdocsQuotes /^>\+ /

"Footnotes
syn region slackdocsFootnotes start=/((/ end=/))/ contains=ALLBUT,slackdocsFootnotes,@slackdocsNoneTextItem extend

"Tables
syn region slackdocsTable start="^[|\^]" end="$" contains=slackdocsTableRow transparent keepend
syn region slackdocsTableRow start="[|\^]" end="\ze[|\^]" transparent contained contains=slackdocsTableSeparator,slackdocsTableRowspan,@slackdocsTextItems keepend
syn match slackdocsTableSeparator "[|\^]" contained
syn match slackdocsTableRowspan "[|\^]\s*:::\ze\s*[|\^]" contained transparent contains=slackdocsRowspan,slackdocsTableSeparator
syn match slackdocsRowspan ":::" contained

" Embedded html/php
syn region slackdocsEmbedded start="<html>" end="</html>"
syn region slackdocsEmbedded start="<HTML>" end="</HTML>"
syn region slackdocsEmbedded start="<php>" end="</php>"
syn region slackdocsEmbedded start="<PHP>" end="</PHP>"

" Keycode Entries
"syn region slackdocsKeycode start="<keycode>" end="</keycode>"
"syn region slackdocsCodeBlockPlain start="^\(  \|\t\)\s*[^*-]" end="$"
syn region slackdocsKeycodeBlock start="<keycode>"rs=s end="</keycode>"re=e contains=slackdocsKeycodeBlockContent keepend extend
syn region slackdocsKeycodeBlockContent start=">"ms=e+1 end="</keycode>"me=s-1 contained

" Note Entries
syn region slackdocsNoteBlock start="<note\(\s[^>]\+\)\?>"rs=s end="</note>"re=e contains=@slackdocsTextItems keepend 
"extend
"syn region slackdocsNoteBlockContent start=">"ms=e+1 end="</note>"me=s-1 contained

"Comment: requires http://www.slackdocs.org/plugin:comment
if exists("slackdocs_comment")
  syn region slackdocsComment start="/\*" end="\*/"
endif

"Set keywords to highlight in comments
syn keyword xTodo TODO contained
"Set comment type and keywords to ignore
syn region slackdocsComment1 start="<!--*" end="-->" contains=xToDo


"Horizontal line
syn match slackdocsHorizontalLine "^\s\?----\+\s*$"

"Keyword 
"Exception 
"Title
"Underline 
"Type
"DiffDelete
"Special
"Label
"Comment - Blue
"Include
"Todo - Highlight Orange
"Constant - Red
"Tag - Purple, Special use can quick navigate
"Visual - Unknown
"NonText - Purple
"String

"term, cterm, gui
"bold, underline, reverse, italic, none

"ctermgf, cterbg
"red, yellow, green, blue, magenta, cyan, white, black, gray

"guifg, guibg
"All of the above colors, plus many more; you may also use the #rrggbb format

" Choose Colors
hi Comment ctermfg=red guifg=red
"Constant  
"Identifier  
"Statement 
"PreProc 
"Type  
"Special 
"Underlined  
"Error 

""" Highlighting
hi link slackdocsLinebreak Keyword
hi link slackdocsTrailingSpace Todo

hi link slackdocsNowiki Exception

hi link slackdocsHeading1 Title
"hi def slackdocsHeading1Content term=bold cterm=bold gui=bold
hi link slackdocsHeading2 Title
hi link slackdocsHeading3 Title
hi link slackdocsHeading4 Title
hi link slackdocsHeading5 Title

hi def slackdocsBold term=bold cterm=bold gui=bold
hi def slackdocsItalic term=italic cterm=italic gui=italic
hi link slackdocsUnderlined Underlined
"hi link slackdocsUnderlined term=underline cterm=underline gui=underline
hi link slackdocsMonospaced Type
hi link slackdocsStrikethrough DiffDelete
hi link slackdocsSubscript Special
hi link slackdocsSuperscript Special

"hi link slackdocsKeycode Identifier

hi link slackdocsExternalLink Underlined
hi link slackdocsInternalLink Underlined
hi link slackdocsLinkCaption Label
hi link slackdocsLink Comment
hi link slackdocsMediaSeparator Comment
hi link slackdocsMediaCaption Label
hi link slackdocsMediaLink Include

hi link slackdocsSmiley Todo
hi link slackdocsEntities Keyword

hi link slackdocsList Identifier

hi link slackdocsControlMacros Constant

hi link slackdocsCodeBlockPlain String
hi link slackdocsCodeBlockContent String
hi link slackdocsFileBlockContent String
hi link slackdocsCodeBlock Comment
hi link slackdocsFileBlock Comment
hi link slackdocsCodeLang Tag
hi link slackdocsCodeFileName Include

hi link slackdocsKeycodeBlock Identifier
hi def slackdocsKeycodeBlockContent term=bold cterm=bold gui=bold

hi link slackdocsNoteBlock Keyword
"hi link slackdocsNoteBlockContent Keyword

hi link slackdocsComment1 Comment

hi link slackdocsQuotes Visual

hi link slackdocsFootnotes Comment

hi link slackdocsTableSeparator Label
hi link slackdocsRowspan NonText

hi link slackdocsEmbedded String

hi link slackdocsComment Comment

hi link slackdocsHorizontalLine NonText

"set name
let b:current_syntax = "slackdocs"
