map <leader>f <Plug>(easymotion-prefix)

function! FixLastSpellingError()
	normal! mm[s1z=`m
endfunction
nnoremap <leader>sp :call FixLastSpellingError()<CR>

function! ToggleRelativeNumber()
	 set relativenumber!
endfunction
nnoremap <leader>rn :call ToggleRelativeNumber()<CR>

function! ToggleTheme()
	if g:colors_name == "wal"
		colorscheme gruvbox
		echom g:colors_name
	elseif g:colors_name == "gruvbox"
		colorscheme wal
		echom g:colors_name
	endif
endfunction
nnoremap <leader>cs :call ToggleTheme()<CR>


"HTML mappings

autocmd Filetype html inoremap ;i <em></em><Space><++><ESC>FeTi


" Shortcuts
nnoremap <leader>g :Goyo<CR>
nnoremap <leader>st :SyntasticToggleMode<CR>
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

function! s:goyo_enter()
	Goyo 85%x85%
	set showmode
	set showcmd
	call lightline#enable()
endfunction
function! s:goyo_leave()
endfunction

" insert shortcuts 
inoremap <A-j> <ESC>

" javascript mappings
autocmd Filetype javascript.jsx nnoremap <leader>ar i()<Space>=><Space>{}<ESC>i
