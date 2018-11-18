#!/usr/bin/env bash


gitcommitchecker () {
	##the next three lines are commented out because they include variables specific to my setup; however, this is a catch to ensure that the 'list2' file exists
  #if [ ! -s /tmp/gitcommit/list2 ]; then
	#  $SOFTWAREPATH/git-commit-timeline/fetch-git-info.sh $SOFTWAREPATH
  #fi
  for line in $(cat /tmp/gitcommit/list2); do part1=$(echo $line | cut -d '_' -f 1); part2=$(echo $line | cut -d '_' -f 3); part4=$(echo $line | cut -d '_' -f 2); part3=$(echo $line | cut -d '_' -f4-); printf ${magenta}${part3}; printf "${cyan} (${part1})"; if [ ! $part4 = 0 ]; then printf "${green} (${part4})"; else printf " "; fi; printf ${yellow}; if [ ! $part2 = 0 ]; then printf "${red} (${part2})"; else printf " "; fi; if [ $part4 != 0 ] && [ $part2 == 0 ]; then printf ${green}; else printf " "; fi; printf \\n; cat /tmp/gitcommit/${part3}.tmp | spark; printf ${reset}; done
}




rungitcommitchecker () {
  while true; do clear; gitcommitchecker; sleep 1200; clear; done
}
