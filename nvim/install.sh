#!/bin/sh

OS="$(uname -s)"
ARCH="$(uname -m)"

# Normalize OS
case "$OS" in
  Linux*)  OS="linux" ;;
  Darwin*) OS="macos" ;;
  *)
		echo "Operating system is not supported. Exiting..."
    exit 1
		;;
esac

# Normalize ARCH
case "$ARCH" in
  x86_64|amd64) ARCH="x86_64" ;;
  arm64|aarch64) ARCH="arm64" ;;
  *)
		echo "CPU Architecture is not supported. Exiting..."
    exit 1
		;;
esac

DIST="nvim-$OS-$ARCH"
FILE="$DIST.tar.gz"

if [[ -d "$DIST" ]]; then
	echo "Deleting existing distibution.."
	rm -rf "$DIST"
fi

LATEST_TAG=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep tag_name | cut -d '"' -f 4)
echo "Downloading Neovim - $LATEST_TAG .."
curl -L --progress-bar "https://github.com/neovim/neovim/releases/download/$LATEST_TAG/$FILE" | tar xz 
echo "Download finished."

if [[ -d "$DIST" ]]; then
	if [[ -f "~/.local/bin/nvim" ||  -d "~/.local/lib/nvim/parser" || -d "~/.local/share/nvim/runtime" ]]; then
		echo "Uninstalling existing Neovim.."
		rm ~/.local/bin/nvim
		rm -rf ~/.local/lib/nvim/parser/
		rm -rf ~/.local/share/nvim/runtime/
	fi

	## Setup installation directories 
	mkdir -p ~/.local/lib/nvim/parser/
	mkdir -p ~/.local/share/nvim/runtime/

	echo "Installing latest version of Neovim .."
	cd $DIST
	cp bin/nvim ~/.local/bin/nvim
	cp -rf lib/nvim/parser/ ~/.local/lib/nvim/parser/
	cp -rf share/nvim/runtime/ ~/.local/share/nvim/runtime/

	## Cleanup
	cd ../
	rm -rf $DIST
	echo "Installed."
fi
