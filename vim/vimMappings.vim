

function! FixLastSpellingError()
	normal! mm[s1z=`m
endfunction
nnoremap <leader>sp :call FixLastSpellingError()<CR>

function! ToggleRelativeNumber()
	 set relativenumber!
endfunction
nnoremap <leader>rn :call ToggleRelativeNumber()<CR>

inoremap ;<Space> <Esc>/<++><CR>"_c4l

"HTML mappings

autocmd Filetype html inoremap ;i <em></em><Space><++><ESC>FeTi
