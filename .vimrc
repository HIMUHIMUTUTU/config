" 行番号を表示
set number

" インデント表示
set autoindent

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

"ウィンドウを最大化して起動
au GUIEnter * simalt ~x

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

" 構文強調表示機能を有効にする
colorscheme molokai
set syn=php
syntax on
let g:molokai_original = 1
"let g:rehash256 = 1
"set background=dark
set cursorline

"php関連設定
"文字列中のSQLをハイライトする
"let php_sql_query=1 
"文字列中のHTMLをハイライトする
let php_htmlInStrings=1
"ショートタグ (<?を無効にする→ハイライト除外にする)
let php_noShortTags = 1 
"クラスと関数の折りたたみ(folding)を有効にする
let php_folding = 1

"php補完
au FileType php,ctp :set dict=~/.vim/dict/php.dict
set complete+=k

"php文法チェック
"autocmd FileType php set makeprg=php\ -l\ %
"autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif

"文字コード
set encoding=utf-8
"set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8

"スペルチェック
"set spelllang+=cjk
"set spell

"画面サイズ
set columns=200
set lines=50

"閉じタグジャンプを拡張
":source $VIMRUNTIMEmacros/matchit.vim

"Oで空行挿入
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

"Neobundl設定e
" Note Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
	set nocompatible               " Be iMproved

	" Required
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"Required
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'felixge/vim-nodejs-errorformat'
NeoBundle 'kana/vim-fakeclip' "クリップボード
NeoBundle 'tomasr/molokai'
" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" クリップボード有効化
set clipboard=unnamed

" バックスペースを有効化
set backspace=start,eol,indent
