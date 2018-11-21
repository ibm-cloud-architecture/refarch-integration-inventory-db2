FROM 'ibmcom/db2express-c'
ENV LICENSE accept
USER db2inst1
ENV HOME /home/db2inst1
WORKDIR /home/db2inst1
RUN mkdir /home/db2inst1/inventory && mkdir /home/db2inst1/customers
COPY ./db-sql/inventory/*  /home/db2inst1/inventory/
COPY ./db-sql/customers/* /home/db2inst1/customers/
RUN chmod +x /home/db2inst1/inventory/createDB.sh && chmod +x /home/db2inst1/customers/createDB.sh

