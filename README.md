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
# nvim /etc/profile.d/terminal.sh
```

```text
if command -v tmux > /dev/null 2>&1 && [ -n "$PS1" ] && \
   ! echo "$TERM" | grep -q "tmux" && [ -z "$TMUX" ]; then
  tmux attach -t default || tmux new -s default
fi
```

### Latex

```bash
# dnf install latexmk zathura zathura-pdf-mupdf
# Or
# dnf install latexmk zathura zathura-pdf-poppler
```

### Let terminal speak to you!

```bash
# dnf install fortune 
# dnf install cowsay
# dnf install lolcat
```
