source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config
source ~/.bash/shared_history

if [ "$TERM" != "dumb" ] && [ -n "$TERM" ]; then
  source ~/.bash/prompt
fi

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
