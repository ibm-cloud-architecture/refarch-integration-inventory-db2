#!/bin/bash

# Get the list of databases
invdb=$(db2 list db directory | grep Indirect -B 5 |grep "Database alias" |awk {'print $4'} |grep "INVDB")
echo $invdb
if [ -z "$invdb" ] ; then
   echo "DB: INVDB not found so let create it"
   db2 create database INVDB
   db2 -tvf ../db-sql/create-tables.db2 -z mydb.log
fi
db2 "connect to INVDB"
db2 -x "select id,name from items" |wc -l >> xx
read rows < xx
echo $rows
rm xx
if [[ $rows -eq 0 ]]; then
 echo "There is no data in inventory DB, let add some..."
 db2 -tvf ../db-sql/loaddata.db2 -z mydb.log

fi
if [[ $rows -lt 12 ]];then
  echo "You do not have all the records"
else
  echo "Good your db is up and populated"
fi
