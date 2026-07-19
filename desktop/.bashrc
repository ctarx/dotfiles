# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)

source ~/.local/share/omarchy/default/bash/rc

# Give the g alias native Git completion.
if declare -F _comp_load >/dev/null; then
  _comp_load git
fi
if declare -F __git_complete >/dev/null; then
  __git_complete g __git_main
fi

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
#
# Use VSCode instead of neovim as your default editor
# export EDITOR="code"
#
# Set a custom prompt with the directory revealed (alternatively use https://starship.rs)
# PS1="\W \[\e]0;\w\a\]$PS1"

# Load aliases and shortcuts (every interactive shell)
[[ -f ~/.config/bash/aliases ]] && . ~/.config/bash/aliases
[[ -f ~/.config/bash/shortcuts ]] && . ~/.config/bash/shortcuts
