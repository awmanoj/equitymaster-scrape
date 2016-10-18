#!/bin/bash
########################################################
#
# @author: Manoj Awasthi
#  
# Usage: nohup bash fetch.sh > report-0.txt&
#
########################################################

if [ ! -f ResearchCompanies.xml ]; then 
	echo "err: ResearchCompanies.xml file not found. Download it from equitymaster."
	exit 1
fi

URL="https://www.equitymaster.com/research-it/company-info/detailed-financial-information.asp?symbol="
STOCKS=`cat ResearchCompanies.xml | grep Symbol | awk -F'>' '{print $2}' | awk -F '<' '{print $1}'`
for STOCK in $STOCKS; do 
 curl -L $URL$STOCK 2>/dev/null > /tmp/a.d
 
 IP=`cat /tmp/a.d | grep -A 2 "Indian Promoters" | tail -1 | awk -F\> '{print $2}' | awk -F\< '{print $1}' | awk -F% '{print $1}'`
 FC=`cat /tmp/a.d | grep -A 2 "Foreign collaborators" | tail -1 | awk -F\> '{print $2}' | awk -F\< '{print $1}' | awk -F% '{print $1}'`
 IIMF=`cat /tmp/a.d | grep -A 2 "Indian inst/Mut Fund" | tail -1 | awk -F\> '{print $2}' | awk -F\< '{print $1}' | awk -F% '{print $1}'`
 FII=`cat /tmp/a.d | grep -A 2 "FIIs" | tail -1 | awk -F\> '{print $2}' | awk -F\< '{print $1}' | awk -F% '{print $1}'`
 ADR=`cat /tmp/a.d | grep -A 2 "ADR/GDR" | tail -1 | awk -F\> '{print $2}' | awk -F\< '{print $1}' | awk -F% '{print $1}'`
 FF=`cat /tmp/a.d | grep -A 2 "Free float" | tail -1 | awk -F\> '{print $2}' | awk -F\< '{print $1}' | awk -F% '{print $1}'`
 PSH=`cat /tmp/a.d | grep -A 2 "Pledged promoter(s) holding" | tail -1 | awk -F\> '{print $2}' | awk -F\< '{print $1}' | awk -F% '{print $1}'`

 echo "$STOCK|$IP,$FC,$IIMF,$FII,$ADR,$FF,$PSH"
done;
