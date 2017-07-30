#!/bin/bash
#export PS1='[\t|\W]\\$ '
#export HOST=`hostname -s`
#export PROMPT_COMMAND='echo -ne "\033]0;${HOST}|${PWD##/*/}\007"'
#export PROMPT_COMMAND='echo -ne "\033]0;${PWD##/*/}\007"'
#export PROMPT_COMMAND='echo -ne "\033]0;${HOST}\007"'
export mst=" -Dmaven.test.skip=true"
export mg="-Dhadoop=non_secure -Phadoop_1 -DskipTests -DskipJavadoc -Dmaven.javadoc.skip=true -Dcheckstyle.skip=true"

alias ls="ls -htHFG"
#alias ls="ls -htHFG --color=always"
alias l="ls"
alias cd2="cd; cd -"
alias ll="l -l"
alias la="ll -A"
alias lt="ll -t"
alias lr="ll -R"
alias datef='date "+DATE: %Y-%m-%d TIME: %H:%M:%S"'
alias b='vim ~/.bashrc'
alias bp='vim ~/.bash_profile'
alias p="pwd"
alias pp="pwd -P"
alias t='type'
alias wh='which'
alias rr='/bin/rm -rfv'
alias rm='/bin/rm -i'
alias df="df -h"
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
alias gzip="gzip -v"

alias st="git status"
alias up="git pull --rebase"
alias commit='git commit'
alias gp="git pull --stat"
alias ga="git add"
alias gd="git diff --ignore-space-at-eol -b -w"
alias gdc="gd --cached"
alias gc="git checkout"
alias gcf="git checkout -- "
alias go="git log --stat @{u}.."
alias gi="git log --stat ..@{u}"
alias gl="git log --oneline"
alias god="git log --graph --oneline --decorate"
alias gs="git stash"
alias gsp="git stash pop"
alias gsl="git stash list"
alias guiau="git update-index --assume-unchanged "
alias gb="git branch"
alias grc="git rebase --continue"
alias gra="git rebase --abort"

