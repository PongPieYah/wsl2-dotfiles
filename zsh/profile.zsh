[[ -n "$EDITOR" ]] || export EDITOR='vim'
[[ -n "$VISUAL" ]] || export VISUAL='vim'
[[ -n "$LANG" ]] || export LANG='en_US.UTF-8'
[[ -n "$LESS" ]] || export LESS='-g -i -M -R -S -w -X -z-4'

# history の設定
HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=100000

# path の追加
for dir in "$HOME/bin" "$HOME/.local/bin"; do
  if [[ -d "$dir" ]]; then
    path+=("$dir")
  fi
done

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
