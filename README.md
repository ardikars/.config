## Setup

### Install `fish`

```bash
# dnf install fish
```

### Install `tmux`

```bash
# dnf install tmux
```

### Install Neovim (Latest version)

```bash
# nvim/instal.sh
```
```bash
# For system clipboard supports
# dnf install wl-clipboard
# Or
# dnf install xclip
```

### Use `tmux` for every new terminal session

```bash
# nvim ~/.bashrc
```

```text
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
```

### Latex

```bash
sudo dnf install latexmk zathura zathura-pdf-mupdf
# Or
sudo dnf install latexmk zathura zathura-pdf-poppler
```

