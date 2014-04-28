# vim:ft=zsh ts=2 sw=2 sts=2

# Smiley indicating exit code of last command
#local last_command="%(?,%F{green}☺%f,%F{red}☹%f)"

PROMPT='
%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} ⌚ %{$fg_bold[red]%}%*%{$reset_color%}
$ '

RPROMPT='$(git_prompt_info)'

# Configuration for git_prompt_info:
ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%}◒ "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
