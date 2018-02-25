#!/usr/bin/env bash

if [ -n $1 ] ; then
  gitdirs=$1
  cd $gitdirs
else
    echo "Indicate the parent folder for all of your github repositories"
    exit 1
fi

mkdir -p /tmp/gitcommit
if [ -s /tmp/gitcommit/tmp ]; then
find /tmp/gitcommit/list2 -maxdepth 1 -mmin +1 -type f > /tmp/gitcommit/tmp

if [ -s /tmp/gitcommit/tmp ]; then
  if [ -f /tmp/gitcommit/list1 ] ; then rm /tmp/gitcommit/list1; fi
  find . -name ".git" | sed 's/..//' | sed 's/\/.*$//' > /tmp/gitcommit/list
  for line in $(cat /tmp/gitcommit/list); do 
    cd $line
    for i in {45..1}; do
        git log --after="$(date -j -v-${i}d +"%Y-%m-%d %T")" --before="$(date -j -v-$(($i-1))d +"%Y-%m-%d %T")" | grep -c "jungbluth.sean"
    done > /tmp/gitcommit/${line}.tmp
    commitstoday=$(tail -1 /tmp/gitcommit/${line}.tmp)
    
    num=0
    for lines in $(cat /tmp/gitcommit/${line}.tmp); do
        num=$((num+lines))
    done
    num1=0
    for lines in $(cat /tmp/gitcommit/${line}.tmp | tail -7); do
        num1=$((num1+lines))
    done
    echo $num $num1 $commitstoday $line >> /tmp/gitcommit/list1
    cd ..
  done
  cat /tmp/gitcommit/list1 | sort -n | cut -d ' ' -f 2,1,3,4 | sed 's/ /_/g' | grep -v "^0_" > /tmp/gitcommit/list2
fi

else

 if [ -f /tmp/gitcommit/list1 ] ; then rm /tmp/gitcommit/list1; fi
  find . -name ".git" | sed 's/..//' | sed 's/\/.*$//' > /tmp/gitcommit/list
  for line in $(cat /tmp/gitcommit/list); do 
    cd $line
    for i in {45..1}; do
        git log --after="$(date -j -v-${i}d +"%Y-%m-%d %T")" --before="$(date -j -v-$(($i-1))d +"%Y-%m-%d %T")" | grep -c "jungbluth.sean"
    done > /tmp/gitcommit/${line}.tmp
    commitstoday=$(tail -1 /tmp/gitcommit/${line}.tmp)
    
    num=0
    for lines in $(cat /tmp/gitcommit/${line}.tmp); do
        num=$((num+lines))
    done
    num1=0
    for lines in $(cat /tmp/gitcommit/${line}.tmp | tail -7); do
        num1=$((num1+lines))
    done
    echo $num $num1 $commitstoday $line >> /tmp/gitcommit/list1
    cd ..
  done
  cat /tmp/gitcommit/list1 | sort -n | cut -d ' ' -f 2,1,3,4 | sed 's/ /_/g' | grep -v "^0_" > /tmp/gitcommit/list2
fi

