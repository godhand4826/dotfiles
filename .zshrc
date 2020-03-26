# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/home/eric/.oh-my-zsh"
export FZF_BASE="/home/eric/.fzf"
export FZF_DEFAULT_OPTS="--reverse --select-1 --exit-0 --inline-info"
export FZF_CTRL_T_OPTS="--preview '(cat {} || tree -C {}) 2> /dev/null | head -n 200'"
export FZF_CTRL_R_OPTS="--select-1 --exit-0 --reverse"
export FZF_ALT_C_OPTS="--select-1 --exit-0 --reverse"
export EDITOR="vim"

ZSH_THEME="ys"
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
setopt HIST_FIND_NO_DUPS

ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste)

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
    fzf
    z
    sudo
    command-not-found
    docker
    extract
    screen
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias zshrc="$EDITOR ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias vimrc="$EDITOR ~/.vimrc"
alias i3config="$EDITOR ~/.config/i3/config"
alias i3reload="i3-msg reload"
alias explorer="gio open 1>/dev/null 2>/dev/null"
alias trash="gio trash"
alias clip="xclip -sel clip"
alias chardiff="git diff --no-index --word-diff-regex=."
# git fzf
alias gadd="git status --short | fzf --multi --color=dark --cycle --border --ansi --preview-window=up:70% --preview=\"git diff --color {+2}\" | awk '{print \$2}'  | xargs git add"
alias gco="git diff --name-only | fzf --multi --color=dark --cycle --border --ansi --preview-window=up:70% --preview=\"git diff --color {+1}\" | xargs git checkout"
alias gustg="git diff --name-only --cached | fzf --multi --color=dark --cycle --border --ansi --preview-window=up:70% --preview="git diff --color --staged {+1}" | xargs git reset HEAD"
export PATH=$PATH:$HOME/.cargo/bin
