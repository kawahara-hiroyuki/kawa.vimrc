#!/bin/bash

dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd;)
#vim_conf_dir=$HOME/.vim/
#conf_dir=$dir/conf.d
vim_dir=$HOME/.config/vim
vim_dein_dir=$vim_dir/dein

# vim/deinディレクトリ作成
[ -d $vim_dein_dir ] || mkdir -p $vim_dein_dir
#[ -d $vim_conf_dir ] || mkdir -p $vim_conf_dir

# オリジナルの.vimrcの退避
[ -f $HOME/.vimrc ] && ( [ -f $HOME/.vimrc.ORIG ] || cp $HOME/.vimrc $HOME/.vimrc.ORIG)

# シンボリックリンク集
ln -sf $dir/basic.vim $HOME/.vimrc
ln -sf $vim_dein_dir dein

