#!/bin/bash

# All Exports
PS1='[\t|\W]\\$ '
export HOST=`hostname -s`
export PROMPT_COMMAND='echo -ne "\033]0;${HOST}\007"'
export PROMPT_COMMAND='echo -ne "\033]0;${HOST}|${PWD##/*/}\007"'

# All Aliases
alias l="ls -h"
alias ll="l -l"
alias la="ll -a"
alias lt="ll -t"
alias lr="l -R"
alias vi='vim'
alias b='vim ~/bhim/configs/bashrc.bhim.sh'
alias bp='vim ~/.bash_profile'
alias p="pwd"
alias t='type'
alias wh='which'
alias rm='rm -i'
alias bhim="cd ~/bhim"
alias bin='cd ~/bhim/bin'
alias cmsdb='cd ~/bhim/cmsdb'
alias df="df -h"
alias bsc='cd ~/bhim/scripts'
alias bco='cd ~/bhim/configs'
alias grep='grep --color=always'
alias path='echo $PATH'
alias diff="/usr/bin/diff -E -b -w -B" 
alias nets="netstat -tlnp"
#alias diff="/usr/bin/diff -Naur --strip-trailing-cr"
alias less="/usr/bin/less -inM"
alias lf="less +F"
alias wa='watch --differences -n 10'
alias ip='hostname -i'
alias ping="ping -c 4"
alias pig="ping google.com"
alias h='hostname -f'
alias sls='screen -ls'
alias sdr='screen -D -R -h 10000'
alias vrc="vim ~/.vimrc"
alias src="vim ~/.screenrc"
alias bup="cd ~/bhim; svn up; cd -"
alias up="svn up"
alias commit='svn commit'
alias gzip="gzip -v"
alias ssh='ssh -l abhishekm'
alias fw='cd ~/fw/'
alias bu='cd ~/fw/backup'
alias si='svn info; pwd | grep dev-branches'
alias crons='cd /etc/cron.d/'
alias st='svn st'
alias sq="st | grep '? '"
alias bb="byobu"
alias qs='sudo rabbitmqctl list_queues | grep -i NM | grep -v SLQ'
alias ucms='sudo -u cms -s'
alias tarx='tar --exclude-vcs'
alias cmscp='export CLASSPATH=$(find /usr/share/fk-cms-backend/webapps/cms/WEB-INF/lib/|xargs -i echo -n "{}:")'

#Processes Related
alias pgt='ps auxwww | grep Dcatalina.home='
alias pgj='ps auxwww | grep java'
alias pg="ps auxwwww | grep $1"

# CMS Related 
alias btl="lf /opt/tomcat/logs/catalina.out"
alias stl="lf /opt/tomcat_cms-service/logs/catalina.out"
alias solrtl="lf /opt/tomcat_solr/logs/catalina.out"
alias log='cd /var/log/flipkart/cms/'
alias tlog="tail -f /var/log/flipkart/cms/fk-cms-backend/cms.log"
alias al="lf /var/log/flipkart/cms/fk-cms-backend/alarm.log"
alias bl="lf /var/log/flipkart/cms/fk-cms-backend/cms.log"
alias fl="lf /var/log/flipkart/cms/fk-cms-backend/flipkart.log"
alias sl="lf /var/log/flipkart/cms/fk-cms-service/cms-service.log"
alias sc="cd /usr/share/fk-cms-backend/scripts"
alias lsc="cd /var/cache/fk-cms-backend/schome; watch -n 5 ls -R"

alias csql="mysql -uroot cms"
alias msql="mysql -ucms_metrics -pcms_metrics cms_metrics"
alias rsql='mysql -uroot'

# General
alias mysql='/usr/bin/mysql'
alias surl='https://svn.corp.flipkart.com/svn/flipkart_dessert/branches/dev-branches'
alias conf='cd /var/lib/fk-cms-backend/conf/pf'
alias cfg='vim /var/lib/fk-cms-backend/conf/pf/appgroup/cms.cfg'

# SSH Related
alias dess='ssh dessert@192.168.3.3'
alias eng='ssh abhishekm@192.168.3.8'
alias vir='ssh abhishekm@192.168.3.11'
alias img2='ssh -i ~/.ssh/webserver.pem ubuntu@img2.flipkart.com'

for i in web1 web2 web3 web4 db1 db2 db3 db4 db5 mem1 mem2 mem3 cms2 cms3 search1 search2 search3 pentaho mnode1 mnode2 'in'
do
	alias $i="ssh abhishekm@$i.dc.flipkart.com"
