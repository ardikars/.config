## Setup

### Install `tmux`

```bash
# dnf install tmux
# dnf install gitmux
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

### Load Configuration and Set Environment Variables (Use a POSIX-compliant shell) 

```bash
# For dash, kash, or ash
# nvim ~/.profile
# Or bash
# nvim ~/.bash_profile
# Or zsh
# nvim ~/.zprofile
```

```sh
if [ -f "$HOME/.config/.profile" ]; then
  . "$HOME/.config/.profile"
fi
```

### LaTex

```bash
# dnf install latexmk zathura zathura-pdf-mupdf
# Or
# dnf install latexmk zathura zathura-pdf-poppler
```

### Classic Fortune + Cowsay + Lolcat 

```bash
# dnf install fortune 
# dnf install cowsay
# dnf install lolcat
```
