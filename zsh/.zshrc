# Download Znap, if it's not there yet.
[[ -f ~/.zsh-snap/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zsh-snap/zsh-snap

source ~/.zsh-snap/zsh-snap/znap.zsh  # Start Znap

# `znap source` automatically downloads and starts your plugins.
# znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source zsh-users/zsh-history-substring-search

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
export SAVEHIST=$HISTSIZE
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

[[ -f ~/.zshrc.temp ]] && source  ~/.zshrc.temp

if command -v "exa" >/dev/null 2>&1; then
    alias ls='exa --git --group-directories-first --color=always --time-style=long-iso'
    alias la='exa --git --group-directories-first --all --color=always --time-style=long-iso'
    alias ll='exa --git --group-directories-first --color=always --time-style=long-iso -l'
    alias lla='exa --git --group-directories-first --all --color=always --time-style=long-iso -l'
else
    alias ls='ls --color'
    alias la='ls --color -a'
    alias ll='ls --color -l'
    alias lla='ls --color -a -l'
fi

set -o emacs
# 判断函数 is_command_exist 返回值是否是0
if command -v "starship" >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi
