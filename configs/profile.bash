#!/bin/bash
for file in ~/bhim/configs/exports.sh ~/common.bashrc.sh ~/local.bashrc.sh ~/bhim/configs/aws.bashrc.sh ~/bhim/configs/git-completion.bash ~/bhim/configs/gradle-completion.bash
do
	if [ -f "$file" ]; then
		. "$file"
		#echo $file
	fi
done

#export PS1='[\t|\W]\\$ '
export PS1='[\W]$'
#export HOST=`hostname -s|cut -d'-' -f 5`
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
