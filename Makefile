.ONESHELL:

CONFIG ?= $(HOME)/.config
DOCUMENTS ?= $(HOME)/Documents
DOTFILES ?= $(CURDIR)

.PHONY: help
help:
	echo "Under construction..."

# https://wiki.archlinux.org/title/Iwd
.PHONY: network
network:
	sudo systemctl enable --now iwd.service

# https://wiki.archlinux.org/title/OpenSSH
.PHONY: ssh
ssh:
	sudo systemctl enable --now sshd
	sudo ufw allow ssh
	mkdir -p $(HOME)/.ssh
	chmod 700 $(HOME)/.ssh
	chmod 400 $(HOME)/.ssh/id_rsa

# https://wiki.archlinux.org/title/Bluetooth
.PHONY: bluetooth
bluetooth:
	sudo systemctl enable --now bluetooth.service

# https://wiki.archlinux.org/title/Xorg
# https://wiki.archlinux.org/title/Xinit
# https://wiki.archlinux.org/title/Xcompmgr
.PHONY: xorg
xorg:
	chmod u+x "$(DOTFILES)/.xinitrc"
	ln -sf "$(DOTFILES)/.xinitrc" "$(HOME)/.xinitrc"

# https://wiki.archlinux.org/title/Window_manager
# https://wiki.archlinux.org/title/Dwm
# https://tools.suckless.org/dwm/
.PHONY: dwm
dwm:
	git clone https://git.suckless.org/dwm ../dwm/ || true
	cd ../dwm && make && sudo make install && make clean

# https://wiki.archlinux.org/title/St
# https://tools.suckless.org/st/
.PHONY: st
st:
	git clone https://git.suckless.org/st ../st/ || true
	cd ../st && make && sudo make install && make clean

# https://wiki.archlinux.org/title/Tmux
.PHONY: tmux
tmux:
	ln -sf "$(DOTFILES)/tmux/tmux.conf" "$(CONFIG)/.tmux.conf"

# https://tools.suckless.org/slstatus/
.PHONY: slstatus
slstatus:
	git clone https://git.suckless.org/slstatus ../slstatus/ || true
	cd ../slstatus && make && sudo make install && make clean

# https://wiki.archlinux.org/title/Desktop_notifications
# https://wiki.archlinux.org/title/Dunst
.PHONY: dunst
dunst:
	sudo pacman -S libnotify dunst

.PHONY: brave
brave:
	mkdir -p $(DOCUMENTS)
	cd $(DOCUMENTS)
	git clone https://aur.archlinux.org/brave-bin.git
	cd brave-bin/
	makepkg -sirc
	rm *.tar.* *.zip

PLUG_DIR := $(HOME)/.local/share/nvim/site/autoload
PLUG_VIM := $(PLUG_DIR)/plug.vim
PLUG_URL := https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# https://wiki.archlinux.org/title/Neovim
.PHONY: nvim
nvim:
	@if [ ! -f "$(PLUG_VIM)" ]; then
		echo "Downloading plug.vim...";
		mkdir -p "$(PLUG_DIR)";
		curl -fLo "$(PLUG_VIM)" "$(PLUG_URL)";
	else
		echo "plug.vim already exists, skipping download.";
	fi
	ln -sfn "$(DOTFILES)/nvim" "$(CONFIG)/nvim"
	nvim --headless "+PlugInstall --sync" +qall

# https://wiki.archlinux.org/title/Fish
# https://fishshell.com/
.PHONY: fish
fish:
	chsh -s /bin/fish
	ln -sfn "$(DOTFILES)/fish" "$(CONFIG)/fish"

# https://wiki.archlinux.org/title/RTorrent
.PHONY: torrent
torrent:
	ln -sf "$(DOTFILES)/rtorrent/.rtorrent.rc" "$(HOME)/.rtorrent.rc"

# https://wiki.archlinux.org/title/Podman
.PHONY: podman
podman:
	# sudo pacman -S podman podman-compose netavark aardvark-dns
	sysctl kernel.unprivileged_userns_clone
	sudo touch /etc/subuid /etc/subgid
	sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 "$(USER)"
	podman system migrate
	# TODO: Extend the following list with each alias you want to allow
	# cat /etc/containers/registries.conf.d/00-shortnames.conf

.PHONY: packages
packages:
	@MISSING=$$(for pkg in $$(grep -vE '^[[:space:]]*(#|$$)' "$(DOTFILES)/packages" | awk '{print $$1}'); do
		pacman -Qi "$$pkg" >/dev/null 2>&1 || echo "$$pkg"
	done)
	if [ -n "$$MISSING" ]; then
		sudo pacman -S $$MISSING
	else
		echo "Nothing to install."
	fi

SHELL_SCRIPTS := $(wildcard $(DOTFILES)/bin/*.sh)
INSTALLED_SCRIPTS := $(patsubst $(DOTFILES)/bin/%.sh, /usr/local/bin/%, $(SHELL_SCRIPTS))

.PHONY: scripts
scripts: $(INSTALLED_SCRIPTS)

/usr/local/bin/%: $(DOTFILES)/bin/%.sh
	sudo cp -f $< $@
	sudo chmod +x $@
