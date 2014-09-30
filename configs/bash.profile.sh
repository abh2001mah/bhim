#!/bin/bash
export MY_USERNAME=abhishekmaheshwari
export MY_HOME=/Users/abhishekmaheshwari
export JAVA_HOME=`/usr/libexec/java_home`

for file in $MY_HOME/bhim/configs/exports.sh $MY_HOME/common.bashrc.sh $MY_HOME/local.bashrc.sh 
do
	if [ -f "$file" ]; then
#		echo $file
		. "$file"
	fi
done

export PS1='[\t|\W]\\$ '
export HOST=`hostname -s|cut -d'-' -f 5`
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##/*/}\007"'

case ${TERM} in
        xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix)
#                echo "this1 is $TERM"
                ;;
        screen)
#                echo "this2 is $TERM"
                PROMPT_COMMAND='echo -ne  "\033k${HOST}|${PWD##/*/}\033\\"'
                ;;
        screen-bce)
#                echo "this3 is $TERM"
                PROMPT_COMMAND='echo -ne  "\033k${HOST}|${PWD##/*/}\033\\"'
                ;;
esac

