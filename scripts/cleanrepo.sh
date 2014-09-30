#!/bin/bash
folders=( $HOME/.m2/repository/net/sf/ehcache $HOME/.m2/repository/com/terracotta $HOME/.m2/repository/com/terracottatech $HOME/.m2/repository/org/terracotta $HOME/.m2/repository/org/quartz-scheduler )
for folder in "${folders[@]}"; do
  echo "removing local repo: $folder [y/N]?"
	read answer
	if [ "$answer" == "y" ]; then
		rm -irf $folder
	fi
done

