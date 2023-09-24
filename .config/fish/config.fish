if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    set_color green
    printf '%s' $PWD
    set_color normal
    fish_git_prompt
    echo ' $ '
end

fish_ssh_agent

alias fishrc='vim ~/.config/fish/config.fish'
alias rerc='source ~/.config/fish/config.fish'
alias vimrc='vim ~/.vimrc'
alias docker='docker.exe'
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
