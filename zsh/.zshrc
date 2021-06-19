export ZSH=/home/matt/.config/zsh/oh-my-zsh

ZSH_THEME="sunrise"

plugins=(
    git
    zsh-autosuggestions
    history-substring-search
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

(cat ~/.cache/wal/sequences &)
