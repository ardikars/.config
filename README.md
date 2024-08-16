## Setup

### Install `fish`

```bash
# dnf install fish
```

### Install `tmux`

```bash
# dnf install tmux
```

### Install Neovim

```bash
# dnf install neovim
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

### Install Vim-Plug

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

