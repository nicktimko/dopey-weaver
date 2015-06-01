# General Bash
alias ls='ls --color=auto --file-type'
alias l='ls -lhtr --group-directories-first'
alias la='l -A'

# Docker
alias d='docker'
alias dc='docker-compose'

alias docker-rm-all='docker rm $(docker ps -qa)'
alias drma='docker-rm-all'
alias docker-rm-exited='docker ps -a | grep Exit | cut -d '\'' '\'' -f 1 | xargs sudo docker rm'
alias drmx='docker-rm-exited'

alias docker-rmi-all='docker rmi $(docker images -qa)'
alias dria='docker-rmi-all'
