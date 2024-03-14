if status is-interactive
    # Commands to run in interactive sessions can go here
    and not set -q TMUX
    and set -q SSH_TTY
    tmux attach-session -t ssh_tmux; or tmux new-session -s ssh_tmux
end
