set --export MY_PACKAGES ~/projects/dotfiles/packages
set --export EDITOR nvim

# locale
set --export LANG en_US.UTF-8
set --export LC_MESSAGES "C"

# nnn
set --export NNN_FIFO /tmp/nnn.info
set --export NNN_PLUG "p:preview"

# search
fzf --fish | source
set --export FZF_DEFAULT_OPTS "
    --height 40%
    --layout reverse
    --border
    --color=fg:#908caa,bg:#232136,hl:#ea9a97
	--color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
	--color=border:#44415a,header:#3e8fb0,gutter:#232136
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
set --export FZF_DEFAULT_COMMAND "rg --files --follow --smart-case"
set --export FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# theme
fish_config theme choose "Rosé Pine"

# start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

