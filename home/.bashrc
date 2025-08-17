# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)

# --- Starship prompt setup ---
if command -v starship &>/dev/null; then
  eval "$(starship init bash)"
fi

source ~/.local/share/omarchy/default/bash/rc

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

# Load ~/.profile
if [ -f ~/.profile ]; then
  . ~/.profile
fi

# source configs
for f in ~/.config/dotfiles_cfg/*; do
  source "$f"
done
