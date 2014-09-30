#!/bin/bash
shopt -s expand_aliases
#source ~/scripts/bashrc.bhim.sh

export MYSQL_HOME="/usr/local/mysql"
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home/"
export APACHE_DOC_ROOT="/Library/WebServer/Documents"
export ARTIFACTORY_HOME="/opt/artifactory"
export BOOST_ROOT='/act/boost/boost_1_42_0'
export SVN_EDITOR=vim
export EDITOR=vim
export MAVEN_OPTIONS="-DskipTests -DdownloadJavadocs=true  -DdownloadSources=true"
export DEV_BRANCH="~/work/branches/dev-branches"
export PL="$DEV_BRANCH/platform"

# System Aliases
alias ls="ls -G"
alias z='vim ~/.zshrc'
alias csv='cd ~/fw/csv'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias gvim='mvim'
alias gvimdiff='gvim -d'
alias pine='/Applications/MacPine.app/Contents/Resources/pine'
alias tw='~/Applications/TextWrangler.app/Contents/MacOS/edit'
alias ip='ifconfig | grep "192\.168\."'
alias rsync='rsync -ahrvzC'

# Local CMS Related
alias pl="cd $PL"
alias plj="cd $PL/stable/libraries/platform-utils/src/main/java/flipkart/platform"
alias pu="cd $PL/stable/libraries/platform-utils"
alias misc="cd ~/work/branches/misc"
alias conf="cd /opt/flipkart/platform; la config | grep \/config; cd config"
alias cfg="vim /opt/flipkart/platform/config/appgroup/cms.cfg"
alias scfg="sudo vim /opt/flipkart/platform/config/appgroup/cms.cfg"
alias mcfg="vim /opt/flipkart/platform/config/metrics/config.inc.php"
alias cblog="cat /dev/null > /var/log/flipkart/cms.log"
alias calog="cat /dev/null > /var/log/flipkart/alarms/alarm.log"
alias btl="lf /opt/tomcat/logs/catalina.out"
alias stl="lf /opt/tomcat_cms-service/logs/catalina.out"
alias solrtl="lf /opt/tomcat_solr/logs/catalina.out"
alias log='cd /var/log/flipkart/'
alias al="lf /var/log/flipkart/alarms/alarm.log"
alias tlog="tail -f /var/log/flipkart/cms.log"
alias bl="lf /var/log/flipkart/cms.log"
alias fl="lf /var/log/flipkart/flipkart.log"
alias sl="lf /var/log/flipkart/cms-service.log"
alias csql="mysql -uroot cms"
alias msql="mysql -ucms_metrics -pcms_metrics cms_metrics"
alias rsql='mysql -uroot'
alias lsc="cd /data/tmp/cms/schome; watch -n 10 ls -R"

# SVN Related
alias commit='svn commit'
alias sdiff='svn diff --diff-cmd ~/bhim/bin/sdiffwrap.sh'
alias sr='svn revert'
alias sts='svn st | sort'
alias scopy='svn copy https://svn.corp.flipkart.com/svn/flipkart_dessert/branches/dev-branches/alok https://svn.corp.flipkart.com/svn/flipkart_dessert/branches/dev-branches/bhim -m \"Creating a private branch for abhishekm\"'

# Maven Related
alias mvn='/usr/bin/mvn -DskipTests -DdownloadJavadocs=true  -DdownloadSources=true'
alias mci="mvn clean install"
alias mi="mvn install"
alias me="mvn eclipse:eclipse"
alias mce="mvn eclipse:clean eclipse:eclipse"

# Code Review Related
alias scr='~/bhim/scripts/upload.py -s codereview.flipkart.com'

