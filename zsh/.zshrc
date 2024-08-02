# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export LANG=en_US.UTF-8
export ZSH="/home/eric/.oh-my-zsh"
export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/\.git/*' -not -path '*/node_modules/*'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--select-1 --exit-0 --reverse --preview '(cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--select-1 --exit-0 --reverse"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_OPTS="--select-1 --exit-0 --reverse"
# export FZF_BASE="/home/eric/.fzf"
# export FZF_DEFAULT_OPTS="--reverse --select-1 --exit-0 --inline-info"
# export FZF_CTRL_T_OPTS="--preview '(cat {} || tree -C {}) 2> /dev/null | head -n 200'"
# export FZF_CTRL_R_OPTS="--select-1 --exit-0 --reverse"
# export FZF_ALT_C_OPTS="--select-1 --exit-0 --reverse"

ZSH_THEME="ys"
COMPLETION_WAITING_DOTS="true"

ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste)
setopt HIST_IGNORE_ALL_DUPS

# expand alias with TAB, undo with Ctrl+_
zstyle ':completion:*' completer _expand_alias _complete _ignored

plugins=(
    fzf
    git
    z
    docker
    extract
	kubectl
)

source $ZSH/oh-my-zsh.sh

alias zshrc='vim ~/.zshrc'
alias zshreload='source ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias curlrc='vim ~/.curlrc'
alias gitconfig='git config --global --edit'
alias sshconfig='vim ~/.ssh/config'
alias tmuxconfig='vim ~/.tmux.conf'
alias i3config='vim ~/.config/i3/config'
alias i3reload='i3-msg reload'

alias gdc='git diff --cached'
alias gru='git remote update --prune'
alias gsu='git submodule update --recursive --init'
alias gro='git reset ORIG_HEAD'

alias ta='tmux a -t'
alias tl='tmux ls'

alias dcu='docker compose up -d'
alias dcd='docker compose down --volumes --remove-orphans'
alias dcr='docker compose down --volumes --remove-orphans && docker compose up -d'

alias chardiff='git diff --no-index --word-diff-regex=.'
alias ports='lsof -i -P -n'
alias tmp='cd $(mktemp -d -t $USER)'

alias code='open -b com.microsoft.VSCode "$@"'
alias c.='code .'
alias t='tree .'
alias htop="htop --user=$USER"

alias explorer="gio open 1>/dev/null 2>/dev/null"
alias trash="gio trash"
# git fzf
alias gadd="git status --short | fzf --multi --color=dark --cycle --border --ansi --preview-window=up:70% --preview=\"git diff --color {+2}\" | awk '{print \$2}'  | xargs git add"
alias gco="git diff --name-only | fzf --multi --color=dark --cycle --border --ansi --preview-window=up:70% --preview=\"git diff --color {+1}\" | xargs git checkout"
alias gustg="git diff --name-only --cached | fzf --multi --color=dark --cycle --border --ansi --preview-window=up:70% --preview=\"git diff --color --staged {+1}\" | xargs git reset HEAD"

# golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
# https://gist.github.com/MicahParks/1ba2b19c39d1e5fccc3e892837b10e21
export GONOPROXY=''
export GONOSUMDB=''
export GOPRIVATE=''

# rust
export PATH=$PATH:$HOME/.cargo/bin

func clone() {
	git clone $1
	cd $(echo $1 | grep -oE '/(.*).git$' | cut -c 2- | rev | cut -c 5- | rev)
}

func playground() {
	mkcd playground &&
	go mod init playground &&
	echo 'package main\n\nimport (\n\t"fmt"\n)\n\nfunc' \
		'main() {\n\tfmt.Println("hello world")\n}' > main.go
}

func coverage() {
	go test -coverprofile cover.out ./... &&
	go tool cover -html=cover.out -o cover.html &&
	open cover.html
}

