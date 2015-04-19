#!/usr/bin/env bash

[ $# -eq 1 ] && [[ "$1" == "debug" ]] && debug=echo

pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd`
popd > /dev/null

for file in 'bash_profile' 'bashrc' 'gitconfig' 'gvimrc.after' 'vimrc.after'
do
  dest="${HOME}/.${file}"

  if [[ -L "$dest" ]]; then
    $debug rm $dest
  fi

  if [[ -f "$dest" ]]; then
    $debug mv $dest "${dest}.old"
  fi
 $debug ln -s $SCRIPTPATH/$file $dest
done
