#!/bin/zsh

#some zsh related stuff
HISTSIZE=1000
HISTFILE=~/.zsh_history
SAVEHIST=1000
setopt append_history
setopt inc_append_history
#setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_no_store
setopt hist_no_functions
setopt no_hist_beep
setopt hist_save_no_dups


pathmerge()
{
	

	new_path="$1"
	option="$2"

	#echo "Pathmerge [$option] for [$new_path]. Current path is [$PATH]"

	if [ "$option" = "before" ]
	then 
		export PATH="$new_path:$PATH"
	else
		export PATH="$PATH:$new_path"
	fi

	#echo "New path is [$PATH]"
}

zshrc()
{
	vim ~/.zshrc
	. ~/.zshrc
}

pathmerge ~/work/branches/misc/users/alok/bin

#source /sw/bin/init.sh

#Public functions
export zshrc

# Basics
export PS1="[%1d]$ "

#Application roots
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home/"
#export CATALINA_HOME="/opt/tomcat/"
export APACHE_DOC_ROOT="/Library/WebServer/Documents"
export MYSQL_HOME="/usr/local/mysql"
#export M2_HOME="/opt/maven"
export ARTIFACTORY_HOME="/opt/artifactory"
export SVN_EDITOR=vim
export MAVEN_OPTIONS="-DskipTests"

export BOOST_ROOT='/act/boost/boost_1_42_0'
export branch="bhim"
export SRC_ROOT="~/work/branches/dev-branches/$branch/code/trunk"
alias wb="echo $branch"

#Path setup
pathmerge $MYSQL_HOME/bin
pathmerge ~/bin before
pathmerge $M2_HOME/bin

branch () {
	export branch=$1
	export SRC_ROOT="~/work/branches/dev-branches/$branch/code/trunk"
	alias trunk="cd $SRC_ROOT"
  alias cmj="cd $SRC_ROOT/apps/cms/catalog-manager/src/main/java/flipkart/cms/catalogmanager/"
  alias cmsql="cd $SRC_ROOT/apps/cms/catalog-manager/src/main/sql"
	alias pl="cd $SRC_ROOT/platform"
  alias puj="cd $SRC_ROOT/platform/platform-utils/src/main/java/flipkart/platform"
  alias seed="cd $SRC_ROOT/apps/cms/catalog-manager/src/main/resources/final"
  alias pu="cd $SRC_ROOT/platform/platform-utils"
  alias cmscode="cd $SRC_ROOT/apps/cms/catalog-manager"
  alias cms="cd $SRC_ROOT/apps/cms"
  alias sc="cd $SRC_ROOT/apps/cms/scripts"
  alias be="cd $SRC_ROOT/apps/cms/backend"
  alias conf="cd ~/work/branches/dev-branches/$branch/config/flipkart_config"
  unlink /opt/flipkart/platform/config
  ln -s /Users/abhishek/work/branches/dev-branches/$branch/config/flipkart_config/ /opt/flipkart/platform/config
	alias wb="echo $branch"
}


#Abhim Aliases
if [ -f ~/.aliases.sh ]
then
	. ~/.aliases.sh
fi

#Bhim Aliases
if [ -f ~/bhim.aliases.sh ]
then
	. ~/bhim.aliases.sh
fi

#Abhim Functions
if [ -f ~/zsh.functions.sh ]
then
	. ~/zsh.functions.sh
fi




