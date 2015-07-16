#!/bin/bash
#export PS1='[\t|\W]\\$ '
#export HOST=`hostname -s`
#export PROMPT_COMMAND='echo -ne "\033]0;${HOST}|${PWD##/*/}\007"'
#export PROMPT_COMMAND='echo -ne "\033]0;${PWD##/*/}\007"'
#export PROMPT_COMMAND='echo -ne "\033]0;${HOST}\007"'
export mst=" -Dmaven.test.skip=true"
export grs="| grep -v .svn | grep -v '/target/'"
export mg="-Dhadoop=non_secure -Phadoop_1 -DskipTests -DskipJavadoc -Dmaven.javadoc.skip=true -Dcheckstyle.skip=true"

alias ls="ls -hHFG"
#alias ls="ls -htHFG --color=always"
alias l="ls"
alias cd2="cd; cd -"
alias ll="l -l"
alias la="ll -A"
alias lt="ll -t"
alias lr="ll -R"
alias grep='~/bin/grep --color=always'
alias b='vim ~/.bashrc'
alias bp='vim ~/.bash_profile'
alias p="pwd"
alias pp="pwd -P"
alias t='type'
alias wh='which'
alias rr='/bin/rm -rfv'
alias rm='/bin/rm -i'
alias bhim="cd ~/bhim"
alias bin='cd ~/bin'
alias bbin='cd ~/bhim/bin'
alias df="df -h"
alias bsc='cd ~/bhim/scripts'
alias bco='cd ~/bhim/configs'
alias diff="/usr/bin/diff -E -b -w -B"
#alias diff="/usr/bin/diff -Naur --strip-trailing-cr"
alias nets="netstat -tlnp"
alias less="/usr/bin/less -inM"
alias lf="less +F"
alias lg="less +G"
alias lm="la ~/.m2/repository"
alias wa='watch --differences -n 10'
alias tf='tail -f '
alias ping="ping -c 4"
#alias pig="ping google.com"
alias h='hostname -f'
alias sls='screen -ls'
alias sdr='screen -DR'
alias vrc="vim ~/.vimrc"
alias src="vim ~/.screenrc"
alias up='git pull --rebase'
alias bup="cd ~/bhim; up; cd -"
alias commit='git commit'
alias sd='svn diff -x -w -x -b -x --ignore-eol-style'
alias sr='svn revert'
#alias srr='svn revert . -R'
alias gzip="gzip -v"
alias si="svn info | grep 'URL\|Changed'"
alias crons='cd /etc/cron.d/'
alias st='svn st |  grep -v "^X" | grep -v "Performing status on external item at" | sed "/^$/d"'
alias sq="stg | grep '? '"
alias sts="st | sort"
alias sdf='st | cut -c 8-'
alias sqxr="sq | ~/bin/grep '\.log' | cut -c 8- | xargs rm -vf"
alias sc="st | grep 'C '"
alias sm='st | grep "M \|A \|D \|C "'
alias sa='st | grep "M \|A \|D \|C \|? "'
alias st="git status"
alias gp="git pull --stat"
alias gpr="git pull --rebase"
alias ga="git add"
alias gd="git diff --ignore-space-at-eol -b -w"
alias gdc="gd --cached"
alias gc="git checkout -- "
alias go="git log --stat @{u}.."
alias gi="git log --stat ..@{u}"
alias gs="git stash"
alias gsp="git stash pop"
alias gsl="git stash list"
alias guiau="git update-index --assume-unchanged "
alias gb="git branch"
alias sve="svn propget svn:externals ."
alias sme="svn pe svn:externals ."
alias svi="svn propget svn:ignore ."
alias smi="svn pe svn:ignore ."
alias bb="byobu"
alias gvimdiff='gvim -d'
alias tarx='tar --exclude-vcs'
alias cmscp='export CLASSPATH=$(find /usr/share/fk-cms-backend/webapps/cms/WEB-INF/lib/|xargs -i echo -n "{}:")'
alias rsync='rsync -ahrvzC'
alias ip='ifconfig | grep inet'
#alias ip='hostname -i'
alias cb="vim ~/common.bashrc.sh"
alias lb="vim ~/local.bashrc.sh"
alias ps='ps -e'
alias psg="ps | grep -v \"grep\""
alias pgt='psg | grep Dcatalina.home='
alias pgj='psg | grep java'
export m1='mvn -Dcheckstyle.skip=true -DskipTests -DskipJavadoc -Dmaven.javadoc.skip=true -DdownloadJavadocs=false -DdownloadSources=false'
export m2="$m1 -Dmaven.test.skip=true"
export maven="$m1"
alias em="echo $maven"
alias jh="cd $JAVA_HOME"
#alias hd="hdfs dfs"
alias hd="hadoop dfs"
alias hl="hd -ls"
alias hlr="hd -lsr"
alias hc="hd -cat"
alias hr="hd -rm"
alias hu="hd -dus"
alias hp="hd -put"
alias hdr="hadoop dfsadmin -report"
alias hk="hadoop job -kill"
alias hj="hadoop job -list"
alias hs1="$HADOOP_PREFIX/bin/start-all.sh; sleep 2; ph"
alias hs2="$HADOOP_PREFIX/bin/stop-all.sh; sleep 2; ph"
alias hrs="$HADOOP_PREFIX/bin/stop-all.sh; sleep 2; $HADOOP_PREFIX/bin/start-all.sh; ph"
alias ss1="$SPARK_HOME/sbin/start-all.sh; sleep 2; ph"
alias ss2="$SPARK_HOME/sbin/stop-all.sh; sleep 2; ph"
alias srs="$SPARK_HOME/sbin/stop-all.sh; sleep 2; $SPARK_HOME/sbin/start-all.sh; ph"
alias dn-start="hadoop-daemon.sh start datanode; ph"
alias dn-stop="hadoop-daemon.sh stop datanode; ph"
alias nn-start="hadoop-daemon.sh start namenode; ph"
alias nn-stop="hadoop-daemon.sh stop namenode; ph"
alias tt-start="hadoop-daemon.sh start tasktracker; ph"
alias tt-stop="hadoop-daemon.sh stop tasktracker; ph"
alias jt-start="hadoop-daemon.sh start jobtracker; ph"
alias jt-stop="hadoop-daemon.sh stop jobtracker; ph"
alias dn-rs="dn-stop; sleep 2; dn-start"
alias nn-rs="nn-stop; sleep 2; nn-start"
alias tt-rs="tt-stop; sleep 2; tt-start"
alias jt-rs="jt-stop; sleep 2; jt-start"
alias hul="cd ~/hadoop.tmp.dir/mapred/local/userlogs/"
alias jp="jps | grep -v 'Jps\|RemoteMavenServer\|Launcher\|NailgunRunner'"
alias ph="jp | grep -i 'node\|tracker\|worker\|master\|peer\|regionserver'"
alias pi="pig -stop_on_failure -param_file $HOME/pig.properties "
alias pix="pi -x local"
alias gw="jp | grep Child | wc"
alias gcs="gr 'Completed superstep '"
alias gfs="gr 'finishSuperstep: Superstep "
#alias mio="$m1 install -o"
#alias m2ci="$m2 clean install"
#alias m2i="$m2 install"
#alias m2io="$m2 install -o"
#alias me="$maven eclipse:eclipse"
#alias mce="$maven eclipse:clean eclipse:eclipse"
alias gim="cdup;  ~/.centerim; cp gim config; centerim; cd"
alias kjava="killall -9 java; sleep 2; pgj"
alias tjava="killall -3 java"
alias jhat='jhat -J-mx2g'
alias du="du -sh"
alias mysql="mysql -u root"
alias sysinfo='uname -a; cpuClock=`cat /proc/cpuinfo | grep -i "cpu mhz" | head -1`; numCores=`cat /proc/cpuinfo | grep -i "cpu mhz" | wc -l`; echo "Each cpu core of $cpuClock each"; echo "Number of cpu cores: $numCores"; memTotal=`cat /proc/meminfo | grep -i "memtotal"`; echo "RAM $memTotal";'

