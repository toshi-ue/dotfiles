#!/bin/bash

# https://qiita.com/youcune/items/fcfb4ad3d7c1edf9dc96
set -eu

# https://dev.classmethod.jp/articles/joined-mac-dotfiles-customize/
if [ "$(uname)" != "Darwin" ]; then
  echo "Not macOS!"
  exit 1
fi

# https://monologu.com/mac-loginshell-bash/
echo "Change default shell bash from zsh ..."
chsh -s /bin/bash

# Move to your home directory
# echo "Your Home Directory:" $HOME

echo "Auto setup to macOS BigSur (Intel)."
echo "Start install Xcode ..."
# xcode-select install

#------------------------------------------
# homebrew(x86_64)
#   https://brew.sh/
#------------------------------------------
echo 'Install Homebrew... (maybe needs password)'
which $(which brew) >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# mas-cliのインストール
brew install mas

# [【Mac】ターミナル、シェル環境の初期設定 - Qiita](https://qiita.com/ucan-lab/items/b3132efb4f3907899a60#zoxide%E3%82%BE%E3%82%AD%E3%82%B5%E3%82%A4%E3%83%89)
# zoxideの検討
# brew install zoxide

echo 'Running `brew doctor`...'
which $(which brew) >/dev/null 2>&1 && brew doctor

echo 'Running `brew update`...'
which $(which brew) >/dev/null 2>&1 && brew update --verbose

echo 'Running `brew grade`...'
which $(which brew) >/dev/null 2>&1 && brew upgrade --verbose

# [Homebrewで覚えておくと便利なコマンド一覧 | Rriver](https://parashuto.com/rriver/tools/homebrew-most-used-commands)
echo 'Running `brew autoremove`...'
which $(which brew) >/dev/null 2>&1 && brew autoremove

echo 'Install macOS Applications by Brewfile...'
which /opt/homebrew/bin/brew >/dev/null 2>&1 && brew bundle --file ./.Brewfile --verbose

echo "Running $(brew cleanup)..."
which brew >/dev/null 2>&1 && brew cleanup --verbose

echo 'Install Programming Languages...'
./_asdf.sh

echo 'Create SymbolicLinks...'
./_link.sh
