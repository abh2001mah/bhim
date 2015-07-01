#!/bin/bash
shopt -s expand_aliases
source $HOME/common.bashrc.sh

alias bd="./build.sh -Pdev -DskipTests -o"
alias pv='ping 115.112.115.67'
alias mo='cd $HOME/mobileum'
alias dm="cd $HOME/scm/mobileum/datamodel"
alias dpc="find ~/scm/mobileum/datamodel/ -name \"*.pig\" | xargs -I {} cp {} /opt/mobileum/oozie/DataModels/lib/"
alias fpc="find ~/scm/mobileum/fraud/ -name \"*.pig\" | xargs -I {} cp {} /opt/mobileum/oozie/DataModels/lib/"
export cdbug=" -Dstandalone.client.debug=true"
export sdbug=" -Dmaven.surefire.debug=true"
export mts=" -Dmaven.test.skip=true"

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
	defaultId=abhishek.maheshwari@mobileum.com
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

function cs() {
	ssh -i $1 cloud-user@$2
}

alias ms2="ssh root@192.168.128.62"
alias ps2="ping 192.168.128.62"
alias ms3="ssh root@192.168.128.26"
alias ps3="ping 192.168.128.26"
alias ms4="ssh root@192.168.128.64"
alias ps4="ping 192.168.128.64"
alias ms5="ssh root@192.168.128.66"
alias ps5="ping 192.168.128.66"

for i in {1..9}
	do
	alias ms$i="ssh root@server$i.mobileum.com"
	alias ps$i="ping server$i.mobileum.com"
	done

function numf() {
	find $1 -type f | wc
}
