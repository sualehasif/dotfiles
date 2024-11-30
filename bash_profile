source ~/.bashrc

# >>> coursier install directory >>>
export PATH="$PATH:/Users/sualeh/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

. "$HOME/.cargo/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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

complete -C /opt/homebrew/bin/terraform terraform
. "/Users/sualeh/.deno/env"
. "$HOME/.atuin/bin/env"
