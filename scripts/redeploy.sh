#!/bin/bash
#set -x
set -e

if [ "$1"  = "update" ]
then
	svn up ..
fi

if [ -z "$2" -o "$2" = "compile" ] 
then
	cd ../catalog-manager
	mvn -DskipTests clean install 

	cd -
fi

mvn -DskipTests clean install 

/opt/tomcat/bin/catalina.sh stop -force || echo "Tomcat was not running"

rm -rf /opt/tomcat/webapps/cms* 
cp target/cms*.war /opt/tomcat/webapps/cms.war

rm -f /opt/tomcat/logs/catalina.out
/opt/tomcat/bin/catalina.sh start

sleep 2

less /opt/tomcat/logs/catalina.out

less /var/log/flipkart/cms.log
ps auxwww | grep Dcatalina.home=
