#!/bin/bash
docker run --name=db2 -p 50000:50000  -e DB2INST1_PASSWORD=d'b2inst1' -e LICENSE='accept' -v $(pwd)/db-sql:/home/db2inst1/db-sql -i ibmcom/db2express-c /bin/bash <<EOF
 su - db2inst1;
 db2start;
 cd db-sql/inventory;
 ./createDB.sh
exit
EOF
ID=$(docker ps -l|grep db2|awk '{print $1}') 
docker commit --author="IBMCASE" $ID ibmcase/browndb2
docker rm $ID