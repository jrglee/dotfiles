source ~/.profile

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Single_line
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

if [ -f $(brew --prefix)/bin/boot2docker ]; then
  eval $(boot2docker shellinit 2>/dev/null)
fi

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export GREP_OPTIONS='--color=auto'
export HISTCONTROL=ignoredups
export CLICOLOR=1

export ANDROID_SDK_ROOT=/usr/local/opt/android-sdk
export ANDROID_HOME=/usr/local/opt/android-sdk

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export JAVA_OPTS="-Xmx2g"
export SBT_OPTS="-XX:MaxPermSize=2g -XX:+CMSClassUnloadingEnabled"

export PATH=/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:$HOME/.rvm/bin:$PATH

alias ls="ls -G"
alias ll="ls -lh"
