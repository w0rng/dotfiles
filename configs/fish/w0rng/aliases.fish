alias activate="source .venv/bin/activate.fish"
alias pip="uv pip"
alias venv="uv venv"

alias dps='docker ps -a --format "table {{.Label \"com.docker.compose.project\"}}\t{{.Label \"com.docker.compose.service\"}}\t{{.ID}}\t{{.Names}}\t{{.Status}}"'
alias dc='docker compose'
alias drm='docker rm -f $(docker ps -aq)'

alias rm="rip"
alias cat="bat"
alias ls="lsd"

alias m='set dir (pwd); while test ! -e "$dir/Makefile" -a "$dir" != "/"; set dir (dirname "$dir"); end; test -e "$dir/Makefile"; and make -C "$dir" $argv'
alias cb='pbcopy'
alias bench='ab -n 100 -c 10'
