# Omarchy environment (OMARCHY_PATH + PATH), needed even for non-interactive shells
[[ -r /usr/share/omarchy/default/bash/env-bootstrap ]] && source /usr/share/omarchy/default/bash/env-bootstrap

# If not running interactively, don't do anything else (leave this above the rc source)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source "$OMARCHY_PATH/default/bash/rc"

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'

# Give the g alias native Git completion.
if declare -F _comp_load >/dev/null; then
  _comp_load git
fi
if declare -F __git_complete >/dev/null; then
  __git_complete g __git_main
fi

# Load aliases and shortcuts (every interactive shell)
[[ -f ~/.config/bash/aliases ]] && . ~/.config/bash/aliases
[[ -f ~/.config/bash/shortcuts ]] && . ~/.config/bash/shortcuts
[[ -f ~/.config/bash/banner ]] && . ~/.config/bash/banner
