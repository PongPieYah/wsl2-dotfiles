#!/bin/bash -eu

# パッケージリストとインストール済パッケージの更新
sudo apt update && sudo apt upgrade -y

# パッケージのインストール
sudo apt install --no-install-recommends -y \
    build-essential \
    keychain

#--------------------------
# Homebrew とパッケージのインストール
# cf. https://brew.sh/
#--------------------------
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# brew のパスを通す
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# パッケージのインストール
readonly BREW_PACKAGES=(gcc git zsh starship sheldon bat eza mise peco tldr)
eval "brew install ${BREW_PACKAGES[*]}"

# zsh をデフォルトシェルに設定
which zsh | sudo tee -a /etc/shells
chsh -s "$(which zsh)"

#-----------------------------------------------------
# Docker のインストール
# cf. https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script
#-----------------------------------------------------
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

# sudo なしで実行できるようにするため docker グループに自分を追加する
# `getent group docker` で `docker:x:999:<username>` のようになっていれば OK (要 WSL 再起動)
sudo usermod -aG docker "$USER"

#-------------------------------
# 各ファイルを symlink しておく
#-------------------------------
readonly CONFIG_PATH="$HOME/.config"
mkdir -p "$CONFIG_PATH"/sheldon
ln -sf "$(pwd)/git" "$CONFIG_PATH/git"
ln -sf "$(pwd)/sheldon/plugins.toml" "$CONFIG_PATH/sheldon/plugins.toml"
ln -sf "$(pwd)/starship/starship.toml" "$CONFIG_PATH/starship.toml"
ln -sf "$(pwd)/zsh/profile.zsh" "$HOME/.zprofile"
ln -sf "$(pwd)/zsh/rc.zsh" "$HOME/.zshrc"
ln -sf "$(pwd)/vim/rc.vim" "$HOME/.vimrc"