alias bb="byobu"
alias bn="byobu new -s"
alias br="byobu rename -t"
alias gvimdiff='gvim -d'
alias tarx='tar --exclude-vcs'
alias rsync='rsync -ahrvzC'
alias ip='ifconfig | grep inet'
#alias ip='hostname -i'
alias cb="vim ~/common.bashrc.sh"
alias lb="vim ~/local.bashrc.sh"
alias ps='ps -e'
alias psg="ps | grep -v \"grep\""
alias pgt='psg | grep Dcatalina.home='
alias pgj='psg | grep java'
alias mdt='mvn dependency:tree'
export m1='mvn -Dcheckstyle.skip=true -DskipTests -DskipJavadoc -Dmaven.javadoc.skip=true -DdownloadJavadocs=false -DdownloadSources=false'
export m2="$m1 -Dmaven.test.skip=true"
export maven="$m1"
alias em="echo $maven"
alias jh="cd $JAVA_HOME"
alias hd="hdfs dfs"
#alias hd="hadoop dfs"
alias hl="hd -ls -h"
alias hlr="hl -R"
alias hc="hd -cat"
alias hr="hd -rm"
alias hrr="hd -rm -r"
alias hu="hd -du -s -h"
alias hp="hd -put"
alias hdr="hdfs dfsadmin -report"
alias hk="hdfs job -kill"
alias hj="hdfs job -list"
#alias hdr="hadoop dfsadmin -report"
#alias hk="hadoop job -kill"
#alias hj="hadoop job -list"
alias hsa="start-dfs.sh; start-yarn.sh; mr-jobhistory-daemon.sh start historyserver; sleep 2; ph"
alias hso="stop-dfs.sh; stop-yarn.sh; mr-jobhistory-daemon.sh stop historyserver; sleep 2; ph"
alias hs1="$HADOOP_PREFIX/bin/start-all.sh; sleep 2; ph"
alias hs2="$HADOOP_PREFIX/bin/stop-all.sh; sleep 2; ph"
alias hrs="stop-dfs.sh; stop-yarn.sh; sleep 2; start-dfs.sh; start-yarn.sh; sleep 2; ph"
#alias hrs="$HADOOP_PREFIX/bin/stop-all.sh; sleep 2; $HADOOP_PREFIX/bin/start-all.sh; ph"
alias ss1="$SPARK_HOME/sbin/start-all.sh; sleep 2; ph"
alias ss2="$SPARK_HOME/sbin/stop-all.sh; sleep 2; ph"
alias srs="$SPARK_HOME/sbin/stop-all.sh; sleep 2; $SPARK_HOME/sbin/start-all.sh; ph"
alias yla="yarn logs -applicationId "
alias ssl="spark-submit --master local[*] --class "
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
alias ph="jp | grep -i 'node\|tracker\|worker\|master\|peer\|regionserver\|manager\|historyserver\|bootstrap'"
alias pi="pig -stop_on_failure -param_file $HOME/pig.properties "
alias pix="pi -x local"
alias gw="jp | grep Child | wc"
alias gcs="gr 'Completed superstep '"
alias gfs="gr 'finishSuperstep: Superstep "
alias java='java -Djava.awt.headless=true -Dapple.awt.UIElement=true'
alias oos="oozie job -oozie http://localhost:11000/oozie -info "
alias oor="oozie job -oozie http://localhost:11000/oozie/ -config "
alias kjava="killall -9 java; sleep 2; pgj"
alias tjava="killall -3 java"
alias jhat='jhat -J-mx2g'
alias du="du -sh"
alias sysinfo='uname -a; cpuClock=`cat /proc/cpuinfo | grep -i "cpu mhz" | head -1`; numCores=`cat /proc/cpuinfo | grep -i "cpu mhz" | wc -l`; echo "Each cpu core of $cpuClock each"; echo "Number of cpu cores: $numCores"; memTotal=`cat /proc/meminfo | grep -i "memtotal"`; echo "RAM $memTotal";'

alias gad="gradle assembleDebug"
alias hi="cd $HIVE_HOME"
alias hs="cd $HIVE_HOME/bin; rm -rf metastore_db/*.lck; ./hive; cd -"
alias hms="cd $HIVE_HOME/bin; ./hive --service metastore; cd -"
alias hss="cd $HIVE_HOME/bin; ./hiveserver2; jps; cd -"
alias bs="cd $HIVE_HOME/bin; ./beeline; cd -"
alias hib="cd $HIVE_HOME/bin"

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

function numf() {
	find $1 -type f | wc
}

function path() {
	for p in $(echo $PATH | tr ":" "\n")
		do
  		echo $p
		done
}

function mci() {
	echo "$maven clean install $1 $2 $3 $4 $5 | tee mi.log"
	$maven clean install $1 $2 $3 $4 $5 | tee -a mi.log
}

function mi() {
	echo "$maven install $1 $2 $3 $4 $5 | tee mi.log"
	$maven install $1 $2 $3 $4 $5 | tee -a mi.log
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

function grd() {
	files=`find $2 -name "$3*" -type f`
	echo $files;
	grep -r -n "$1" $files;
}

function gr() {
	grep -r -n "$1" * 
}

function gri() {
	grep -r -n -i "$1" * 
}

function s1() {
	find . -name "*$1*" | grep $1 
}

function s2() {
	find . -name "*$2*.$1" | grep $2 
}

function me() {
	mvn exec:java -Dexec.mainClass="$1" $2 $3 $4 | tee me.log
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

if [ `uname` = "Darwin" ] && [ -r ~/bhim/configs/mac.bashrc.sh ]; then
. $HOME/bhim/configs/mac.bashrc.sh
fi

alias s2j="s2 java $1"
alias s2x="s2 xml $1"
alias s2p="s2 pig $1"
alias s2c="s2 scala $1"
alias s2a="s1 $1"
alias om="gr OutOfMemoryError"
