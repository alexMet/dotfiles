#!/bin/sh
#
# Perform installation of packages and setup of dotfiles.

CONFIG="$HOME/.config"
DOTFILES="$HOME/projects/dotfiles"

# --- Setup the network manager
# https://wiki.archlinux.org/title/NetworkManager
network_manager() {
	sudo pacman -S networkmanager
	sudo systemctl enable --now NetworkManager.service
}

# --- Setup bluetooth
# https://wiki.archlinux.org/title/Bluetooth
bluetooth() {
	sudo pacman -S bluez bluez-utils
	# TODO: Check if the module is imported
	sudo systemctl enable --now bluetooth.service
}

# --- Setup the display server
# https://wiki.archlinux.org/title/Xorg
# https://wiki.archlinux.org/title/Xinit
# https://wiki.archlinux.org/title/Xcompmgr
display_server() {
	sudo pacman -S xorg-server xorg-init xorg-xsetroot xcompmgr
	chmod u+x "$DOTFILES"/.xinitrc
	ln -s "$DOTFILES"/.xinitrc "$HOME"/.xinitrc
}

# --- Setup the window manager
# https://wiki.archlinux.org/title/Window_manager
# https://wiki.archlinux.org/title/Dwm
window_manager() {
	git clone https://git.suckless.org/dwm ../dwm/
	# TODO apply patches
	cd dwm && make && sudo make install && make clean
}

# --- Setup the terminal emulator
# --- And a terminal multiplexer
# https://wiki.archlinux.org/title/St
terminal() {
	git clone https://git.suckless.org/st ../st/
	# TODO apply patches
	cd st/ && make && sudo make install && make clean

    sudo pacman -S tmux
	ln -s "$DOTFILES"/nvim "$CONFIG"/.tmux.conf
}

# --- Setup the status monitor
# https://tools.suckless.org/slstatus/
status_monitor() {
	git clone https://git.suckless.org/slstatus ../slstatus/
	# TODO apply patches
	cd slstatus/ && make && make install && make clean
}

# --- Setup the cursor theme
# https://wiki.archlinux.org/title/Cursor_themes
cursor_theme() {
	# NOTE Should I download them separetly and symlink the index.theme from default?
	mkdir -p "$HOME"/.local/share/icons/default/
	curl -L https://github.com/rose-pine/cursor/releases/latest/download/BreezeX-RosePine-Linux.tar.xz \
		| tar -xvJ -C "$HOME"/.local/share/icons/default --strip-components=1
}

# --- Setup the desktop notifications
# https://wiki.archlinux.org/title/Desktop_notifications
# https://wiki.archlinux.org/title/Dunst
desktop_notifications() {
	sudo pacman -S libnotify dunst
	# TODO: link config
}

# --- Setup the text editor
# https://wiki.archlinux.org/title/Neovim
text_editor() {
    sudo pacman -S nvim
	ln -s "$DOTFILES"/nvim "$CONFIG"/nvim
}

# --- Setup the default shell
# https://wiki.archlinux.org/title/Fish
# https://fishshell.com/
shell() {
	chsh -s /bin/fish
	ln -s "$DOTFILES"/fish "$CONFIG"/fish
}

# --- Setup the torrent downloads
# https://wiki.archlinux.org/title/RTorrent
torrent() {
    sudo pacman -S rtorrent
	mkdir -p "$HOME"/rtorret
	mkdir -p "$HOME"/rtorret/watch
	mkdir -p "$HOME"/rtorret/downloads
	mkdir -p "$HOME"/rtorret/session
	ln -s "$DOTFILES"/rtorrent/.rtorrent.rc "$HOME"/.rtorrent.rc
}

# --- Setup the containers app
# https://wiki.archlinux.org/title/Podman
containers() {
	sudo pacman -S podman podman-compose netavark aardvark-dns
	sysctl kernel.unprivileged_userns_clone
	# Set for each user that wants to run rootless podman
	sudo touch /etc/subuid /etc/subgid
	sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 "$USER"
	podman system migrate
	# TODO: Extend the following list with each alias you want to allow
	# cat /etc/containers/registries.conf.d/00-shortnames.conf
}

# TODO: Add cases for each and for all
