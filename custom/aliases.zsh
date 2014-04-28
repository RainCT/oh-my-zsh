# Execute a command independent from the current terminal
ex() {
  nohup "$@" >/dev/null 2>&1 <&1 & disown %%
}

# Open file with default application (GNOME)
alias go='xdg-open'

# Reload shell configuration
alias u=". ~/.zshrc"

# Alias for case-insensitive grep (rgrep for -r already exists by default)
alias igrep='grep -i'

# More aliases for finding stuff
alias a='ack-grep'
alias f='find | grep -v "\.svn" | grep -v "\.git"'

# Global aliases
alias -g A='| ack-grep'

# Terminal goodies
alias x='xclip -in'
alias colorless='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"'

# Kill the most recently started process.
alias kk='kill %%'
alias kkk='kill -9 %%'

# Kill any process that matches a regex
killit() {
  ps aux | grep -v "grep" | grep "$@" | awk '{print $2}' | xargs sudo kill
}

# Pipe to vim
alias v='vim -R -'

# Python
alias py='ipython --no-confirm-exit --pylab'
alias pycclean='find . -name "*.pyc" -exec rm {} \;'

# Debian (user)
alias apts="apt-cache search"
alias apti="sudo apt-get install"
alias dpkg-build='dpkg-buildpackage'
alias svn-buildpackage="svn-buildpackage --svn-ignore"
alias get-ppa-key='sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com'
alias apt-break-lock='sudo rm -f /var/lib/dpkg/lock; sudo rm -f /var/lock/aptitude; sudo rm -f /var/cache/apt/archives/lock'

# Debian (packaging)
alias cowbuilder-sid='cowbuilder-dist sid'
alias requestsync="requestsync --lp"
alias caff="caff -m yes"

# Other
alias sound-settings="sudo gnome-control-center sound"

# Random aliases
alias ed='vim'
alias sqlite='sqlite3'

lsgrep() {
  ls -l | grep -i "`echo $@`"
}

psgrep() {
  ps xa | grep -i "`echo $@`" | grep -v grep | sed 's/^ *//g'
}

# Enter directory, creating it first if needed
getdir() {
  if [ ! $1 ]; then
    echo "Usage: getdir "
  else
    if [ ! -e $1 ]; then mkdir -p $1; fi
    cd $1
  fi
}

getsrc() {
  if [ ! $1 ]; then
    echo "Usage: getsrc <source package>"
  else
    getdir $1
    apt-get source $1
  fi
}

############ COMMON TYPOS #################################

alias sl='ls'
alias gerp='grep'
alias grpe='grep'
alias ack-gerp='ack-grep'
alias ack-grpe='ack-grep'

alias rosndoe='rosnode'
alias rosnide='rosnode'
alias rosnoide='rosnode'

############ ROS ##########################################

if [[ "x$ENABLE_ROS_ALIASES" == "xtrue" ]]; then
  # Show ROS' graphical log console
  alias log='ex rxconsole'

  # Show or change $ROS_MASTER_URI
  uri() {
    if [[ $# < 1 ]]
    then
      echo $ROS_MASTER_URI
    else
      export ROS_MASTER_URI=http://$1:11311
    fi
  }

  alias rosmake='ROS_PARALLEL_JOBS=-j4 nice rosmake'
  alias rosmakep='rosmake --pjobs=4 --threads=4'
fi

############ WRAPPERS #####################################

# Start stuff in the background
alias gedit='ex gedit'
alias geany='ex geany'
if (( $+commands[nemo] )); then
  alias nemo='ex nemo'
  alias nautilus='nemo'
else
  alias nautilus='ex nautilus'
  alias nemo='nautilus'
fi

alias lisp='rlwrap lisp'
alias perl='rlwrap perl'
alias sh='rlwrap sh'
alias dash='rlwrap dash'
alias clisp='rlwrap clisp' # Lisp
alias php='rlwrap php'

# Don't SPAM
alias R='R --quiet'
alias octave='octave --quiet'

# Nice output
alias du='du -h'
alias df='df -h'
