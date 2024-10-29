eval "$(ssh-agent -s)"
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias rerc='source ~/.bashrc'
alias docker='docker.exe'
alias s='cd -'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -l -a'
alias v='vim'
alias g='git'

export PATH="$PATH:~/mycommand"

export PS1="\e[0;32m[\w] \e[0m"

function syncfork() {
    local REMOTE_REPO="$(git remote get-url fork | sed 's/^[^:]*://' | sed 's/\.[^.]*$//')"
    local REMOTE_REPO_DEFAULT_BRANCH="$(gh repo view $REMOTE_REPO --json defaultBranchRef -q .defaultBranchRef.name)"
    gh repo sync $REMOTE_REPO -b $REMOTE_REPO_DEFAULT_BRANCH
}

function syncforkpull() {
    syncfork
    local REMOTE_REPO="$(git remote get-url fork | sed 's/^[^:]*://' | sed 's/\.[^.]*$//')"
    local REMOTE_REPO_DEFAULT_BRANCH="$(gh repo view $REMOTE_REPO --json defaultBranchRef -q .defaultBranchRef.name)"
    git switch $REMOTE_REPO_DEFAULT_BRANCH
    git pull fork $REMOTE_REPO_DEFAULT_BRANCH
    git switch -
}

