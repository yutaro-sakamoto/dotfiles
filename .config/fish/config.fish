if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    set_color green
    echo -n (prompt_pwd)
    set_color normal
    fish_git_prompt
    echo ' $ '
end

function syncfork
    set REMOTE_REPO (git remote get-url fork | sed 's/^[^:]*://' | sed 's/\.[^.]*$//')
    set REMOTE_REPO_DEFAULT_BRANCH (gh repo view $REMOTE_REPO --json defaultBranchRef -q .defaultBranchRef.name)
    gh repo sync $REMOTE_REPO -b $REMOTE_REPO_DEFAULT_BRANCH
end

function syncforkpull
    syncfork
    set REMOTE_REPO (git remote get-url fork | sed 's/^[^:]*://' | sed 's/\.[^.]*$//')
    set REMOTE_REPO_DEFAULT_BRANCH (gh repo view $REMOTE_REPO --json defaultBranchRef -q .defaultBranchRef.name)
    git switch $REMOTE_REPO_DEFAULT_BRANCH
    git pull fork $REMOTE_REPO_DEFAULT_BRANCH
    git switch -
end

function gpsu
    git push $argv[1] (g branch --contains | cut -d " " -f 2) --set-upstream
end

fish_ssh_agent

alias fishrc='vim ~/.config/fish/config.fish'
alias rerc='source ~/.config/fish/config.fish'
alias vimrc='vim ~/.vimrc'
alias docker='docker.exe'
alias rerc='source ~/.config/fish/config.fish'
alias retm='tmux source-file ~/.tmux.conf'
alias s='cd -'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -l -a'
alias v='vim'
alias g='git'
alias c='cargo'
alias p='python3'
alias nr='npm run'
alias mkctags='ctags -R -f .tags'
alias batj='bat -l json'
alias baty='bat -l yaml'
