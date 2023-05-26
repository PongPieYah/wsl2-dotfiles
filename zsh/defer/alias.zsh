# ----------------------
# エイリアス設定
# ----------------------

# git
if [[ $(command -v git) ]]; then
    alias g='git'
fi

# eza
if [[ $(command -v eza) ]]; then
    alias e='eza --icons --git'
    alias l='e'
    alias ls='e'
    alias ea='eza -a --icons --git'
    alias la='ea'
    alias ee='eza -aahl --icons --git'
    alias ll='ee'
    alias et='eza -T -L 3 -a -I "node_modules|.git|.cache" --icons'
    alias lt='et'
    alias eta='eza -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
    alias lta='eta'
    alias l='clear && ls'
fi

# docker
if [[ $(command -v docker) ]]; then
    alias d='docker'
    alias dn='docker network'
    alias dni='docker network inspect'
    alias dp='docker ps'
    alias dpa='docker ps -a'
    alias dpaq='docker ps -aq'
    alias di='docker images'
    alias dia='docker images -a'
    alias diaq='docker images -aq'
    alias dv='docker volume'
    alias dvi='docker volume inspect'
    alias dvl='docker volume ls'
    alias dvr='docker volume rm'
    alias dvrf='docker volume rm -f'
    alias dc='docker compose'
    alias dcps='docker compose ps'
    alias dcud='docker compose up -d'
    alias dcudb='docker compose up -d --build'
    alias dce='docker compose exec'
    alias dcl='docker compose logs'
    alias dcd='docker compose down'
    alias dcb='docker compose build'
    alias dcbnc='docker compose build --no-cache'
fi

# others
alias s='sudo'
alias c='clear'
