tm() {
  [[ -n "$tmux" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
     tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -f "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "no sessions found."
}

fzf_log() {
  hash=$(git log --color=always --format="%c(auto)%h%d %s %c(black)%c(bold)%cr" "$@" |  fzf | awk '{print $1}')
  echo $hash | pbcopy
  git showtool $hash
}

# path to your oh-my-zsh installation.
export ZSH="/Users/sualeh/.oh-my-zsh"


# set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $random_theme
# see https://github.com/robbyrussell/oh-my-zsh/wiki/themes

ZSH_THEME="robbyrussell"
# zsh_theme="powerlevel10k/powerlevel10k"

# set list of themes to pick from when loading at random
# setting this variable when zsh_theme=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# if set to an empty array, this variable will have no effect.
# zsh_theme_random_candidates=( "robbyrussell" "agnoster" )

# uncomment the following line to use case-sensitive completion.
# case_sensitive="true"

# uncomment the following line to use hyphen-insensitive completion.
# case-sensitive completion must be off. _ and - will be interchangeable.
# hyphen_insensitive="true"

# uncomment the following line to disable bi-weekly auto-update checks.
# disable_auto_update="true"

# uncomment the following line to automatically update without prompting.
# disable_update_prompt="true"

# uncomment the following line to change how often to auto-update (in days).
# export update_zsh_days=13

# uncomment the following line if pasting urls and other text is messed up.
# disable_magic_functions=true

# uncomment the following line to disable colors in ls.
# disable_ls_colors="true"

# uncomment the following line to disable auto-setting terminal title.
# disable_auto_title="true"

# uncomment the following line to enable command auto-correction.
# enable_correction="true"

# uncomment the following line to display red dots whilst waiting for completion.
# completion_waiting_dots="true"

# uncomment the following line if you want to disable marking untracked files
# under vcs as dirty. this makes repository status check for large repositories
# much, much faster.
# disable_untracked_files_dirty="true"

# uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# you can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# hist_stamps="mm/dd/yyyy"

# would you like to use another custom folder than $zsh/custom?
# zsh_custom=/path/to/new-custom-folder

# which plugins would you like to load?
# standard plugins can be found in ~/.oh-my-zsh/plugins/*
# custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# example format: plugins=(rails git textmate ruby lighthouse)
# add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-z zsh-autosuggestions zsh-interactive-cd copyfile cp history mosh colorize themes colored-man-pages zsh-syntax-highlighting)

# for zsh-z\
zstyle ':completion:*' menu select

source $ZSH/oh-my-zsh.sh

# Path updates
export PATH="/opt/homebrew/opt/libtool/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/bin/python3:$PATH"
export PATH="$PATH:/Users/sualeh/code/anysphere/githooks/bin"
export ANYSPHEREROOT=/Users/sualeh/code/anysphere
export EVERYSPHERE_ROOT=/Users/sualeh/code/everysphere
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="$PATH:/Users/sualeh/code/everysphere/githooks/bin"
export CONTROLROOT=/Users/sualeh/code/everysphere

# alias python="/opt/homebrew/bin/python3"
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export x86="arch -x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias c='clear'
alias v='vim'
alias condals="conda env list"
alias cls="conda info --envs"
alias bzl="bazelisk"
alias rgf='rg --files | rg'
alias githist='git log --abbrev-commit --oneline $(git merge-base origin/main HEAD)^..HEAD'

TREE_IGNORE="cache|log|logs|node_modules|vendor"

# alias ls=' exa --group-directories-first'
alias la=' ls -a'
alias ll=' ls --git -l'
alias lt=' ls --tree -D -L 2 -I ${TREE_IGNORE}'
alias ltt=' ls --tree -D -L 3 -I ${TREE_IGNORE}'
alias lttt=' ls --tree -D -L 4 -I ${TREE_IGNORE}'
alias ltttt=' ls --tree -D -L 5 -I ${TREE_IGNORE}'
alias gs='git status'

function gluem() {
  local main_branch=$(git ls-remote --symref origin HEAD | awk '/^ref:/ {sub(/refs\/heads\//, "", $2); print $2}')
  # print the progress
  echo "doing a git merge with $main_branch"

  gf
  gm origin/$main_branch
  ggp
}

function gluer() {
  local main_branch=$(git ls-remote --symref origin HEAD | awk '/^ref:/ {sub(/refs\/heads\//, "", $2); print $2}')
  echo "doing a git rebase with $main_branch"

  git fetch origin/$main_branch
  git rebase origin/$main_branch
  ggp
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

export PATH=/Users/sualeh/.meteor:$PATH

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# opam configuration
[[ ! -r /Users/sualeh/.opam/opam-init/init.zsh ]] || source /Users/sualeh/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

export VSCODE_QUALITY="stable"

# pnpm
export PNPM_HOME="/Users/sualeh/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
#
#

cursor2 () { VSCODE_CWD="$PWD" open -n -b "co.anysphere.cursor" --args $* ;}

eval "$(github-copilot-cli alias -- "$0")"

eval "$(atuin init zsh --disable-up-arrow )"

bindkey '^a' _atuin_search_widget

# depends on terminal mode
# bindkey '^[[A' _atuin_search_widget
# bindkey '^[OA' _atuin_search_widget

# bun completions
[ -s "/Users/sualeh/.bun/_bun" ] && source "/Users/sualeh/.bun/_bun"
export PATH=$PATH:/Users/sualeh/.pixi/bin
alias lg='lazygit'

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
. "$HOME/.cargo/env"
. "/Users/sualeh/.deno/env"
. "$HOME/.atuin/bin/env"
