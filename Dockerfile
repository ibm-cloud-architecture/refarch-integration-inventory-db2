FROM 'ibmcom/db2express-c'
# ENV DB2INST1_PASSWORD passw0rd
ENV LICENSE accept
USER db2inst1
ENV HOME /home/db2inst1
WORKDIR /home/db2inst1
RUN mkdir inventory && mkdir customers
COPY ./db-sql/inventory/*  /home/db2inst1/inventory/
COPY ./db-sql/customers/* /home/db2inst1/customers/

# RUN su - db2inst1 && /home/db2inst1/sqllib/adm/db2start && \
# /home/db2inst1/sqllib/bin/db2 create db INVDB \
# && /home/db2inst1/sqllib/bin/db2 -tvf /home/db2inst1/inventory/create-tables.db2 -z mydb.log 
# && /home/db2inst1/sqllib/bin/db2 -tvf inventory/loaddata.db2 -z mydb.log \
# && /home/db2inst1/sqllib/bin/db2 -tvf customers/create-tables.db2 -z mydb.log \
# && /home/db2inst1/sqllib/bin/db2 -tvf customers/loaddata.db2 -z mydb.log
