# Download Znap, if it's not there yet.
[[ -f ~/.zsh-snap/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zsh-snap/zsh-snap

source ~/.zsh-snap/zsh-snap/znap.zsh  # Start Znap

# `znap source` automatically downloads and starts your plugins.
# znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting





if command -v "exa" >/dev/null 2>&1; then
    alias ls='exa --git --group-directories-first --color=always --time-style=long-iso'
    alias la='exa --git --group-directories-first --all --color=always --time-style=long-iso'
    alias ll='exa --git --group-directories-first --color=always --time-style=long-iso -l'
    alias lla='exa --git --group-directories-first --all --color=always --time-style=long-iso -l'
fi

set -o emacs
# 判断函数 is_command_exist 返回值是否是0
if command -v "starship" >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi
