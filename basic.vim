" nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

" インサートモードからの抜け出し
inoremap zx <esc>

" 行番号の表示
set number

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
 call dein#begin(s:dein_dir)

" プラグインリストを収めた TOML ファイル
" 予め TOML ファイル（後述）を用意しておく
 let g:rc_dir    = expand('~/.vim/rc')
 let s:toml      = g:rc_dir . '/dein.toml'
 let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

" TOML を読み込み、キャッシュしておく
 call dein#load_toml(s:toml,      {'lazy': 0})
 call dein#load_toml(s:lazy_toml, {'lazy': 1})

" 設定終了
 call dein#end()
 call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
 call dein#install()
endif

" カラーコードの設置
syntax on
colorscheme antares

" 検索をより綺麗に
set incsearch
set hlsearch

" オートインデント
set autoindent
set tabstop=2
set shiftwidth=2
set noexpandtab

" NERDTree短縮コマンド
" キーバインドが重複しているので書き換える:
noremap <silent><C-e> :NERDTreeToggle<CR>



" コメントアウト
noremap _ :TComment<CR>j

" コード補完
let g:neocomplcache_enable_at_startup = 1
" 使いづらいことがあるので、shogoさんのを探すこと

" カーソルの位置を復元
if has("autocmd")
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif
endif

" 文字コードの指定
set encoding=utf-8
set fileencodings=utf-8,sjis,cp932

" 改行コードの設定
set fileformats=unix,dos,mac

" autocmd FileType wsh,vb,aspvbs setlocal fileformat=dos
" autocmd FileType wsh,vb,aspvbs setlocal fileencoding=sjis 

" set backspace=2
set nocompatible
set backspace=indent,eol,start

" agのエディタ統合
let g:ackprg = 'ag --nogroup --nocolor --column'


" 「:Csva」と打つと、リアルタイムに現在のカラムをハイライトにしてくれるもう一度打つと停止
function! CSVH_SAVE_CURSOR()
   let g:CsvaFlg = get(g:, 'CsvaFlg', 0)
   if g:CsvaFlg == 1
      execute 'match Keyword /^\([^, ]*[, ]\)\{'.strlen(substitute(getline('.')[0:col('.')-1], "[^, ]", "", "g")).'}\zs[^, ]*/'
   endif
endfunction
augroup CsvCursorHighlight
    autocmd!
    autocmd BufWinEnter,InsertLeave,CursorMoved * call CSVH_SAVE_CURSOR()
augroup END
function! CSVA()
   let g:CsvaFlg = get(g:, 'CsvaFlg', 0)
   if g:CsvaFlg == 0
      let g:CsvaFlg = 1
   else
      execute 'match none'
      let g:CsvaFlg = 0
   endif
endfunction
command! Csva :call CSVA()

" クリップボードの共有
set clipboard=unnamedplus

" ファイル末で差分を表示させない
set nofixendofline

" dein: gitgetter
let g:gitgutter_highlight_lines = 0

" swapファイルを作成しない
set noswapfile

" backupファイルを作成しない
set nobackup

" viminfoファイルを作成しない
set viminfo=

" unファイルを作成しない
nnoremap <ESC><ESC> :noh<Enter>

" コード補完
let g:neocomplcache_enable_at_startup = 1
" 使いづらいことがあるので、shogoさんのを探すこと

" カーソルの位置を復元
if has("autocmd")
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif
endif

" set backspace=2
set nocompatible
set backspace=indent,eol,start

" agのエディタ統合
let g:ackprg = 'ag --nogroup --nocolor --column'


" 「:Csva」と打つと、リアルタイムに現在のカラムをハイライトにしてくれるもう一度打つと停止
function! CSVH_SAVE_CURSOR()
   let g:CsvaFlg = get(g:, 'CsvaFlg', 0)
   if g:CsvaFlg == 1
      execute 'match Keyword /^\([^, ]*[, ]\)\{'.strlen(substitute(getline('.')[0:col('.')-1], "[^, ]", "", "g")).'}\zs[^, ]*/'
   endif
endfunction
augroup CsvCursorHighlight
    autocmd!
    autocmd BufWinEnter,InsertLeave,CursorMoved * call CSVH_SAVE_CURSOR()
augroup END
function! CSVA()
   let g:CsvaFlg = get(g:, 'CsvaFlg', 0)
   if g:CsvaFlg == 0
      let g:CsvaFlg = 1
   else
      execute 'match none'
      let g:CsvaFlg = 0
   endif
endfunction
command! Csva :call CSVA()

" バックスペースを有効にする
" set backspace=indent,eol,start
set backspace=indent,eol,start

" deniteの環境設定
let g:python3_host_prog = '~/usr/local/bin/python3'




