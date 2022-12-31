#!/bin/bash

# https://qiita.com/youcune/items/fcfb4ad3d7c1edf9dc96
set -eu

# https://monologu.com/mac-loginshell-bash/
echo "Install programming Languages ..."

# List
#------------------------------------------
# asdf
#   https://github.com/asdf-vm/asdf
#------------------------------------------

# # nodejs
# which asdf >/dev/null 2>&1 && asdf plugin add nodejs && asdf install nodejs latest && asdf global nodejs latest

# # python
# which asdf >/dev/null 2>&1 && asdf plugin add php && asdf install php latest && asdf global php latest

# # python
# which asdf >/dev/null 2>&1 && asdf plugin add python && asdf install python latest && asdf global python latest

# # ruby
# which asdf >/dev/null 2>&1 && asdf plugin add ruby && asdf install ruby latest && asdf global ruby latest

# # starship
# which asdf >/dev/null 2>&1 && asdf plugin add starship && asdf install starship latest && asdf global starship latest

# [バージョン管理 anyenv -> asdf な話](https://zenn.dev/okamos/articles/d33aac3ae69b98#plugins)
local -a plugins=(
  'mysql'
  'nodejs'
  'php'
  'postgres'
  'python'
  'ruby'
  'terraform'
)

for index in ${!plugins[*]}; do
  local plugin=$(echo ${plugins[$index]} | cut -d' ' -f 1)
  echo "Install ${plugin}..."
  which asdf >/dev/null 2>&1 && asdf plugin add ${plugin}

  if [ $? -eq 2 ]; then
    continue
  fi

  which asdf >/dev/null 2>&1 && asdf install ${plugin} latest
  which asdf >/dev/null 2>&1 && asdf global ${plugin} latest
done

# echo -e "\n$HOME $(brew --prefix asdf)/libexec/asdf.sh" >>~/.bash_profile
# echo -e "\n$HOME $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash" >> ~/.bash_profile

# asdf plugins
#------------------------------------------
# asdf-direnv
#   https://github.com/asdf-community/asdf-direnv
#   https://direnv.net/
#   https://tech.buty4649.net/entry/2021/07/29/201613
#------------------------------------------
# asdf plugin-add direnv;
###### echo 'eval "$(direnv hook bash)"' > ~/.bashrc
# asdf direnv setup --shell bash --version latest;
# asdf exec direnv allow

# echo 'eval "$(starship init bash)"' > ~/.bashrc
