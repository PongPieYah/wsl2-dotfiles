# ----------------------------
# functions
# ----------------------------
peco_history_selection() {
  BUFFER=$(history -n 1 | tac | awk '!a[$0]++' | peco)
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco_history_selection
bindkey '^R' peco_history_selection

replace_githooks() {
  local hooks_dir="$(pwd)/.git/hooks"
  [ ! -e "$hooks_dir" ] || {
    echo "$hooks_dir not found"
    exit 0
  }

  rm -rf "$hooks_dir"
  ln -s ~/.config/git/hooks "$hooks_dir"
}

open() {
  if [ $# != 1 ]; then
    explorer.exe .
  else
    if [ -e $1 ]; then
      cmd.exe /c start $(wslpath -w $1) 2>/dev/null
    else
      echo "open: $1 : No such file or directory"
    fi
  fi
}
