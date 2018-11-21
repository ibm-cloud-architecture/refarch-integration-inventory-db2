docker run --name db2 -p 50000:50000 --rm -v $(pwd)/db-sql:/home/db2inst1/db-sql \
 -v $(pwd)/db2inst1:/home/db2inst1/db2inst1 -ti ibmcase/browndb2  /bin/bash 