alias hi="cd $HIVE_HOME"
alias hs="cd $HIVE_HOME/bin; rm -rf metastore_db/*.lck; ./hive; cd -"
alias hms="cd $HIVE_HOME/bin; ./hive --service metastore; cd -"
alias hss="cd $HIVE_HOME/bin; ./hiveserver2; jps; cd -"
alias bs="cd $HIVE_HOME/bin; ./beeline; cd -"
alias hib="cd $HIVE_HOME/bin"

#alias ha="cd $HADOOP_HOME"
#alias has="cd $HADOOP_HOME/sbin"
#alias sh1="cd $HADOOP_HOME/sbin; ./start-all.sh; cd -"
#alias sh1="cd $HADOOP_HOME/sbin; ./start-dfs.sh; ./start-yarn.sh;cd -"
#alias sh2="cd $HADOOP_HOME/sbin; ./stop-all.sh; cd -"
#alias sh2="cd $HADOOP_HOME/sbin; ./stop-dfs.sh; ./stop-yarn.sh; cd -"
#alias rh="sh2; sh1"
#alias rhs="rh; sleep 2; hs2"
alias pyc="pgj | grep YarnChild"
alias yc="pgj | grep YarnChild | wc -l"
alias pma="pgj | grep _m_"
alias mc="pgj | grep _m_ | wc -l"
alias pre="pgj | grep _r_"
alias rc="pgj | grep _r_ | wc -l"

