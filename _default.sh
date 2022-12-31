#!/bin/bash

# https://qiita.com/youcune/items/fcfb4ad3d7c1edf9dc96
set -eu

# https://dev.classmethod.jp/articles/joined-mac-dotfiles-customize/
if [ "$(uname)" != "Darwin" ]; then
  echo "Not macOS!"
  exit 1
fi

# [Macのセットアップを自動化！３つのポイント - Qiita](https://qiita.com/7coAim/items/fe8ac542a78f9f985572#-%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0%E7%92%B0%E5%A2%83%E8%A8%AD%E5%AE%9A-defaults%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89)
# Dock:自動的に隠さない
defaults write com.apple.dock autohide -bool false

# タップでクリックを許可
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1

# カーソルの移動速度を変更 （1〜15）
defaults write -g com.apple.trackpad.scaling -float 10

# Finder:隠しファイル/フォルダを表示
defaults write com.apple.finder AppleShowAllFiles true

# Finder:拡張子を表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# [支給されたMacの環境をdotfilesでセットアップしてみた | DevelopersIO](https://dev.classmethod.jp/articles/joined-mac-dotfiles-customize/)

# ====================
#
# Base
#
# ====================
# Disable auto-capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# ====================
#
# Dock
#
# ====================
# Disable animation at application launch
defaults write com.apple.dock launchanim -bool false

# ====================
#
# Finder
#
# ====================
# Disable animation
defaults write com.apple.finder DisableAllAnimations -bool true

# Display the status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Display the path bar
defaults write com.apple.finder ShowPathbar -bool true

# ====================
#
# SystemUIServer
#
# ====================

# Display date, day, and time in the menu bar
# defaults write com.apple.menuextra.clock DateFormat -string 'EEE d MMM HH:mm'

# Display battery level in the menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# [Mac を買ったら必ずやっておきたい初期設定 - Qiita](https://qiita.com/ucan-lab/items/c1a12c20c878d6fb1e21#%E5%85%B1%E6%9C%89%E3%83%95%E3%82%A9%E3%83%AB%E3%83%80%E3%81%A7-ds_store-%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E4%BD%9C%E6%88%90%E3%81%97%E3%81%AA%E3%81%84)
# 共有フォルダで .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

for app in "Dock" \
  "Finder" \
  "SystemUIServer"; do
  killall "${app}" &>/dev/null
done
