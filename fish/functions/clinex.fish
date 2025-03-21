function clinex --description 'Clean up system'
	echo "==> Cleaning container stuff..."
	podman system prune -f

	echo "==> Cleaning pacman cache..."
	du -sh /var/cache/pacman/pkg/
	sudo pacman -Scc

	echo "==> Listing unused packages..."
	pacman -Qtdq

	echo "==> Cleaning home folder cache..."
	du -sh ~/.cache/
	rm -rf ~/.cache/*
	
    echo "==> Cleaning old logs from journal..."
	du -sh /var/log/journal/
	sudo journalctl --vacuum-size=50M

    # TODO: Find a way to do this safely
	# echo "==> Cleaning old config files..."
	# ls -lah ~/.local/share/
	# ls -lah ~/.config/

    # TODO: Find all git folders and clean them
    # git branch --merged master | grep -v "master" | xargs git branch -d && git fetch --prune && git clean -f -d && git gc --prune=now --aggressive
end
