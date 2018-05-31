" Vim color file - dark_eyes
" Generated by http://bytefluent.com/vivify 2012-10-16
" from grb
" Based on
" runtime colors/Default.vim
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let g:colors_name = "dark_eyes"

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
	finish
endif

" functions {{{
" returns an approximate grey index for the given grey level
fun <SID>grey_number(x)
	if &t_Co == 88
		if a:x < 23
			return 0
		elseif a:x < 69
			return 1
		elseif a:x < 103
			return 2
		elseif a:x < 127
			return 3
		elseif a:x < 150
			return 4
		elseif a:x < 173
			return 5
		elseif a:x < 196
			return 6
		elseif a:x < 219
			return 7
		elseif a:x < 243
			return 8
		else
			return 9
		endif
	else
		if a:x < 14
			return 0
		else
			let l:n = (a:x - 8) / 10
			let l:m = (a:x - 8) % 10
			if l:m < 5
				return l:n
			else
				return l:n + 1
			endif
		endif
	endif
endfun

" returns the actual grey level represented by the grey index
fun <SID>grey_level(n)
	if &t_Co == 88
		if a:n == 0
			return 0
		elseif a:n == 1
			return 46
		elseif a:n == 2
			return 92
		elseif a:n == 3
			return 115
		elseif a:n == 4
			return 139
		elseif a:n == 5
			return 162
		elseif a:n == 6
			return 185
		elseif a:n == 7
			return 208
		elseif a:n == 8
			return 231
		else
			return 255
		endif
	else
		if a:n == 0
			return 0
		else
			return 8 + (a:n * 10)
		endif
	endif
endfun

" returns the palette index for the given grey index
fun <SID>grey_color(n)
	if &t_Co == 88
		if a:n == 0
			return 16
		elseif a:n == 9
			return 79
		else
			return 79 + a:n
		endif
	else
		if a:n == 0
			return 16
		elseif a:n == 25
			return 231
		else
			return 231 + a:n
		endif
	endif
endfun

" returns an approximate color index for the given color level
fun <SID>rgb_number(x)
	if &t_Co == 88
		if a:x < 69
			return 0
		elseif a:x < 172
			return 1
		elseif a:x < 230
			return 2
		else
			return 3
		endif
	else
		if a:x < 75
			return 0
		else
			let l:n = (a:x - 55) / 40
			let l:m = (a:x - 55) % 40
			if l:m < 20
				return l:n
			else
				return l:n + 1
			endif
		endif
	endif
endfun

" returns the actual color level for the given color index
fun <SID>rgb_level(n)
	if &t_Co == 88
		if a:n == 0
			return 0
		elseif a:n == 1
			return 139
		elseif a:n == 2
			return 205
		else
			return 255
		endif
	else
		if a:n == 0
			return 0
		else
			return 55 + (a:n * 40)
		endif
	endif
endfun

" returns the palette index for the given R/G/B color indices
fun <SID>rgb_color(x, y, z)
	if &t_Co == 88
		return 16 + (a:x * 16) + (a:y * 4) + a:z
	else
		return 16 + (a:x * 36) + (a:y * 6) + a:z
	endif
endfun

" returns the palette index to approximate the given R/G/B color levels
fun <SID>color(r, g, b)
	" get the closest grey
	let l:gx = <SID>grey_number(a:r)
	let l:gy = <SID>grey_number(a:g)
	let l:gz = <SID>grey_number(a:b)

	" get the closest color
	let l:x = <SID>rgb_number(a:r)
	let l:y = <SID>rgb_number(a:g)
	let l:z = <SID>rgb_number(a:b)

	if l:gx == l:gy && l:gy == l:gz
		" there are two possibilities
		let l:dgr = <SID>grey_level(l:gx) - a:r
		let l:dgg = <SID>grey_level(l:gy) - a:g
		let l:dgb = <SID>grey_level(l:gz) - a:b
		let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
		let l:dr = <SID>rgb_level(l:gx) - a:r
		let l:dg = <SID>rgb_level(l:gy) - a:g
		let l:db = <SID>rgb_level(l:gz) - a:b
		let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
		if l:dgrey < l:drgb
			" use the grey
			return <SID>grey_color(l:gx)
		else
			" use the color
			return <SID>rgb_color(l:x, l:y, l:z)
		endif
	else
		" only one possibility
		return <SID>rgb_color(l:x, l:y, l:z)
	endif
