greeting() {
    # Check if fortune exists
    if command -v fortune > /dev/null 2>&1; then
        if command -v cowsay > /dev/null 2>&1; then
            
            # Define the list of cows
            set -- default tux kitty bud-frogs cower llama moose sus
            
            # date +%s is non-POSIX. We use date +%S (seconds 00-59)
            # which is mandated by POSIX, to ensure it works on all systems.
            _seed=$(date +%S)
            
            # We add 0 to ensure it's treated as a decimal number
            _idx=$(( (10#$_seed) % $# ))
            
            # Shifting by 0 is an error in some strict POSIX shells.
            if [ "$_idx" -gt 0 ]; then
                shift "$_idx"
            fi
            _random_cow="$1"

            if command -v lolcat >/dev/null 2>&1; then
                fortune -s | cowsay -f "$_random_cow" | lolcat
            else
                fortune -s | cowsay -f "$_random_cow"
            fi
        else
            fortune
        fi
    fi
}

if command -v tmux > /dev/null 2>&1 && [ -n "$PS1" ] && \
   ! echo "$TERM" | grep "tmux" > /dev/null 2>&1 && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

# Environment Setup
umask 022
export LANG=C.UTF-8
export EDITOR="nvim"
export VISUAL="nvim"

[ -z "$PAGER" ] && export PAGER="less"

export PATH="$PATH:$HOME/.local/bin"

greeting
