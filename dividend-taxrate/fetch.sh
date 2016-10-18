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
 DP12=`cat /tmp/a.d|grep -A 1 "Dividend payout" |tail -1 |awk -F'<td' '{print $3}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`
 DP13=`cat /tmp/a.d|grep -A 1 "Dividend payout"|tail -1|awk -F'<td' '{print $4}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`
 DP14=`cat /tmp/a.d|grep -A 1 "Dividend payout"|tail -1|awk -F'<td' '{print $5}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`
 DP15=`cat /tmp/a.d|grep -A 1 "Dividend payout"|tail -1|awk -F'<td' '{print $6}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`
 DP16=`cat /tmp/a.d|grep -A 1 "Dividend payout"|tail -1|awk -F'<td' '{print $7}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`

 re='^-?[0-9]+([.][0-9]+)?$'
 if ! [[ $DP12 =~ $re ]]; then 
 	DP12=0
 fi

 if ! [[ $DP13 =~ $re ]]; then 
 	DP13=0
 fi

 if ! [[ $DP14 =~ $re ]]; then 
 	DP14=0
 fi

 if ! [[ $DP15 =~ $re ]]; then 
 	DP15=0
 fi

 if ! [[ $DP16 =~ $re ]]; then 
 	DP16=0
 fi

 TR12=`cat /tmp/a.d|grep -A 1 "Effective tax rate"|tail -1|awk -F'<td' '{print $3}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`
 TR13=`cat /tmp/a.d|grep -A 1 "Effective tax rate"|tail -1|awk -F'<td' '{print $4}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`
 TR14=`cat /tmp/a.d|grep -A 1 "Effective tax rate"|tail -1|awk -F'<td' '{print $5}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`
 TR15=`cat /tmp/a.d|grep -A 1 "Effective tax rate"|tail -1|awk -F'<td' '{print $6}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`
 TR16=`cat /tmp/a.d|grep -A 1 "Effective tax rate"|tail -1|awk -F'<td' '{print $7}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`

 if ! [[ $TR12 =~ $re ]]; then 
 	TR12=0
 fi

 if ! [[ $TR13 =~ $re ]]; then 
 	TR13=0
 fi

 if ! [[ $TR14 =~ $re ]]; then 
 	TR14=0
 fi

 if ! [[ $TR15 =~ $re ]]; then 
 	TR15=0
 fi

 if ! [[ $TR16 =~ $re ]]; then 
 	TR16=0
 fi

 if [ -z "$DP12" ]; then 
	DP12="0"
 fi

 if [ -z "$DP13" ]; then 
	DP13="0"
 fi

 if [ -z "$DP14" ]; then 
	DP14="0"
 fi

 if [ -z "$DP15" ]; then 
	DP15="0"
 fi

 if [ -z "$DP16" ]; then 
	DP16="0"
 fi

 if [ -z "$TR12" ]; then 
	TR12="0"
 fi

 if [ -z "$TR13" ]; then 
	TR13="0"
 fi

 if [ -z "$TR14" ]; then 
	TR14="0"
 fi

 if [ -z "$TR15" ]; then 
	TR15="0"
 fi

 if [ -z "$TR16" ]; then 
	TR16="0"
 fi

 echo "$STOCK|$DP12,$DP13,$DP14,$DP15,$DP16|$TR12,$TR13,$TR14,$TR15,$TR16"
done;
