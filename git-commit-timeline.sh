#!/usr/bin/env bash


gitcommitchecker () {
  for line in $(cat /tmp/gitcommit/list2); do part1=$(echo $line | cut -d '_' -f 1); part2=$(echo $line | cut -d '_' -f 3); part4=$(echo $line | cut -d '_' -f 2); part3=$(echo $line | cut -d '_' -f4-); printf ${magenta}${part3}; printf "${cyan} (${part1})"; if [ ! $part4 = 0 ]; then printf "${green} (${part4})"; else printf " "; fi; printf ${yellow}; if [ ! $part2 = 0 ]; then printf "${red} (${part2})"; else printf " "; fi; if [ $part4 != 0 ] && [ $part2 == 0 ]; then printf ${green}; else printf " "; fi; printf \\n; cat /tmp/gitcommit/${part3}.tmp | spark; printf ${reset}; done
}




rungitcommitchecker () {
while true; do clear; gitcommitchecker; sleep 300; clear; done
}