endfun

" returns the palette index to approximate the 'rrggbb' hex string
fun <SID>rgb(rgb)
	let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
	let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
	let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0
	return <SID>color(l:r, l:g, l:b)
endfun

" sets the highlighting for the given group
fun <SID>X(group, fg, bg, attr)
	if a:fg != ""
		exec "hi ".a:group." guifg=#".a:fg." ctermfg=".<SID>rgb(a:fg)
	endif
	if a:bg != ""
		exec "hi ".a:group." guibg=#".a:bg." guisp=#".a:bg." ctermbg=".<SID>rgb(a:bg)
	endif
	if a:attr != ""
		if a:attr == 'italic'
			exec "hi ".a:group." gui=".a:attr." cterm=none"
		else
			exec "hi ".a:group." gui=".a:attr." cterm=".a:attr
		endif
	endif
endfun
" }}}

" ********************************************************************************
" The following are the preferred 16 colors for your terminal
"           Colors      Bright Colors
" Black     #4E4E4E     #7C7C7C
" Red       #FF6C60     #FFB6B0
" Green     #A8FF60     #CEFFAB
" Yellow    #FFFFB6     #FFFFCB
" Blue      #96CBFE     #FFFFCB
" Magenta   #FF73FD     #FF9CFE
" Cyan      #C6C5FE     #DFDFFE
" White     #EEEEEE     #FFFFFF

" ********************************************************************************

" BEGIN
"hi Example         ctermfg=NONE        ctermbg=NONE        cterm=NONE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CurentWindow

hi Normal guifg=#a6a3a3 guibg=NONE guisp=#080404 gui=NONE ctermfg=248 ctermbg=232 cterm=NONE
" call <SID>X("Normal","b4b0b0","080404","none")
hi Cursor guifg=#64de85 guibg=#bdb857 guisp=#bdb857 gui=bold ctermfg=78 ctermbg=143 cterm=bold
" call <SID>X("Cursor","b4b0b0","","none")
" http://vim.wikia.com/wiki/Change_the_gvim_mouse_arrow_cursor
" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
" setting blinking cursor color and character highlight as bold
" http://vimdoc.sourceforge.net/htmldoc/options.html#'guicursor'
" http://vim.wikia.com/wiki/Configuring_the_cursor
if version >= 700 " Vim 7.x specific colors
  call <SID>X("CursorLine","f4f0f0","201c1c","none")
  call <SID>X("CursorColumn","f4f0f0","201c1c","none")
  call <SID>X("MatchParen","ffffff","904030","none")
  call <SID>X("Search","000000","f0f000","italic,underline")
endif

call <SID>X("IncSearch","EEEEEE","FF6C60","none")

call <SID>X("LineNr","848070","181414","none")
" call <SID>X("Visual","e2e4e5","282020","none")
hi Visual gui=NONE guifg=DarkGray guibg=White cterm=NONE ctermfg=DarkGray ctermbg=White

" Invisible Characters
" ------------------
hi NonText guifg=#9e6e6e guibg=#181414 guisp=#181414 gui=NONE ctermfg=95 ctermbg=234 cterm=NONE
" call <SID>X("NonText","b4b0b0","181414","none")
call <SID>X("SpecialKey","b4b0b0","282424","bold")

" Folds
" -----
" line used for closed folds
hi Folded guifg=#484040 guibg=NONE guisp=#080404 gui=italic ctermfg=238 ctermbg=232 cterm=NONE
" call <SID>X("Folded","484040","080404","italic,bold")

