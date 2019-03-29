set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'dylanaraps/wal.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'mbbill/undotree'

" Ruby specific plugins
Plugin 'slim-template/vim-slim.git'
Plugin 'tpope/vim-endwise'
Plugin 'rking/ag.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'M4R7iNP/vim-inky'

" JSX
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'digitaltoad/vim-pug'
Plugin 'alvan/vim-closetag'
" Plugin 'chemzqm/vim-jsx-improve'


" colorschemes
Plugin 'morhetz/gruvbox'
Plugin 'jdsimcoe/abstract.vim'
Plugin 'andreasvc/vim-256noir'
Plugin 'AlessandroYorba/Alduin'
Plugin 'challenger-deep-theme/vim'
Plugin 'raphamorim/lucario'
Plugin 'atelierbram/Base2Tone-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'arcticicestudio/nord-vim'
Plugin 'junegunn/limelight.vim'

" Indent lines
Plugin 'Yggdroot/indentLine'
Plugin 'nathanaelkane/vim-indent-guides'

" autocomplete
Plugin 'lifepillar/vim-mucomplete'

Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'csexton/trailertrash.vim'

call vundle#end()            " required
filetype plugin indent on    " required

"goyo config
let g:goyo_height=100
let g:goyo_width=100
let g:goyo_linenr=1
