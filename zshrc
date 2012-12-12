# Load oh-my-zsh
. ~/.oh-my-zsh/templates/zshrc.zsh-template

# Other zsh settings
. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc
