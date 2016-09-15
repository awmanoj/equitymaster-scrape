URL="https://www.equitymaster.com/research-it/company-info/detailed-financial-information.asp?symbol="
STOCKS=`cat ResearchCompanies.xml | grep Symbol | awk -F'>' '{print $2}' | awk -F '<' '{print $1}'`
for STOCK in $STOCKS; do 
 curl -L $URL$STOCK 2>/dev/null > /tmp/a.d
 ROE12=`cat /tmp/a.d|grep "Return on equity"|tail -1|awk -F'<td' '{print $3}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`
 ROE13=`cat /tmp/a.d|grep "Return on equity"|tail -1|awk -F'<td' '{print $4}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`
 ROE14=`cat /tmp/a.d|grep "Return on equity"|tail -1|awk -F'<td' '{print $5}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`
 ROE15=`cat /tmp/a.d|grep "Return on equity"|tail -1|awk -F'<td' '{print $6}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`
 ROE16=`cat /tmp/a.d|grep "Return on equity"|tail -1|awk -F'<td' '{print $7}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`

 DE12=`cat /tmp/a.d|grep "Debt to equity ratio"|tail -1|awk -F'<td' '{print $3}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`
 DE13=`cat /tmp/a.d|grep "Debt to equity ratio"|tail -1|awk -F'<td' '{print $4}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`
 DE14=`cat /tmp/a.d|grep "Debt to equity ratio"|tail -1|awk -F'<td' '{print $5}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`
 DE15=`cat /tmp/a.d|grep "Debt to equity ratio"|tail -1|awk -F'<td' '{print $6}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`
 DE16=`cat /tmp/a.d|grep "Debt to equity ratio"|tail -1|awk -F'<td' '{print $7}'|awk -F'>' '{print $2}'|awk -F'<' '{print $1}'`

 if [ -z "$ROE12" ]; then 
	ROE12="0"
 fi

 if [ -z "$ROE13" ]; then 
	ROE13="0"
 fi

 if [ -z "$ROE14" ]; then 
	ROE14="0"
 fi

 if [ -z "$ROE15" ]; then 
	ROE15="0"
 fi

 if [ -z "$ROE16" ]; then 
	ROE16="0"
 fi

 if [ -z "$DE12" ]; then 
	DE12="0"
 fi

 if [ -z "$DE13" ]; then 
	DE13="0"
 fi

 if [ -z "$DE14" ]; then 
	DE14="0"
 fi

 if [ -z "$DE15" ]; then 
	DE15="0"
 fi

 if [ -z "$DE16" ]; then 
	DE16="0"
 fi


 echo "$STOCK|$ROE12,$ROE13,$ROE14,$ROE15,$ROE16|$DE12,$DE13,$DE14,$DE15,$DE16"
done;