done
alias cmsm='ssh abhishekm@cms.dc.flipkart.com'

for i in db1 db2 svc1 svc2 cache1
do
	alias $i="ssh cms-$i.nm.flipkart.com"
done

for i in 1 2
do
	alias ob$i="ssh ops-build-$i.nm.flipkart.com"
done

for i in 1 2
do
	alias olb$i="ssh ops-lb$i.nm.flipkart.com"
done

for i in 1 2 3 4
do
	alias sb$i="ssh sb-node$i.nm.flipkart.com"
done

for i in 1 5 10
do
	alias wa$i="watch --differences -n $i"
done


# All Functions
function slowq() {
	lines="$1"
	if [ "$lines" = "" ]; then
		lines=1000
	fi
	sudo tail $lines /var/lib/mysql/$HOST-slow.log > /tmp/$HOST.bhim.slow.query; 
	mysqlsla -lt slow /tmp/$HOST.bhim.slow.query | less
}

function solrs() {
	host="$1"
	pid="$2"
	port="9090"
	suffix=".nm.flipkart.com"
	if [ "$host" = "svc2" ]; then
		host="cms-svc2$suffix"		
		port="26300"
	fi
	if [ "$host" = "local" ]; then
		host="localhost"		
	fi
	if [ "$pid" = "" ]; then
		echo "Usage: solrs [local|svc2] AVMCSDHFFBHMSGZF";
		return;
	fi
	searchUrl="http://$host:$port/solr/select?rows=100&q=$pid&qf=id&rows=10&qt=dismax&fl=media_category,media_edition,language,product_id,title,release_year,media_format"
	curl $searchUrl | grep numFound= 
}

function ctar() {
	if [ "$1" = "" ] || [ "$2" = "" ]; then
		echo "Usage: ctar data ~/fw/backup";
		return;
	fi
	fileName=`basename $1` 
	tar -cjvf $2/$fileName.tar.gz $1
}

function cmsdump() {
	if [ "$1" = "" ]; then
		echo "Usage: cmsdump [sand|local|eng|local|vpn]";
		return;
	fi 
	cd /var/lib/fk-cms-search/
	ctar solr_data ~/fw/backup
	bu
	dateTime=`date '+%F'`
	dateTime="$dateTime.sql"
	/usr/share/fk-cms-backend/scripts/mysqldumpsmall.sh > $dateTime
	ctar $dateTime .
	bscp "$dateTime.tar.gz" $1
	bscp solr_data.tar.gz $1
}
 
function gr() {
	grep -r -n $1 * | grep -v .svn
}

function gri() {
	grep -r -n -i $1 * | grep -v .svn
}

function s1() {
	find . -name "*$1*"
}

function s2() {
	find . -name "*$1*.$2"
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

if [ -f ~/local.bhim.sh ]; then
	. ~/local.bhim.sh
fi

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

function solrs() {
host="$1"
pid="$2"
port="9090"
suffix=".nm.flipkart.com"
if [ "$host" = "svc2" ]; then
host="cms-svc2$suffix"
port="26300"
fi
if [ "$host" = "local" ]; then
host="localhost"
fi
if [ "$pid" = "" ]; then
echo "Usage: solrs [local|svc2] AVMCSDHFFBHMSGZF";
return;
fi
searchUrl="http://$host:$port/solr/select?rows=100&q=$pid&qf=id&rows=10&qt=dismax&fl=media_category,media_edition,language,product_id,title,release_year,media_format"
curl $searchUrl | grep numFound=
}

function ctar() {
if [ "$1" = "" ] || [ "$2" = "" ]; then
echo "Usage: ctar data ~/fw/backup";
return;
fi
fileName=`basename $1`
tar -cjvf $2/$fileName.tar.gz $1
}

function cmsdump() {
if [ "$1" = "" ]; then
echo "Usage: cmsdump [sand|local|eng|local|vpn]";
return;
fi
cd /var/lib/fk-cms-search/
ctar solr_data ~/fw/backup
bu
dateTime=`date '+%F'`
dateTime="$dateTime.sql"
/usr/share/fk-cms-backend/scripts/mysqldumpsmall.sh > $dateTime
ctar $dateTime .
bscp "$dateTime.tar.gz" $1
bscp solr_data.tar.gz $1
}



