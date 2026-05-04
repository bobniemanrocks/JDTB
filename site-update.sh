#!/bin/sh
echo "Doing Setup"
STAGE=~/Documents/JDTB/JDTB-Staging
BASE=~/Documents/JDTB/Versions
DT=`date +"%Y-%m-%d-%H:%M:%S"`
UNAME="JDTB.${DT}"
#
echo Getting updates
#
cd ${STAGE}
tar -cvf /tmp/${UNAME} *
#
echo "Getting Baseline"
cd ${BASE}
mkdir ${UNAME}
echo "Version is ${UNAME}"
cd ${UNAME}
# 
echo "Clone Remote Repo...."
git clone git@github.com:bobniemanrocks/JDTB.git
cd JDTB
pwd
tar -xvf /tmp/${UNAME}
git remote add JDTB git@github.com:bobniemanrocks/JDTB.git
git status
git add .
git commit -m "Site-Update" -a
git push origin master