alias p1="cd $PRESTO_HOME/bin; ./launcher start; cd -"
alias p2="cd $PRESTO_HOME/bin; ./launcher stop; cd -"

alias links="la | grep '\->'"

function hh() {
	hc $1 | head
}

function ht() {
  hc $1 | tail
}

function hw() {
	hc $1 | wc
}

function hjl() {
	cd ~/hadoop.tmp.dir/mapred/local/userlogs/$1
}

function hgc() {
	hlr $1 | grep $2
}

function hg() {
	hlr $1 | ~/bin/grep $2
}

function hga() {
	file=/tmp/hga.txt
	rm -rf $file 
	for dir in $*
		do
			hgc $dir 'part-' >> $file
		done
	cat $file
}

function hgpc() {
	file=/tmp/hgpc.txt
	rm -rf $file
	for dir in $*
		do
			hgc $dir 'part-' | cut -d':' -f2 | cut -d' ' -f2 >> $file
		done
	cat $file
}

function hgp() {
	file=/tmp/hgp.txt
	rm -rf $file
	for dir in $*
		do
			hg $dir 'part-' | cut -d':' -f2 | cut -d' ' -f2 >> $file
		done
	cat $file
}

function hpc() {
	hlr $1 | ~/bin/grep 'part-'| cut -d':' -f2 | cut -d' ' -f2 | xargs hadoop dfs -cat
}

function hph() {
	file=/tmp/hph.txt
	hlr $1 | ~/bin/grep 'part-'| cut -d':' -f2 | cut -d' ' -f2 > $file
	while read line 
		do
			echo "------- $line -------" 
			hh $line
		done < $file
}

function hpt() {
  file=/tmp/hpt.txt
  hlr $1 | ~/bin/grep 'part-'| cut -d':' -f2 | cut -d' ' -f2 > $file
  while read line
    do
      echo "------- $line -------"
      ht $line
    done < $file
}

function hpg() {
	file=/tmp/hpg.txt
	hlr $1 | ~/bin/grep 'part-'| cut -d':' -f2 | cut -d' ' -f2 > $file
	while read line 
		do
			search=`hc $line | grep $2`
			if [ "$search" != "" ]; then
				echo "------- $line -------"
				echo $search
			fi
		done < $file
}

function pres() {
	cd /Users/abhishekmaheshwari/installed/presto/bin
	./presto --server localhost:8080 --catalog hive --schema $1
	cd -
}

for i in 1 5 10
	do
		alias wa$i="watch --differences -n $i"
	done
	
function path() {
	for p in $(echo $PATH | tr ":" "\n")
		do
  		echo $p
		done
}

function mci() {
	echo "$maven clean install $1 $2 $3 $4 $5 | tee mci.log"
	$maven clean install $1 $2 $3 $4 $5 | tee -a mci.log
}

