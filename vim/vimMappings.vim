function! ToggleRelativeNumber()
	 set relativenumber!
endfunction
noremap <leader>rn :call ToggleRelativeNumber()<CR>

function! ToggleTheme()
	if g:colors_name == "nord"
		colorscheme gruvbox
		echom g:colors_name
	elseif g:colors_name == "gruvbox"
		colorscheme nord
		echom g:colors_name
	endif
endfunction
nnoremap <leader>ct :call ToggleTheme()<CR>

"HTML mappings

" Shortcuts
nnoremap <leader>y :Goyo<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" tab shortcuts
nnoremap <leader>ts :tab split<CR>
function! MoveToPrevTab()
  "there is only one window
  if tabpagenr(')$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc
nnoremap <leader>th :call MoveToPrevTab()<CR>

function! MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

" window shortcuts
nnoremap <leader>wj :winc r<CR>
nnoremap <leader>wk :winc R<CR>

function! s:goyo_enter()
	Goyo 85%x85%
	set showmode
	set showcmd
  GitGutterEnable
endfunction
function! s:goyo_leave()
endfunction
nnoremap <leader>tl :call MoveToNextTab()<CR>

" insert shortcuts
inoremap <Alt-j> <ESC>
nnoremap sv :source ~/.vimrc

" LimeLight options
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

let g:limelight_paragraph_span = 2
nnoremap <leader>ll :Limelight<CR>
nnoremap <leader>lk :Limelight!<CR>
let g:inky_template_language = 'slim'

let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" Git
nnoremap <leader>gb :Gblame<CR>

" Trailer trash
