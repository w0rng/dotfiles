# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git docker docker-compose pip tmux pipenv zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export PATH="/Users/w0rng/Library/Python/3.10/bin:$PATH"

eval $(thefuck --alias)

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
alias ping=gping
alias ls=exa
alias lzd=lazydocker

eval "$(starship init zsh)"
export EDITOR="vim"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/Users/w0rng/.emacs.d/bin:$PATH"
alias gtp="source ~/Projects/w0rng/scripts/projects.sh"
alias gpl="zsh ~/Projects/w0rng/scripts/projects_list.sh"
alias activate="source .venv/bin/activate"
alias f="fuck"

alias tunnel='/Users/w0rng/Projects/w0rng/scripts/port_forvarding.sh'
alias dps='docker ps -a --format "table {{.Label \"com.docker.compose.project\"}}\t{{.Label \"com.docker.compose.service\"}}\t{{.ID}}\t{{.Names}}\t{{.Status}}"'
alias m='make'

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
