# General Bash
alias l='ls -lhtr --group-directories-first'
alias la='l -A'

# Docker
alias docker-rm-all='docker rm $(docker ps -qa)'
alias drma='docker-rm-all'
alias docker-rm-exited='docker rm $(docker ps -q)'
alias drmx='docker-rm-exited'

alias docker-rmi-all='docker rmi $(docker images -qa)'
alias dria='docker-rmi-all'
