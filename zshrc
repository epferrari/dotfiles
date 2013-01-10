# Pre-load .localrc for custom theme selection
[[ -f ~/.localrc ]] && . ~/.localrc
ZSH_THEME_SELECTED="$ZSH_THEME"

# Load oh-my-zsh
ZSH=$HOME/.oh-my-zsh
plugins=($plugins brew capistrano debian git gem heroku npm rails3 ruby rvm svn yum)

if [[ "$unamestr" == 'Darwin' ]]; then
  # Include osx plugin on osx
  plugins=($plugins osx)
fi

DISABLE_AUTO_UPDATE="true"
. ~/.oh-my-zsh/oh-my-zsh.sh

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
