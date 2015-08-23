source ~/.profile

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
export JAVA_OPTS="-Xmx2g -Djava.security.egd=file:/dev/./urandom"
export GRADLE_OPTS="-Dorg.gradle.daemon=true"
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled"

export PATH=/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:$HOME/.rvm/bin:$PATH

alias ls="ls -G"
alias ll="ls -lh"

if [ -f ~/.bashrc.after ]; then
  source ~/.bashrc.after
fi
