set --export MY_PACKAGES ~/projects/dotfiles/packages
set --export EDITOR nvim

# locale
set --export LANG en_US.UTF-8
set --export LC_MESSAGES "C"

# search
fzf --fish | source
set --export FZF_DEFAULT_OPTS "--height 40% --layout reverse --border"
set --export FZF_DEFAULT_COMMAND "rg --files --follow --smart-case"
set --export FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# theme
fish_config theme choose "Rosé Pine"
