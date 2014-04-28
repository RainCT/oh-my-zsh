# Always use pager for "svn diff" and "svn log" output
[ `which tput` -a `tput colors` -ge 8 ] && function svn() {
  [ $PAGER != "" ] || PAGER="less -R"
  case $* in
    diff*) shift 1; command svn diff $@ | colordiff | $PAGER ;;
    log*)  shift 1; command svn log $@ | $PAGER ;;
    *)     command svn "$@" ;;
  esac
}

function ss()
{
    git status >/dev/null 2>&1
    if [ $? -eq 128 ]
    then
        svn status $*
    else
        git status $*
    fi
}

function sd()
{
    git status >/dev/null 2>&1
    if [ $? -eq 128 ]
    then
        svn diff $*
    else
        git diff $*
    fi
}
