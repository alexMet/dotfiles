function paci --description 'List available packages, with info shown in a preview window, and install selected ones'
    set -l packages (pacman -Slq | fzf --multi --preview 'pacman -Si {1}')

    for package in $packages
        sudo pacman -S $package
        if test $status -eq 0
            set -l description (pacman -Si $package | grep Description | cut -d ':' -f 2)
            echo "$package --$description" >> $MY_PACKAGES
        end
    end

    sort -u -o $MY_PACKAGES $MY_PACKAGES
end
