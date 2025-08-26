function pacls --description 'List available packages, with info shown in a preview window'
    pacman -Qq | fzf --multi --preview 'pacman -Qi {1}'
end
