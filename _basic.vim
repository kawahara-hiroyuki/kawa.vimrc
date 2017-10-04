nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

" インサートモードからの抜け出し
inoremap zx <esc>

" 行番号の表示
set number

"行頭及び行末への移動
inoremap <C-a> <Esc>0a
inoremap <C-e> <Esc>$a
noremap <C-a> <Esc>0a
noremap <C-e> <Esc>$a

" vimrc に以下のように追記

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
	noremap N :NERDTree<Enter>

	" コメントアウト
	noremap _ :TComment<CR>

	" コード補完
	let g:neocomplcache_enable_at_startup = 1

	" カーソルの位置を復元
	if has("autocmd")
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif
	endif