# Bhim Aliases
alias eclipse='/Users/abhishek/Applications/eclipse-java-helios-SR1-macosx-cocoa-32bit/eclipse'
alias pre='/Applications/Preview.app/Contents/MacOS/Preview'
alias m="~/Applications/MPlayerX.app/Contents/Resources/binaries/x86_64/mplayer-mt"
alias ma="~/Applications/MPlayerX.app/Contents/Resources/binaries/x86_64/mplayer-mt -aspect 16:9"
alias han="m -loop 0  ~/personal/tmp/tmp/audio/hanuman1.mp3"
alias sun="m ~/personal/tmp/tmp/audio/sundarkand.cut.mp3"
alias cha="m -loop 0 ~/personal/tmp/tmp/audio/hanuman_chalisa.mp3"
alias tv="cd ~/personal/tvshows"
alias mo="cd ~/personal/movies"
alias lo='vim ~/local.bhim.sh'
alias apps='cd ~/personal/applications/'
alias devb="cd ~/work/branches/dev-branches/"
alias tmp='cd ~/personal/tmp/tmp'
alias mvt="mv $1 ~/personal/tvshows/"
alias mvm="mv $1 ~/personal/movies/"
alias gim="cd ~/.centerim; cp gim config; centerim; cd"
alias fim="cd ~/.centerim; cp fim config; centerim; cd"
alias lockme="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
#alias gedit="~/Applications/gedit.app/Contents/MacOS/gedit"

function numf() {
	find $1 -type f | wc -l
}

function branch () {
	export branch=$1
	export SRC_ROOT="~/work/branches/dev-branches/$branch"
	export TRUNK="$SRC_ROOT/code/trunk"
	export CMS="$TRUNK/apps/cms"
	alias trunk="cd $TRUNK; pwd | grep dev-branches"
	alias btop="cd $SRC_ROOT; pwd | grep dev-branches"
	alias bconf="cd $SRC_ROOT/config/flipkart_config; pwd | grep dev-branches"
	alias cmsi="cd $TRUNK/interfaces/cmsinterface; pwd | grep dev-branches"
	alias service="cd $CMS/service; pwd | grep dev-branches"
	alias cms="cd $CMS; pwd | grep dev-branches"
	alias sc="cd $CMS/scripts; pwd | grep dev-branches"
	alias be="cd $CMS/backend; pwd | grep dev-branches"
	alias cm="cd $CMS/catalog-manager; pwd | grep dev-branches"
	alias con="cd $CMS/consoles; pwd | grep dev-branches"
	alias cmj="cd $CMS/catalog-manager/src/main/java/flipkart/cms/catalogmanager; pwd | grep dev-branches"
	alias cmt="cd $CMS/catalog-manager/src/test/java/flipkart/cms/catalogmanager; pwd | grep dev-branches"
	alias csc="cd $CMS/catalog-manager/src/main/java/flipkart/cms/catalogmanager/staticcontent; pwd | grep dev-branches"
	alias main="cd $CMS/catalog-manager/src/main; pwd | grep dev-branches"
	alias cmsj="cd $CMS/catalog-manager/src/main/java/flipkart/cms; pwd | grep dev-branches"
	alias sql="cd $CMS/catalog-manager/src/main/sql; pwd | grep dev-branches"
	alias crons="cd $CMS/catalog-manager/build/etc/cron.d/; pwd | grep dev-branches"	
	alias bcfg="vim $SRC_ROOT/config/flipkart_config/appgroup/cms.cfg"
	
	alias rd="be; ./redeploy.sh; cd -"
	alias bd="be; ./bhim.redeploy.sh compile cpwar; cd -"
	alias serd="service; ./redeploy.sh; cd -"

	alias vb="echo $branch"
}
#branch smain
#branch scfm
branch conscf

function scra() {
	~/bhim/scripts/upload.py -i $1 -s codereview.flipkart.com
}
function rst() {
	~/bhim/bin/restartTomcat $1 
}

function st1() {
	if [ "$1" = "" ]; then
		echo "Usage: st1 [cms|solr|service|all]";
		return;
	fi 
	~/bhim/bin/startTomcat $1 
}

function st2() {
	if [ "$1" = "" ]; then
		echo "Usage: st2 [cms|solr|service|all]";
		return;
	fi 
	~/bhim/bin/stopTomcat $1 
}

function sat1() {
	~/bhim/bin/startAllTomcats 
}

function sat2() {
	~/bhim/bin/stopAllTomcats 
}
 
