#! /bin/bash
#brief: git pull from remote
#file: git-pull.sh
#author: denny, wuqifu@gmail.com
#date: 2011-01-22

SUBDIRS=`ls -d */ | grep -v 'bin'`
#SUBDIRS=gflags icethread 

do_pull()
{
 for subdir in $SUBDIRS
 do
  echo ''
  echo '--'$subdir
  #( cd $subdir; git pull ) 
  ( cd $subdir; git status && git pull ) 
 done
  echo ''
}

do_pull
echo 'git pull ok'