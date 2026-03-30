## Setup

### Install `fish`

```bash
# dnf install fish
```

### Install `tmux`

```bash
# dnf install tmux
```

### Install Neovim (Require Neovim 0.12.+: https://neovim.io/)

```bash
# dnf install neovim
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