function rmcp() {
	if [ "$1" = "" ]; then
		echo "Usage: rmcp [cms|solr|service|all]";
		return;
	fi 
	
	if [ "$1" = "cms" ]; then
		rm -rf /opt/tomcat/catalina.pid;
	fi
 
	if	[ "$1" = "solr" ]; then
		rm -rf /opt/tomcat_solr/catalina.pid; 
	fi
	
	if	[ "$1" = "service" ]; then
		rm -rf /opt/tomcat_cms-service/catalina.pid; 
	fi	

	if	[ "$1" = "all" ]; then
		rm -rf /opt/tomcat_solr/catalina.pid /opt/tomcat/catalina.pid /opt/tomcat_cms-service/catalina.pid; 
	fi
}

function scb() {
	bName="$1"
	if [ "$bName" = "" ]; then
		echo "Usage: scb branchName";
		return;
	fi
	cd ~/work/branches/dev-branches/
	svn co https://svn.corp.flipkart.com/svn/flipkart_dessert/branches/dev-branches/alok $bName 
	cd $bName/code/trunk/apps/cms
	ln -s ~/bhim/scripts/bhim.redeploy.sh backend/bhim.redeploy.sh
	ln -s ~/fw/BhimFeedTest.java catalog-manager/src/test/java/flipkart/cms/catalogmanager/BhimFeedTest.java
	#./bhim.redeploy.sh compile
}

function cbhim() {
	if [ "$1" = "" ]; then
		echo "Usage: cbhim cms-svc2"
		return;
	fi
	cd ~/bhim/
	#tar -cjf bhim.tar.gz cmsdb configs
	scp -r cmsdb "abhishekm@$1:~/bhim/"
	scp -r configs "abhishekm@$1:~/bhim/"
	#rm -rf bhim.tar.gz 
	cd -
}

function allup() {
	cd ~/work/branches/misc/
	echo `pwd`
	up
	cd ../dev-branches
	#if [ "$1" = "all" ]; then
		folders=( conscf main platform smain scfm )
		for folder in "${folders[@]}"; do
			#echo "skipping $folder..."
			brup $folder
		done
	#fi
	cd
}

function brup() {
	folder="$1"
	if [ "$folder" = "" ]; then
		echo "Usage: brup folderName";
		return;
	fi 
	cd ~/work/branches/dev-branches/$folder/
	echo `pwd`
	up
}

function newdb() {
	cmsql
	cat *.sql | mysql -uroot cms
}

function dfs() {
	pid="$1"
	if [ "$pid" = "" ]; then
		echo "Usage: dfs localhost AVMCNP75DPGFHSFE | dfs AVMCNP75DPGFHSFE";
		return;
	fi 
	host="$2"
	if [ "$host" = "" ]; then
		host="localhost"
		pid="$1"
	else 
		host="$1"
		pid="$2"
	fi
	deleteUrl="http://$host:9090/solr/update?stream.body=<delete><id>$pid</id></delete>";
	echo "curl '$deleteUrl'";
	curl $deleteUrl;
}

function solrcl() {
	host="$1"
	if [ "$host" = "" ]; then
		host="localhost"		
	fi
	deleteUrl="http://$host:9090/solr/update?stream.body=<delete><query>*:*</query></delete>";
	echo "curl '$deleteUrl'";
	curl $deleteUrl;
}

function solrcm() {
	host="$1"
	if [ "$host" = "" ]; then
		host="localhost"		
	fi
	if [ "$host" = "cms2" ]; then
		host="cms2.dc.flipkart.com"		
	fi
	commitUrl="http://$host:9090/solr/update?stream.body=<commit/>";
	echo "curl $commitUrl";
	curl $commitUrl;
}

function solrupdate() {
	host="$1"
	if [ "$host" = "" ]; then
		host="localhost"		
	fi
	if [ "$host" = "cms2" ]; then
		host="cms2.dc.flipkart.com"		
	fi
	commitUrl="http://localhost:9090/solr/update?optimize=true"
	echo "curl $commitUrl";
	curl $commitUrl;	
}
alias emptySolr="scl; scom"




