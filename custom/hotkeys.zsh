__insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo __insert_sudo
bindkey "^k" insert-sudo
