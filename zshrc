# enable powerlevel10k instant prompt. should stay close to the top of ~/.zshrc.
# initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${xdg_cache_home:-$home/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${xdg_cache_home:-$home/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
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
export zsh="~/.oh-my-zsh"

# set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $random_theme
# see https://github.com/robbyrussell/oh-my-zsh/wiki/themes

zsh_theme="agnoster"
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
plugins=(git zsh-z zsh-interactive-cd copyfile cp history mosh colorize themes colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)

# for zsh-z\
zstyle ':completion:*' menu select

source $zsh/oh-my-zsh.sh


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
# export ARCHFLAGS="-arch x86_64"

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
