## Setup

### Install `tmux`

```bash
# dnf install tmux
```

### Install Neovim (Latest version)

```bash
# nvim/install.sh
```
```bash
# For system clipboard supports
# dnf install wl-clipboard
# Or
# dnf install xclip
```

### Use `tmux` for every new terminal session

```bash
# nvim ~/.profile
```

```sh
if [ -f "$HOME/.config/.profile" ]; then
  . "$HOME/.config/.profile"
fi
```

### Latex

```bash
# dnf install latexmk zathura zathura-pdf-mupdf
# Or
# dnf install latexmk zathura zathura-pdf-poppler
```

### Classic fortune + cowsay + lolcat 

```bash
# dnf install fortune 
# dnf install cowsay
# dnf install lolcat
```