call <SID>X("VertSplit","200800","301810","none")
call <SID>X("StatusLine","f8e0d0","301810","bold")
call <SID>X("StatusLineNC","503830","200800","none")

hi Ignore guifg=#79a1b5 guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
" call <SID>X("Ignore","e2e4e5","","none")


" Message displayed in lower left, such as --INSERT--
hi ModeMsg guifg=#a6a3a3 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
" call <SID>X("ModeMsg","b4b0b0","","none")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting of actual code
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call <SID>X("Special","a06050","181414","italic")
call <SID>X("Operator","705850","080404","italic")

" Misc
" ----
" directory names and other special names in listings
call <SID>X("Directory","e2e4e5","","none")

" Popup Menu
" ----------
" normal item in popup
call <SID>X("PMenu","503830","200800","none")
" selected item in popup
call <SID>X("PMenuSel","f8e0d0","301810","none")
" scrollbar in popup
call <SID>X("PMenuSbar","503830","181414","none")
" thumb of the scrollbar in the popup
call <SID>X("PMenuThumb","503830","848070","none")

"rubyComment
hi Comment guifg=#9e856b guibg=NONE guisp=#080404 gui=italic ctermfg=137 ctermbg=232 cterm=NONE
" call <SID>X("Comment","686460","080404","none")
hi Todo guifg=#686460 guibg=NONE guisp=#080404 gui=italic ctermfg=242 ctermbg=232 cterm=NONE
" call <SID>X("Todo","686460","080404","italic,underline")
"rubyPseudoVariable
"nil, self, symbols, etc
call <SID>X("Constant","60d060","080404","none")
"rubyClass, rubyModule, rubyDefine
"def, end, include, etc
call <SID>X("Define","607080","080404","italic")
" same as define
call <SID>X("Macro","a090a0","080404","italic")
"rubyInterpolation
hi Delimiter guifg=#a06050 guibg=#181414 guisp=#181414 gui=italic ctermfg=131 ctermbg=234 cterm=NONE
" call <SID>X("Delimiter","a06050","181414","italic")
"rubyError, rubyInvalidVariable
hi Error guifg=#e2e4e5 guibg=#854d50 guisp=#854d50 gui=NONE ctermfg=254 ctermbg=95 cterm=NONE
" call <SID>X("Error","e2e4e5","","none")
hi ErrorMsg guifg=#a6a3a3 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
" call <SID>X("ErrorMsg","b4b0b0","","none")
call <SID>X("WarningMsg","e2e4e5","","none")
"rubyFunction
call <SID>X("Function","60b050","080404","italic")
"rubyIdentifier
"@var, @@var, $var, etc
call <SID>X("Identifier","c0b060","080404","italic")
"rubyInclude
"include, autoload, extend, load, require
call <SID>X("Include","a090a0","080404","italic")
"rubyKeyword, rubyKeywordAsMethod
"alias, undef, super, yield, callcc, caller, lambda, proc
call <SID>X("Keyword","705850","080404","italic")
"rubyInteger
call <SID>X("Number","60d060","080404","none")
" #if, #else, #endif
call <SID>X("PreCondit","a090a0","080404","italic")
" generic preprocessor
hi PreProc guifg=#a090a0 guibg=#5e2b2b guisp=#5e2b2b gui=italic ctermfg=247 ctermbg=52 cterm=NONE
" call <SID>X("PreProc","a090a0","080404","italic")
"rubyControl, rubyAccess, rubyEval
"case, begin, do, for, if unless, while, until else, etc.
" hi Statement guifg=#9cb0e6 guibg=NONE guisp=#080404 gui=underline ctermfg=110 ctermbg=232 cterm=underline
call <SID>X("Statement","506090","080404","underline")
"rubyString
call <SID>X("String","a06050","080404","italic")
call <SID>X("Title","ffffff","202020","underline")
"rubyConstant
" hi Type guifg=#945f4d guibg=#34384d guisp=#34384d gui=italic ctermfg=137 ctermbg=239 cterm=NONE
call <SID>X("Type","705850","080404","italic")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dependent highlighting rules. Mostly irrelevant crap from 1972.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" hi link Example         Constant
call <SID>X("Character","60d060","080404","none")
call <SID>X("Boolean","506090","080404","underline")
call <SID>X("Float","60d060","080404","none")
" hi link Example         Statement
call <SID>X("Repeat","906050","080404","underline")
call <SID>X("Label","705850","080404","italic")
call <SID>X("Exception","903020","080404","underline")
call <SID>X("Conditional","609050","080404","underline")
" hi link Example         Type
call <SID>X("StorageClass","705850","080404","italic")
call <SID>X("Structure","705850","080404","italic")
call <SID>X("Typedef","705850","080404","italic")
" hi link Example         Special
call <SID>X("Tag","a06050","181414","italic")
call <SID>X("SpecialChar","a06050","181414","italic")
call <SID>X("SpecialComment","a06050","181414","italic")
call <SID>X("Debug","a06050","181414","italic")

