#!/usr/bin/env bash


function gitcommitchecker () {
  if [[ $# -eq 0 ]] ; then
    echo 'Indicate the parent folder for git repositories'
  else
    rm -rf ~/.tmp/gitcommit &> /dev/null && mkdir -p ~/.tmp/gitcommit
    find ${1} -name ".git" | awk -F "/" '{print $4}' > ~/.tmp/gitcommit/list
    for line in $(cat ~/.tmp/gitcommit/list); do
      cd $line
      for i in {45..1}; do
        git log --after="$(/bin/date -j -v-${i}d +"%Y-%m-%d %T")" --before="$(/bin/date -j -v-$(($i-1))d +"%Y-%m-%d %T")" | grep -c "jungbluth" #need to fix how date is done
      done > ~/.tmp/gitcommit/${line}.tmp
      commitstoday=$(tail -1 ~/.tmp/gitcommit/${line}.tmp)
      num=0
      for lines in $(cat ~/.tmp/gitcommit/${line}.tmp); do
        num=$((num+lines))
      done
      num1=0
      for lines in $(cat ~/.tmp/gitcommit/${line}.tmp | tail -7); do
        num1=$((num1+lines))
      done
      echo $num $num1 $commitstoday $line >> ~/.tmp/gitcommit/list1
      cd ..
    done 2> /dev/null
    cat ~/.tmp/gitcommit/list1 | sort -n | cut -d ' ' -f 2,1,3,4 | sed 's/ /_/g' | grep -v "^0_" > ~/.tmp/gitcommit/list2
    for line in $(cat ~/.tmp/gitcommit/list2); do part1=$(echo $line | cut -d '_' -f 1); part2=$(echo $line | cut -d '_' -f 3); part4=$(echo $line | cut -d '_' -f 2); part3=$(echo $line | cut -d '_' -f4-); printf ${magenta}${part3}; printf "${cyan} (${part1})"; if [ ! $part4 = 0 ]; then printf "${green} (${part4})"; else printf " "; fi; printf ${yellow}; if [ ! $part2 = 0 ]; then printf "${red} (${part2})"; else printf " "; fi; if [ $part4 != 0 ] && [ $part2 == 0 ]; then printf ${green}; else printf " "; fi; printf \\n; cat ~/.tmp/gitcommit/${part3}.tmp | spark; printf ${reset}; done
  fi
}


function rungitcommitchecker () {
  while true; do clear; gitcommitchecker /Applications/ResearchSoftware; sleep 600; clear; done
}
