DOTFILES = $(HOME)/projects/dotfiles

.PHONY: packages
packages:
	# --- TODO networking
	# https://wiki.archlinux.org/title/NetworkManager
	sudo systemctl enable --now NetworkManager.service

	# --- TODO ly
	# https://wiki.archlinux.org/title/Display_manager
	sudo systemctl enable --now ly.service

	# --- TODO dwm
	# https://wiki.archlinux.org/title/Xorg
	# https://wiki.archlinux.org/title/Xcompmgr
	# https://wiki.archlinux.org/title/Window_manager
	# https://wiki.archlinux.org/title/Dwm
	git clone https://git.suckless.org/dwm ../dwm/
	# TODO apply patches
	cd dwm && make && sudo make install && make clean
	# mkdir /usr/share/xsessions/
	# cp dwm.desktop /usr/share/xsessions/
	# chown root root /usr/share/xsessions/dwm.desktop
	chmod u+x $(DOTFILES)/.xinitrc
	ln -s $(DOTFILES)/.xinitrc .xinitrc
	
	# --- TODO st
	git clone https://git.suckless.org/st ../st/
	# TODO apply patches
	cd st/ && make && sudo make install && make clean

	# --- TODO slstatus
	git clone https://git.suckless.org/slstatus ../slstatus/
	# TODO apply patches
	cd slstatus/ && make && make install && make clean

	# --- TODO cursors
	# https://wiki.archlinux.org/title/Cursor_themes
	# NOTE Should I download them separetly and symlink the index.theme from default?
	mkdir -p $HOME/.local/share/icons/default/
	curl -L https://github.com/rose-pine/cursor/releases/latest/download/BreezeX-RosePine-Linux.tar.xz | tar -xvJ -C $(HOME)/.local/share/icons/default --strip-components=1

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
