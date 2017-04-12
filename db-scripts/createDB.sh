#!/bin/bash 
invdb=$(db2 list db directory | grep Indirect -B 5 |grep "Database alias" |awk {'print $4'} |sort -u | uniq)
echo $invdb
if [ -z "$invdb" ] ; then 
   echo "DB: INVDB not found so let create it"
   db2 create database INVDB
   db2 -tvf ../db-sql/create-items.db2 -z mydb.log
fi
db2 "connect to INVDB"
rows=$(db2 -x "select id,name from items" |wc -l)
echo $rows
if [[ $rows -eq 0 ]]; then
 echo "There is no data in inventory DB, let add some..."
 db2 -tvf ../db-sql/loaddata.db2 -z mydb.log

fi
if [[ $rows -lt 12 ]];then
  echo "You do not have all the records"
fi
echo " Looks good now"
