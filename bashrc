fzf_log() {  
  hash=$(git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |  fzf | awk '{print $1}')
  echo $hash | pbcopy
  git showtool $hash
}

alias c='clear'
alias v='nvim'
alias condals="conda env list"
alias cls="conda info --envs"

zsh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

. "$HOME/.cargo/env"
. "/Users/sualeh/.deno/env"
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"
