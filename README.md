# DB2 Inventory Database
This project is part of the 'IBM Integration Reference Architecture' suite, available at [https://github.com/ibm-cloud-architecture/refarch-integration](https://github.com/ibm-cloud-architecture/refarch-integration)

## Goals
This project supports scripts to create DB2 inventory database and load it with 12 items.

## DB2 Installation
The following steps can be done manually to create a VM with REDHAT
* Create a vm machine for a REDHAT OS
* Configure the virtual machine to start on redhat .iso file (configure DVD to point to .iso file)
* Configure REDHAT to use
* Create an admin user, and login
* Download the free version of DB2 Express C from [here](https://www-01.ibm.com/marketing/iwm/iwm/web/download.do?source=swg-db2expressc)
* Unzip the gz file under /home/admin/IBM/expc
* Login as root goes to /home/admin/IBM/expc and execute ./db2setup the wizard creates two users db2inst1 and db2fenc1
* Once installation is done login as db2inst1 and then validate your installation files, instance, and database functionality, run the Validation Tool, /opt/ibm/db2/V11.1/bin/db2val
* Create the DB2 INVDB. When a database is created, there are several objects created by default: table spaces, tables, a buffer pool and log files.
 * Table space SYSCATSPACE contains the System Catalog tables.
 * Table space TEMPSPACE1 is used by DB2 when it needs additional space to perform some operations such as sorts.
 * Table space USERSPACE1 is normally used to store user database tables if there is no table space specified when creating a table
* The OS firewall was disabled
 ```
 $ systemctl status firewalld
 $ service firewalld stop
 $ systemctl disable firewalld
 ```

## Scripts
The folder db-scripts includes shell scripts to create the INVDB and populate it.
```
$ createDB.sh
```

## DB2 command summary

|Command|Description|
|-------|---------|
|db2level|get the version of the product|
|db2licm -l|Get license info |
|db2val|Validate installation|
|db2ilist|to list instance created.  An instance is simply an independent environment where applications can run, and databases can be created. You can create multiple instances on a data server.  On Linux, an instance must match a Linux operating system user|
|db2icrt myinst|Create a new DB instance. But this is not necessary as db2inst1 is the instance created by installation. New instance means also new user created|
|db2start and db2stop|Performed while logged as db2inst1 user for example|
|db2 create database invdb|To create a database inside of the instance|
|db2 list tables for all|Get the list of all tables in the instance|
|db2 list tables for schema DB2INST1|For a given schema like db2inst1|
|db2 describe table items|See the structure of a table|
|db2 insert into <tab_name>(col1,col2,...)  values(val1,val2,..)|Insert data to table|
|db2 select id,name from items | select some columns and all rows for a given table|

## DB2 Reference material for knowledge acquisition
* [Free e-book](http://publib.boulder.ibm.com/epubs/pdf/dsncrn01.pdf)
* [dw article](https://www.ibm.com/developerworks/data/newto/db2luw-getstarted.html)
