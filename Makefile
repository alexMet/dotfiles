.DEFAULT: install

INSTALL_CMD = sudo pacman -S
DOTFILES = $(HOME)/projects/dotfiles

.PHONY: install
install: vim python search fish rtorrent podman

# --- Install packages

.PHONY: python
python:
	# TODO Setup pyenv and pipx
	$(INSTALL_CMD) $@ pip

.PHONY: search
search:
	$(INSTALL_CMD) zfz ripgrep

.PHONY: vim
vim:
	$(INSTALL_CMD) $@ neovim xclip
	ln -s $(DOTFILES)/nvim $(CONFIG)/nvim

.PHONY: fish
fish:
	$(INSTALL_CMD) $@
	ln -s $(DOTFILES)/fish $(CONFIG)/fish

.PHONY: rtorrent
rtorrent:
	$(INSTALL_CMD) $@
	mkdir -p $(HOME)/rtorret
	mkdir -p $(HOME)/rtorret/watch
	mkdir -p $(HOME)/rtorret/downloads
	mkdir -p $(HOME)/rtorret/session
	ln -s $(DOTFILES)/rtorrent.rc $(HOME)/rtorrent.rc

.PHONY: podman
podman:
	$(INSTALL_CMD) $@ podman-compose aardvark-dns
	sysctl kernel.unprivileged_userns_clone
	# Set for each user that wants to run rootless podman
	sudo touch /etc/subuid /etc/subgid
	sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 $(USER)
	podman system migrate
	# Extend the following list with each alias you want to allow
	# cat /etc/containers/registries.conf.d/00-shortnames.conf

# --- System

.PHONY: update
update:
	sudo pacman -Syu

.PHONY: clean
clean:
	# Clean the pacman cache
	du -sh /var/cache/pacman/pkg/
	sudo pacman -Scc
	# Remove unused packages
	sudo pacman -Qtdq
	# Clean the home foler cache
	du -sh ~/.cache/
	rm -rf ~/.cache/*
	# Clean the old logs from journal
	du -sh /var/log/journal/
	sudo journalctl --vacuum-size=50M
	# Clean the old config files
	# ls -lah ~/.local/share/
	# ls -lah ~/.config/
