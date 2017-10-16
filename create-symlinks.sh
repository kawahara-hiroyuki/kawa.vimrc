#!/bin/bash

# 作業するディレクトリ
dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd;)
#vim_conf_dir=$HOME/.vim/
#conf_dir=$dir/conf.d
# vimのディクトリ
vim_dir=$HOME/.vim
# dein用ディレクトリ
vim_dein_dir=$vim_dir/rc/dein

# vim/deinディレクトリ作成
[ -d $vim_dir ] || mkdir -p $vim_dir
[ -d $vim_dein_dir ] || mkdir -p $vim_dein_dir
#[ -d $vim_conf_dir ] || mkdir -p $vim_conf_dir

# オリジナルの.vimrcの退避
[ -f $HOME/.vimrc ] && ( [ -f $HOME/.vimrc.ORIG ] || cp $HOME/.vimrc $HOME/.vimrc.ORIG)

# シンボリックリンク集
ln -sf $dir/basic.vim $HOME/.vimrc
ln -sf $vim_dein_dir/dein.toml $dir/dein/dein.toml
ln -sf $vim_dein_dir/dein_lazy.toml $dir/dein/dein_lazy.toml
