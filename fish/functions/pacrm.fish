function pacrm --description 'List all your installed packages, and then remove selected packages'
    set -l packages (pacman -Qq | fzf --multi --preview 'pacman -Qi {1}')

    for package in $packages
        sudo pacman -Rns $package
        if test $status -eq 0
            sed -i "/$package --/d" $MY_PACKAGES
        end
    end
end
