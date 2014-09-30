#!/bin/bash
export HISTCONTROL=erasedups
export HISTSIZE=99999
export MY_HOME=/export2/homes/amaheshw

function jrock16() {
	echo 'export JAVA_HOME=/shares/perf/java/jrockit-1.6.0_x64;export PATH=$JAVA_HOME/bin:$PATH'
}

function jrock15() {
	echo 'export JAVA_HOME=/shares/perf/java/jrockit-1.5.0_x64;export PATH=$JAVA_HOME/bin:$PATH'
}

function ep() {
	pftest=$1
	alias pts="cd /shares/perf/perfTests-$pftest/perfStage/"
	alias pf="cd /shares/perf/perfTests-$pftest"
}

alias mtc="mvn clean install tc:run"
alias cplk="cp /shares/perf/perfTests-hsingh/scripts/licenses/3.4-product.key terracotta-license.key"
alias bench="sudo su - bench"
alias umc="vim perfStage/user-master.config"
alias tcn="vim tests/ehcacheperf/setup/test.config-normal"
alias dv="vim tests/ehcacheperf/setup/defaultValues"
alias pconf="vim tests/ehcacheperf/setup/test.config-normal perfStage/user-master.config"
alias ddata="du /export1/bench/perfTests/perfLogs/server/data-9520"
alias dda="du /fioa/bench/perfTests/server-9520/server/data-9520"
alias ddb="du /fiob/bench/perfTests/server-9520/server/data-9520"

alias trt="tail -f /export1/bench/perfTests/superRunTests.log"
alias vrt="vim /export1/bench/perfTests/superRunTests.log"
alias lrt="lf /export1/bench/perfTests/superRunTests.log"

alias vsl="vim /export1/bench/perfTests/perfLogs/server/logs-9520/terracotta-server.log"
alias tsl="tail -f /export1/bench/perfTests/perfLogs/server/logs-9520/terracotta-server.log"
alias vcl="vim /export1/bench/perfTests/perfLogs/client/logs/`hostname -s`-0/terracotta-client.log"
alias tcl="tail -f /export1/bench/perfTests/perfLogs/client/logs/`hostname -s`-0/terracotta-client.log"

#alias pnmon='/export2/homes/hsingh/nmon_x86_11f/nmon_x86_sles10'

for file in $MY_HOME/common.bashrc.sh $MY_HOME/local.bashrc.sh
do
	if [ -f "$file" ]; then
		echo $file
		. "$file"
	fi
done

#export PS1='[\t|\u|\W]\\$ '
export PS1='[\t|\W]\\$ '
export HOST=`hostname -s|cut -d'-' -f 5`
export PROMPT_COMMAND='echo -ne "\033]0;${HOST}|${PWD##/*/}\007"'
#export PROMPT_COMMAND='echo -ne "\033k\033\0134${HOST}"'
#export PROMPT_COMMAND='echo -ne "\033k\033\134"'

case ${TERM} in
        xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix)
								echo "this1 is $TERM"
                ;;
        screen)
								echo "this2 is $TERM"
								PROMPT_COMMAND='echo -ne  "\033k${HOST}|${PWD##/*/}\033\\"'
                ;;
        screen-bce)
								echo "this3 is $TERM"
								PROMPT_COMMAND='echo -ne  "\033k${HOST}|${PWD##/*/}\033\\"'
                ;;
esac

