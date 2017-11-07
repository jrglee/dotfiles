#!/usr/bin/env bash

[ $# -eq 1 ] && [[ "$1" == "debug" ]] && debug=echo

pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd`
popd > /dev/null

for file in 'bash_profile' 'bashrc' 'gitconfig' 'gvimrc.after' 'npmrc' 'vimrc.after' 'vimrc.before'
do
  dest="${HOME}/.${file}"

  [[ -L "$dest" ]] && $debug rm $dest
  [[ -f "$dest" ]] && $debug mv $dest "${dest}.old"

  $debug ln -s $SCRIPTPATH/$file $dest
done

$debug mkdir -p ~/.config/nvim
[ -e $HOME/.vim ] && $debug ln -s ~/.vim ~/.config/nvim
[ -e $HOME/.vimrc ] && $debug ln -s ~/.vimrc ~/.config/nvim/init.vim

