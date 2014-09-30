#!/bin/bash
#set -x
set -e

if [ "$1" = "compile" ] 
then
	cd ../catalog-manager
	mvn -DskipTests clean install 
	cd -
fi
 
if [ "$2" = "cpwar" ] 
then
	mvn -DskipTests clean install
	rm -rf /opt/tomcat/webapps/cms* 
	cp target/cms*.war /opt/tomcat/webapps/cms.war
fi

