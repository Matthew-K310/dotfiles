set -o vi

source ~/.zprofile

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors

# cmp opts
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' file-list true # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# history opts
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# load zoxide
eval "$(zoxide init zsh)"

# fzf setup
source <(fzf --zsh) # allow for fzf history widget

# better tab completion
source $HOME/.config/zsh/plugins/fzf-tab/fzf-tab.zsh

# autosuggestions
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias ls='ls --color'
alias cat='bat'
alias v='nvim'
alias c='clear'
# alias ff='fzf --height=40% --layout=reverse --preview-window=right'
alias ff="fd --type f | fzf | sed 's/\ /\\\ /g' | xargs nvim"
alias usage='python systemusage.py'
alias vault='cd ~/obsidian-vault'
alias dev='cd ~/dev'
alias info='fastfetch'
alias music='spotify_player'
alias astroterm='astroterm --color --constellations --speed 1000 --fps 60 --city Dallas'

# Shell integrations
eval "$(pyenv init --path)"
# eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/ompconfig.toml)"

# set up prompt
NEWLINE=$'\n'
# PROMPT="${NEWLINE}%K{#2E3440}%F{#E5E9F0}$(date +%_I:%M%P) %K{#3b4252}%F{#ECEFF4} %n %K{#4c566a} %~ %f%k ❯ " # nord theme
# PROMPT="${NEWLINE}%K{#32302f}%F{#d5c4a1} $0 %K{#3c3836}%F{#d5c4a1} %n %K{#504945} %~ %f%k ❯ " # warmer theme
PROMPT="${NEWLINE}%K{#1c1c1c}%F{#C8BCAC} $0 %K{#262626}%F{#d0d0d0} %n %K{#1c1c1c}%F{#88AFAF} %~ %f%k%F{#d75f5f} ❯ %f" # black metal gorgoroth theme

# tmux session startup
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t default || tmux new-session -s default
fi

# move to current directory on Yazi close
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

