set -g fish_greeting

if status is-interactive
    starship init fish | source
end

pyenv init - | source
export PATH="/Users/w0rng/yandex-cloud/bin/:$PATH:/opt/homebrew/Cellar/libgccjit/14.1.0/lib/gcc/current/"

alias activate="source .venv/bin/activate.fish"
alias m='set dir (pwd); while test ! -e "$dir/Makefile" -a "$dir" != "/"; set dir (dirname "$dir"); end; test -e "$dir/Makefile"; and make -C "$dir" $argv'
alias dps='docker ps -a --format "table {{.Label \"com.docker.compose.project\"}}\t{{.Label \"com.docker.compose.service\"}}\t{{.ID}}\t{{.Names}}\t{{.Status}}"'
alias kamal='docker run -it --rm -v "$PWD:/workdir" -v "/run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock" -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock" -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/basecamp/kamal:latest'
alias cb='pbcopy'
alias rm="rip"
alias cat="bat"
alias pip="uv pip"
alias venv="uv venv"
alias dc='docker compose'
alias drm='docker rm -f $(docker ps -aq)'
alias bench='ab -n 100 -c 10'
export LEDGER_FILE=/Users/w0rng/finance/main.journal
export GOROOT="$(brew --prefix golang)/libexec"

export GPG_TTY=$(tty)
gpgconf --launch gpg-agent


set CONFIG_PATH ~/.config/alacritty/alacritty.toml

function set_alacritty_theme
    set system_theme (defaults read -g AppleInterfaceStyle 2> /dev/null)
    if test "$system_theme" = "Dark"
        sed -i '' -e 's/solarized_light/solarized_dark/' $CONFIG_PATH
    else
        sed -i '' -e 's/solarized_dark/solarized_light/' $CONFIG_PATH
    end
end

set_alacritty_theme