" extras
hi DiffAdd guifg=#4b8060 guibg=NONE guisp=NONE gui=NONE ctermfg=65 ctermbg=NONE cterm=NONE
" call <SID>X("DiffAdd","b4b0b0","","none")
hi DiffDelete guifg=#853939 guibg=NONE guisp=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
" call <SID>X("DiffDelete","b4b0b0","","none")
hi DiffChange guifg=#a1a83e guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
" call <SID>X("DiffChange","b4b0b0","","none")
hi DiffText guifg=#7db0ad guibg=NONE guisp=#080404 gui=NONE ctermfg=109 ctermbg=232 cterm=NONE
" call <SID>X("DiffText","60d060","080404","none")

hi CTagsMember guifg=#e2e4e5 guibg=NONE guisp=NONE gui=underline ctermfg=254 ctermbg=NONE cterm=underline
" call <SID>X("CTagsMember","e2e4e5","","none")
hi CTagsGlobalConstant guifg=#e2e4e5 guibg=NONE guisp=NONE gui=underline ctermfg=254 ctermbg=NONE cterm=underline
" call <SID>X("CTagsGlobalConstant","e2e4e5","","none")
hi CTagsImport guifg=#6c9fb8 guibg=NONE guisp=NONE gui=underline ctermfg=67 ctermbg=NONE cterm=underline
" call <SID>X("CTagsImport","e2e4e5","","none")
hi CTagsGlobalVariable guifg=#e2e4e5 guibg=NONE guisp=NONE gui=underline ctermfg=254 ctermbg=NONE cterm=underline
" call <SID>X("CTagsGlobalVariable","e2e4e5","","none")
hi CTagsClass guifg=#5e7f8f guibg=NONE guisp=NONE gui=underline ctermfg=66 ctermbg=NONE cterm=underline
" call <SID>X("CTagsClass","e2e4e5","","none")

call <SID>X("SpellRare","e2e4e5","","none")
call <SID>X("SpellCap","e2e4e5","","none")
call <SID>X("SpellLocal","e2e4e5","","none")
call <SID>X("SpellBad","e2e4e5","","none")

call <SID>X("MoreMsg","e2e4e5","","none")

call <SID>X("WildMenu","e2e4e5","","none")

call <SID>X("SignColumn","e2e4e5","","none")
hi FoldColumn guifg=#75909e guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
" call <SID>X("FoldColumn","e2e4e5","","none")

call <SID>X("EnumerationValue","e2e4e5","","none")
hi EnumerationName guifg=#e2e4e5 guibg=NONE guisp=NONE gui=underline ctermfg=254 ctermbg=NONE cterm=underline
" call <SID>X("EnumerationName","e2e4e5","","none")

call <SID>X("TabLineSel","e2e4e5","","none")
call <SID>X("TabLineFill","e2e4e5","","none")
call <SID>X("TabLine","e2e4e5","","none")

