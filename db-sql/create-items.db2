create table items 
(
 id INTEGER NOT NULL,
 name VARCHAR(100) NOT NULL,
 description VARCHAR(1000) NOT NULL,
 price DECIMAL(8,2) NOT NULL,
 img_alt VARCHAR(75),
 img VARCHAR(50) NOT NULL,
 quantity DECIMAL
);
COMMIT;
