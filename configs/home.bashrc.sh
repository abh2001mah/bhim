#!/bin/bash

export HISTCONTROL=erasedups
export HISTSIZE=99999

file=$HOME/common.bashrc.sh
if [ -f "$file" ]; then
	#echo $file
	. "$file"
fi

file=$HOME/local.bashrc.sh
if [ -f "$file" ]; then
	#echo $file
	. "$file"
fi

shopt -s histappend
#lm

