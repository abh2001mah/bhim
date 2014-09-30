#!/bin/bash
shopt -s expand_aliases
source $HOME/common.bashrc.sh
#source /Users/amaheshw/common.bashrc.sh

alias pv='ping cryptogate.terracottatech.com'
alias pvo='ping cryptogate-office.terracottatech.com'
alias pn='ping nexus.terracotta.eur.ad.sag'
alias sag='ping hqcas.eur.ad.sag'
alias ip="hostname -i"
export tcws="~/tw/svn"
alias tt="cd ~/tw/svn"
alias tk="cd ~/tw/svn/trunk"
alias 37="cd ~/tw/svn/3.7"
alias 36="cd ~/tw/svn/3.6"
alias 35="cd ~/tw/svn/3.5"
alias 40="cd ~/tw/svn/4.0"
alias 41="cd ~/tw/svn/4.1"
alias ria="cd ~/tw/svn/remove-internal-api"
alias ee="cd $tcws/trunk/ehcache-ee"
alias eet="cd $tcws/trunk/ehcache-ee/system-tests"
alias eo="cd $tcws/trunk/ehcache-ee/ehcache-os"
alias eot="cd $tcws/trunk/ehcache-ee/ehcache-os/system-tests"
alias co="cd $tcws/trunk/enterprise/community"
alias et="cd $tcws/trunk/enterprise"
alias ett="cd $tcws/trunk/enterprise/toolkit-ee-system-tests"
alias ta="cd $tcws/trunk/terracotta-toolkit-api"
alias tai="cd $tcws/trunk/terracotta-toolkit-api-internal"
alias lc="cd $tcws/trunk/clustered-entity-management"
alias ts='psg | grep TCServerMain'
alias tc='psg | grep TestClientLauncher'
alias tsc="ts | wc -l"
alias tcc="tc | wc -l"
alias lsl="lf ~/terracotta/server-logs/terracotta-server.log"
alias tsl="tail -f ~/terracotta/server-logs/terracotta-server.log"
alias cdde="./tcbuild clean dist dso enterprise"
alias dde="./tcbuild dist dso enterprise --no-extra"
alias cdma="./tcbuild clean dist_maven_all"
alias dma="./tcbuild dist_maven_all --no-no"
alias cc="./tcbuild clean compile"
alias lad="la $tcws/trunk/enterprise/community/devwork/"
alias lee="ln -sf  $tcws/trunk/ehcache-ee $tcws/trunk/enterprise/community/devwork/ehcache-ee; lad;"
alias uee="unlink $tcws/trunk/enterprise/community/devwork/ehcache-ee; lad"
alias lta="ln -sf $tcws/trunk/terracotta-toolkit-api $tcws/trunk/enterprise/community/devwork/terracotta-toolkit-api; lad"
alias uta="unlink $tcws/trunk/enterprise/community/devwork/terracotta-toolkit-api; lad"
export cdbug=" -Dstandalone.client.debug=true"
export sdbug=" -Dmaven.surefire.debug=true"
export mts=" -Dmaven.test.skip=true"
export dm=" -Pdevmode"
alias gpas="gr '\[PASS:'"

#alias coap="comb; ./tcbuild check_one $1 test.mode=active-passive --no-ivy | tee log"
#alias coaa="comb; ./tcbuild check_one $1 test.mode=active-active --no-ivy | tee log"

function mcs() {
	echo "mvn clean verify -Pcheck-short $1 $2 $3 | tee check-short.log" | tee check-short.log
	mvn clean verify -Pcheck-short $1 $2 $3 | tee -a check-short.log
}

function mid() {
	args=" -o"
	for project in $*
		do
			args=" -pl $project$args"
		done
	always=" -pl toolkit-runtime -pl ../toolkit-runtime-ee"
	echo "$maven install $always$args"
	$maven install $always$args
}

function ct() {
	mode=$1
	if [ "$mode" == "ap" ]; then
		./tcbuild check_one $1 test.mode=active-passive --no-ivy $2 $3 $4 | tee log
	elif [ "$mode" == "aa" ]; then
		./tcbuild check_one $1 test.mode=active-active --no-ivy $2 $3 $4 | tee log
	else
		./tcbuild check_one $mode --no-ivy $2 $3 $4 | tee log
	fi
}

