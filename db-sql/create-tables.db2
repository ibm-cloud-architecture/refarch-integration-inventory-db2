create table items
(
 id INTEGER NOT NULL,
 name VARCHAR(100) NOT NULL,
 description VARCHAR(5000),
 price DECIMAL(8,2),
 img_alt VARCHAR(200),
 img VARCHAR(200),
 model VARCHAR(50),
 serialNumber VARCHAR(50),
 producttype VARCHAR(50),
 CREATIONDATE TIMESTAMP,
 UPDATEDATE TIMESTAMP,
 PRIMARY KEY (id)
);


create table inventory
(
 id INTEGER NOT NULL, 
 item  INTEGER NOT NULL, 
 site VARCHAR(50) NOT NULL, 
 quantity DECIMAL,
 CREATIONDATE TIMESTAMP,
 UPDATEDATE TIMESTAMP,
 PRIMARY KEY (id)
);

CREATE TABLE SUPPLIERS (
 	id INTEGER NOT NULL, 
 	creationDate TIMESTAMP, 
 	name VARCHAR(100) NOT NULL, 
 	status VARCHAR(20), 
 	type VARCHAR(20),
 	updateDate TIMESTAMP, 
 	city VARCHAR(50), 
 	state VARCHAR(50),
    street VARCHAR(255), 
    zipcode VARCHAR(10), 
    PRIMARY KEY (id)) 
);
CREATE TABLE supplier_delivers_item (SUPPLIERS_ID INTEGER, ITEMS_ID INTEGER) ;

COMMIT;
