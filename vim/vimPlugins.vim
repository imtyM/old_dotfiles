set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/dotfiles/vim/vundle/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'junegunn/limelight.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'kien/ctrlp.vim'
Plugin 'dylanaraps/wal.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/goyo.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'amix/open_file_under_cursor.vim'
Plugin 'tpope/vim-surround'
Plugin 'xuhdev/vim-latex-live-preview'

Plugin 'morhetz/gruvbox'
Plugin 'jiangmiao/auto-pairs'

" Ruby specific plugins
Plugin 'vim-ruby/vim-ruby'
Plugin 'slim-template/vim-slim.git'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'

call vundle#end()            " required
filetype plugin indent on    " required

"goyo config
let g:goyo_height=100
let g:goyo_width=100
let g:goyo_linenr=1
