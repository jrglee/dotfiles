[ -f ~/.profile ] && source ~/.profile

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
  source "$(brew --prefix bash-git-prompt)/share/prompt-colors.sh"
  GIT_PROMPT_THEME=Custom
  GIT_PROMPT_FETCH_REMOTE_STATUS=0
  GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_ ${White}\$(date +%H:%M) ${BoldYellow}\w${ResetColor}"
  GIT_PROMPT_START_ROOT="${GIT_PROMPT_START_USER}"
  GIT_PROMPT_END_USER=" ${BoldWhite}\$${ResetColor} "
  GIT_PROMPT_END_ROOT="${GIT_PROMPT_END_USER}"
  GIT_PROMPT_BRANCH="${BrightMagenta}"
  GIT_PROMPT_CHANGED="${BrightBlue}✚ "
  GIT_PROMPT_STASHED="${BoldCyan}⚑ "
fi

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export GREP_OPTIONS='--color=auto'
export CLICOLOR=1

export HISTCONTROL=ignoredups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend

export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_OPTS="-Xmx2g -Djava.security.egd=file:/dev/./urandom"
export GRADLE_OPTS="-Dorg.gradle.daemon=true"
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled"

export PATH=/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:$HOME/.rvm/bin:$PATH

alias ls="ls -G"
alias ll="ls -lh"

if [ -f ~/.bashrc.after ]; then
  source ~/.bashrc.after
fi
. "$HOME/.cargo/env"
