# This is an example of how to connect to the Inventory data base using python and DB2 api.
import ibm_db
ibm_db.connect("DATABASE=INVDB;HOSTNAME=localhost;PORT=50000;PROTOCOL=TCPIP;UID=db2inst1;PWD=password")