function mi() {
	echo "$maven install $1 $2 $3 $4 $5 | tee mi.log"
	$maven install $1 $2 $3 $4 $5 | tee -a mi.log
}

function crepo() {
	folders=( $HOME/.m2/repository/net/sf/ehcache $HOME/.m2/repository/com/terracotta $HOME/.m2/repository/com/terracottatech $HOME/.m2/repository/org/terracotta $HOME/.m2/repository/org/quartz-scheduler )
	for folder in "${folders[@]}"; do
		echo "cleaning $folder"
		find $folder -type d | egrep \"SNAPSHOT$\" | xargs rm -vf
	done
}

function slh() {
	svn log $1 > /tmp/slh.txt
	cat /tmp/slh.txt | head -20
}

function ss() {
	for pid in $*
	do
		kill -SIGSTOP $pid
	done
	echo "SIGSTOP $* done"
	sleep 60;
	for pid in $*
	do
		kill -SIGCONT $pid
	done
	echo "SIGCONT $* done"
}

function slowq() {
	lines="$1"
	if [ "$lines" = "" ]; then
		lines=1000
	fi
	sudo tail $lines /var/lib/mysql/$HOST-slow.log > /tmp/$HOST.bhim.slow.query;
	mysqlsla -lt slow /tmp/$HOST.bhim.slow.query | less
}
 
function grd() {
	files=`find $2 -name "$3*" -type f | grep -v .svn | grep -v '/target/'`
	echo $files;
	grep -r -n "$1" $files;
}

function gr() {
	grep -r -n "$1" * | ~/bin/grep -v .svn | ~/bin/grep -v '/target/'
}

function gri() {
	grep -r -n -i "$1" * | ~/bin/grep -v .svn | ~/bin/grep -v '/target/'
}

function s1() {
	find . -name "*$1*" | grep $1 | grep -v .svn | grep -v '/target/'
}

function s2() {
	find . -name "*$2*.$1" | grep $2 | grep -v .svn | grep -v '/target/'
}

function sm2() {
	unlink ~/.m2/repository
	ln -sf /Users/amaheshw/m2s/$1 ~/.m2/repository
	lm
}

function pathmerge() {
  new_path="$1"
  option="$2"
  if [ "$option" = "before" ]
  then
		export PATH="$new_path:$PATH"
  else
		export PATH="$PATH:$new_path"
  fi
	echo "New path is $PATH"
}

function gv() {
	gd $* > /tmp/gd.patch
	vim /tmp/gd.patch
}

function gcv() {
	gdc $* > /tmp/gdc.patch
	vim /tmp/gdc.patch
}

function mm() {
	mvn exec:java -Dexec.mainClass="$1" $2 $3 $4 | tee log
}

function dup() {
	parent=`pwd`
	dir=`pwd`/*
	for d in $dir
		do
			if [ -d "$d" ] ; then
				cd $d
				pwd
				up
			fi
		done
	cd $parent
}

function dsr() {
	parent=`pwd`
	dir=`pwd`/*
	for d in $dir
		do
			if [ -d "$d" ] ; then
				cd $d
				pwd
				sr . -R
			fi
		done
	cd $parent
}

function dst() {
	tmpFile="/tmp/dst.txt"
	rm -rf $tmpFile
	parent=`pwd`
	dir=`pwd`/*
	for d in $dir
		do
			if [ -d "$d" ] ; then
				cd $d
				echo `pwd` >> $tmpFile
				st >> $tmpFile
				echo "" >> $tmpFile
			fi
		done
	cd $parent
	if [ "$1" == "log" ]; then
		cat $tmpFile
	else
		cat $tmpFile | grep -v '.log'
	fi
}

if [ `uname` = "Darwin" ] && [ -r ~/bhim/configs/mac.bashrc.sh ]; then
. $HOME/bhim/configs/mac.bashrc.sh
fi


alias s2j="s2 java $1"
alias s2x="s2 xml $1"
alias s2p="s2 pig $1"
alias s2c="s2 scala $1"
alias s2a="s1 $1"
alias om="gr OutOfMemoryError"

