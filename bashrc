__git_ps1 () {
	local b="$(git symbolic-ref HEAD 2>/dev/null)";
	if [ -n "$b" ]; then
		printf " (%s)" "${b##refs/heads/}";
	fi
}

source ~/.profile

export PS1="\[$(tput bold)\]\[$(tput setaf 3)\][\[$(tput setaf 6)\]\u\[$(tput setaf 1)\]@\[$(tput setaf 5)\]\h\[$(tput setaf 3)\]]\[$(tput setaf 2)\]:\[$(tput setaf 4)\]\W\[$(tput setaf 2)\]\$(__git_ps1)\[$(tput setaf 7)\] $ \[$(tput sgr0)\]"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	source $(brew --prefix)/etc/bash_completion
fi

if [ -f $(brew --prefix)/bin/boot2docker ]; then
  eval $(boot2docker shellinit)
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

alias "set-java7"="export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)"
alias "set-java8"="export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)"
alias ls="ls -G"
alias ll="ls -lh"
