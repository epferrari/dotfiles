# Pre-load .localrc for things like theme selection
[[ -f ~/.localrc ]] && . ~/.localrc
ZSH_THEME_SELECTED="$ZSH_THEME"

# Load oh-my-zsh
. ~/.oh-my-zsh/templates/zshrc.zsh-template

# Bash settings
. ~/.bash/aliases
. ~/.bash/paths
. ~/.bash/config

# Other zsh settings
. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion
. ~/.zsh/prompt

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc
