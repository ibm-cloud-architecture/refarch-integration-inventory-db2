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
