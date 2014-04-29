HISTSIZE=100000
SAVEHIST=100000

# Allow comments (#) en interactive prompt. Eg., to add stuff to history.
setopt interactivecomments

# Enable auto-correction
setopt correct_all

# Show CPU stats for commands taking longer than 10 seconds (once they finish)
REPORTTIME=10

# Not sure what "." is for in zsh, but make it sane again:
alias .='source'
