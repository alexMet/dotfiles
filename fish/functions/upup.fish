function upup --description 'Update system packages'
    function update_if_needed
        # Check if the local branch is behind the remote
        git fetch origin master
        set behind (git rev-list --count HEAD..origin/master)

        if test $behind -gt 0
            echo "==> Updates found: $behind commits behind."
            git pull origin master
            makepkg -sirc
            rm *.zip *.zst*
        else
            echo "==> Already up to date."
        end
    end

    echo "==> Updating brave..."
    pushd .
    cd ~/Documents/brave-bin/
    update_if_needed
    popd

    echo "==> Updating openvpn3..."
    pushd .
    cd ~/Documents/openvpn3/
    update_if_needed
    popd

    # NOTE: https://wiki.archlinux.org/title/Reflector
    echo "==> Updating mirrorlist..."
    sudo reflector --country Greece,France,Germany --latest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
    echo "==> Updating system packages..."
    sudo pacman -Syu

    # NOTE: https://wiki.archlinux.org/title/Pacman/Pacnew_and_Pacsave
    # Check the diff manually and merge the changes with the old config
    # diff /etc/pacman.conf /etc/pacman.conf.pacnew
    echo "==> Checking for new config files..."
    sudo find /etc -name '*.pacnew' -o -name '*.pacsave'
end
