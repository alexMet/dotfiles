CONFIG ?= $(HOME)/.config
DOTFILES ?= $(HOME)/projects/dotfiles
SHELL_SCRIPTS := $(wildcard $(DOTFILES)/bin/*.sh)
INSTALLED_SCRIPTS := $(patsubst $(DOTFILES)/bin/%.sh, /usr/local/bin/%, $(SHELL_SCRIPTS))

.PHONY: all network_manager bluetooth display_server window_manager terminal status_monitor cursor_theme desktop_notifications text_editor shell torrent containers

# all: network_manager bluetooth display_server window_manager terminal status_monitor cursor_theme desktop_notifications text_editor shell torrent containers
help:
	echo "Under construction..."

network_manager:
	sudo pacman -S networkmanager
	sudo systemctl enable --now NetworkManager.service

bluetooth:
	sudo pacman -S bluez bluez-utils
	sudo systemctl enable --now bluetooth.service

display_server:
	sudo pacman -S xorg-server xorg-init xorg-xsetroot xcompmgr
	chmod u+x "$(DOTFILES)/.xinitrc"
	ln -sf "$(DOTFILES)/.xinitrc" "$(HOME)/.xinitrc"

window_manager:
	git clone https://git.suckless.org/dwm ../dwm/ || true
	cd ../dwm && make && sudo make install && make clean

terminal:
	git clone https://git.suckless.org/st ../st/ || true
	cd ../st && make && sudo make install && make clean
	sudo pacman -S tmux
	ln -sf "$(DOTFILES)/nvim" "$(CONFIG)/.tmux.conf"

status_monitor:
	git clone https://git.suckless.org/slstatus ../slstatus/ || true
	cd ../slstatus && make && sudo make install && make clean

cursor_theme:
	mkdir -p "$(HOME)/.local/share/icons/default/"
	curl -L https://github.com/rose-pine/cursor/releases/latest/download/BreezeX-RosePine-Linux.tar.xz \
		| tar -xvJ -C "$(HOME)/.local/share/icons/default" --strip-components=1

desktop_notifications:
	sudo pacman -S libnotify dunst

text_editor:
	sudo pacman -S nvim
	ln -sf "$(DOTFILES)/nvim" "$(CONFIG)/nvim"

shell:
	chsh -s /bin/fish
	ln -sf "$(DOTFILES)/fish" "$(CONFIG)/fish"

torrent:
	sudo pacman -S rtorrent
	ln -sf "$(DOTFILES)/rtorrent/.rtorrent.rc" "$(HOME)/.rtorrent.rc"

containers:
	sudo pacman -S podman podman-compose netavark aardvark-dns
	sysctl kernel.unprivileged_userns_clone
	sudo touch /etc/subuid /etc/subgid
	sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 "$(USER)"
	podman system migrate

scripts: $(INSTALLED_SCRIPTS)

/usr/local/bin/%: $(DOTFILES)/bin/%.sh
	cp -f $< $@
	chmod +x $@
