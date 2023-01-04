#!/bin/bash

# https://qiita.com/youcune/items/fcfb4ad3d7c1edf9dc96
set -eu

# シンボリックリンクの作成
# https://envader.plus/course/7/scenario/1033
echo "Add symboliclinks ..."
DOT_FILES=".bash_profile .bashrc .gitconfig .git-completion.sh .git-prompt.sh"
for file in $DOT_FILES; do
  ln -sf $(pwd)/$file $HOME/$file
done