function mu() {
	fileName=$1
	defaultId=amaheshw@terracottatech.com
	mailids=$2
	if [ "$fileName" = "" ]; then
		echo "Usage: mu filename.txt [abc@example.com]"
		return;
	fi

	if [ "$mailids" != "" ]; then
		mailids="$defaultId,$mailids"
	fi

	date | mutt -a $fileName -s "$fileName @ $HOSTNAME" $mailids
}

function kit() {
	target="$1"
	if [ "$target" = "" ]; then
		target=all
	fi
	shouldAsk="$2"
	if [ "$shouldAsk" = "" ]; then
		shouldAsk=n
	fi
	logFile=/tmp/tmp.log
	rm -rf $logFile
	time ~amaheshw/bin/kit.build.sh $target $shouldAsk $3 $4 $5 | tee $logFile
}


function mt() {
	if [ "$1" = "" ] || [[ "$1" != "et"  && "$1" != "ot" ]]; then
		echo "Usage: mt [et|ot] testName"
		return -1
	fi
	mavent="mvn verify -Dtest.framework.debug=true -Psystem-tests"
	ee=",ee "
	mode=" "
	test=" "
	if [ "$2" != "" ]; then
		test=" -Dtest=$2 "
	fi
	if [ "$1" == "et" ]; then
		mode="$ee"
	fi
	others="-DpoundEmail=Abhishek.Maheshwari@terracottatech.com $3 $4 $5"
	suffix=`date "+%Y-%m-%d-%H%M"`;	
	#rm -rf target/temp/$2
	echo "$mavent$mode$test $others | tee $2.log" | tee $2.log
	$mavent$mode$test $others | tee -a $2.log
	#cp $2.log $2-$suffix.log
}

alias tv="cd ~/tvshows"
alias mo="cd ~/movies"
alias mvt="mv $1 ~/tvshows/"
alias mvm="mv $1 ~/movies/"
alias v="ssh vandal.apama.com"
alias g="ssh goth.apama.com"
alias a="ssh apamatest07.apama.com"

for i in {1..9}
	do
		alias eng$i="ssh eng0$i"
		alias perf$i="ssh perf0$i"
		alias dev$i="ssh dev0$i"
		alias bm$i="ssh bigmemory0$i"

		alias se$i="ssh sfo-r6-p-eng-00$i.eur.ad.sag"
		alias pse$i="ping sfo-r6-p-eng-00$i.eur.ad.sag"
		alias sp$i="ssh sfo-r6-p-perf-00$i.eur.ad.sag"
		alias psp$i="ping sfo-r6-p-perf-00$i.eur.ad.sag"

		#alias se$i="ssh eng-00$i.eur.ad.sag"
		#alias pse$i="ping eng-00$i.eur.ad.sag"
		#alias sp$i="ssh perf-00$i.eur.ad.sag"
		#alias psp$i="ping perf-00$i.eur.ad.sag"
	done

for i in {10..64}
	do
		alias eng$i="ssh eng$i"
		alias perf$i="ssh perf$i"
		alias dev$i="ssh dev$i"

		alias se$i="ssh sfo-r6-p-eng-0$i.eur.ad.sag"
		alias pse$i="ping sfo-r6-p-eng-0$i.eur.ad.sag"
		alias sp$i="ssh sfo-r6-p-perf-0$i.eur.ad.sag"
		alias psp$i="ping sfo-r6-p-perf-0$i.eur.ad.sag"

		#alias se$i="ssh eng-0$i.eur.ad.sag"
		#alias pse$i="ping eng-0$i.eur.ad.sag"
		#alias sp$i="ssh perf-0$i.eur.ad.sag"
		#alias psp$i="ping perf-0$i.eur.ad.sag"
	done

function numf() {
	find $1 -type f | wc -l
}

if [ `uname` = "Darwin" ] && [ -f ~/bhim/configs/mac.bashrc.sh ]; then
. ~/bhim/configs/mac.bashrc.sh
fi