call <SID>X("Underlined","b4b0b0","080404","underline")
call <SID>X("Union","e2e4e5","","none")
hi Question guifg=#a6a3a3 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
" call <SID>X("Question","b4b0b0","","none")

call <SID>X("VisualNOS","e2e4e5","","none")

call <SID>X("DefinedName","e2e4e5","","none")
    " hi LocalVariable guifg=#8fbacf guibg=NONE guisp=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
    " call <SID>X("LocalVariable","e2e4e5","","none")

" Special for Ruby
" hi rubyRegexp                  guifg=#B18A3D      guibg=NONE      gui=NONE      ctermfg=brown          ctermbg=NONE      cterm=NONE
" hi rubyRegexpDelimiter         guifg=#FF8000      guibg=NONE      gui=NONE      ctermfg=brown          ctermbg=NONE      cterm=NONE
" hi rubyEscape                  guifg=white        guibg=NONE      gui=NONE      ctermfg=cyan           ctermbg=NONE      cterm=NONE
" hi rubyInterpolationDelimiter  guifg=#00A0A0      guibg=NONE      gui=NONE      ctermfg=blue           ctermbg=NONE      cterm=NONE
" hi rubyControl                 guifg=#6699CC      guibg=NONE      gui=NONE      ctermfg=blue           ctermbg=NONE      cterm=NONE  "and break, etc
" hi rubyGlobalVariable          guifg=#FFCCFF      guibg=NONE      gui=NONE      ctermfg=lightblue      ctermbg=NONE      cterm=NONE  "yield
" hi rubyStringDelimiter         guifg=#336633      guibg=NONE      gui=NONE      ctermfg=lightgreen     ctermbg=NONE      cterm=NONE
"rubyInclude
"rubySharpBang
"rubyAccess
"rubyPredefinedVariable
"rubyBoolean
"rubyClassVariable
"rubyBeginEnd
"rubyRepeatModifier
"hi link rubyArrayDelimiter    Special  " [ , , ]
"rubyCurlyBlock  { , , }

" hi link rubyClass             Keyword
" hi link rubyModule            Keyword
" hi link rubyKeyword           Keyword
" hi link rubyOperator          Operator
" hi link rubyIdentifier        Identifier
" hi link rubyInstanceVariable  Identifier
" hi link rubyGlobalVariable    Identifier
" hi link rubyClassVariable     Identifier
" hi link rubyConstant          Type
"
" " Special for XML
" hi link xmlTag          Keyword
" hi link xmlTagName      Conditional
" hi link xmlEndTag       Identifier
"
"
" " Special for HTML
" hi link htmlTag         Keyword
" hi link htmlTagName     Conditional
" hi link htmlEndTag      Identifier
"
"
" " Special for Javascript
" hi link javaScriptNumber      Number
" hi link htmlTag              xmlTag
" hi link htmlTagName          xmlTagName
" hi link htmlEndTag           xmlEndTag


hi pythonbuiltin guifg=#a6a3a3 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
" call <SID>X("pythonBuiltin","b4b0b0","","none")
call <SID>X("phpStringDouble","e2e4e5","","none")
hi htmltagname guifg=#c28787 guibg=NONE guisp=NONE gui=NONE ctermfg=138 ctermbg=NONE cterm=NONE
" call <SID>X("htmlTagName","b4b0b0","","none")
hi javascriptstrings guifg=#e2e4e5 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
" call <SID>X("JavaScriptStrings","e2e4e5","","none")
hi htmlstring guifg=#856d6d guibg=NONE guisp=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
" call <SID>X("htmlString","b4b0b0","","none")
hi phpstringsingle guifg=#e2e4e5 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
" call <SID>X("phpStringSingle","e2e4e5","","none")
"hi clear -- no settings --
" delete functions {{{
delf <SID>X
delf <SID>rgb
delf <SID>color
delf <SID>rgb_color
delf <SID>rgb_level
delf <SID>rgb_number
delf <SID>grey_color
delf <SID>grey_level
delf <SID>grey_number
" }}}

