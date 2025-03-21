DOTFILES = $(HOME)/projects/dotfiles

# --- Packages

.PHONY: packages
packages:
	# --- Brave
	git pull https://aur.archlinux.org/brave-bin.git
	cd brave-bin/ && makepkg -sic

	# --- TODO Setup pyenv and pipx

	# --- TODO neovim
	ln -s $(DOTFILES)/nvim $(CONFIG)/nvim

	# --- TODO fish
	ln -s $(DOTFILES)/fish $(CONFIG)/fish

	# --- TODO rtorent
	mkdir -p $(HOME)/rtorret
	mkdir -p $(HOME)/rtorret/watch
	mkdir -p $(HOME)/rtorret/downloads
	mkdir -p $(HOME)/rtorret/session
	ln -s $(DOTFILES)/rtorrent/.rtorrent.rc $(HOME)/.rtorrent.rc

	# --- TODO podman
	sysctl kernel.unprivileged_userns_clone
	# Set for each user that wants to run rootless podman
	sudo touch /etc/subuid /etc/subgid
	sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 $(USER)
	podman system migrate
	# Extend the following list with each alias you want to allow
	# cat /etc/containers/registries.conf.d/00-shortnames.conf
