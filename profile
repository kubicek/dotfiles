# ======================================
# Bash profile, reload with `. .profile`
# ======================================

# Common bin paths
# ----------------
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/opt/local/lib/ruby/gems/1.8/gems/bin/:$PATH"

# Custom prompt
# -------------
export PS1="\n\[\e]2;\u@\H:\W\a\[\e[0;30;1m\]\w\[\e[0m\] \$(parse_git_branch) \n$ \H \[\e[31;1m\]| \[\e[0m\]"

# Vim/Emacs key syntax for bash
# -----------------------------
# set -o vi
set -o emacs

# History settings
# ----------------
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# Settings
# --------
unset MAILCHECK

# Custom aliases
# --------------
alias q='exit'
alias ll='ls -lah'
alias rd='rm -rdf'

# Git aliases
# -----------
alias s="git s"
alias l="git l"
alias b="git branch"
alias giff="git diff"

alias pick="git cherry-pick"
alias m="git checkout master"
alias d="git checkout deploy"
alias f="git checkout fixes"

# Add color and default options to grep
# -------------------------------------
alias grep='GREP_OPTIONS="--color=auto --ignore-case --line-number --context=0 --exclude=*.log" GREP_COLOR="1;37;41" LANG=C grep'

# Add git branch info to prompt
parse_git_branch() {
	git status --short --branch 2> /dev/null | head -1 | sed -e 's/## \(.*\)/(\1)/'
}

# Tricks
# ------
# Open new shells in most recently visited dir (http://gist.github.com/132456)
#
pathed_cd () {
  if [ "$1" == "" ]; then
    builtin cd
  else
    builtin cd "$1"
  fi
  pwd > ~/.cdpath
}
alias cd="pathed_cd"
if [ -f ~/.cdpath ]; then
  cd $(cat ~/.cdpath)
fi

# RVM support
[[ -s "/Users/kubicek/.rvm/scripts/rvm" ]] && source "/Users/kubicek/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# use .profile.local for setting machine-specific options
[[ -f ~/.profile.local ]] && .  ~/.profile.local
