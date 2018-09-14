CREATE TABLE ACCOUNTS (
  accountNumber VARCHAR(50) NOT NULL, 
  balance DECIMAL(8,2),
  dropped INTEGER, 
  international DECIMAL, 
  local DECIMAL(8,2), 
  localBillType VARCHAR(30), 
  longDistance DECIMAL, 
  longDistanceBillType VARCHAR(50), 
  paymentMethod VARCHAR(10), 
  ratePlan VARCHAR(10), 
  usage DECIMAL(8,2),
  creationDate TIMESTAMP, 
  updateDate TIMESTAMP, 
  PRIMARY KEY (accountNumber));


CREATE TABLE CUSTOMERS 
(id INTEGER NOT NULL, 
 name VARCHAR(100) NOT NULL, 
 firstName VARCHAR(50) NOT NULL, 
 lastName VARCHAR(50) NOT NULL, 
 emailAddress VARCHAR(150), 
 status VARCHAR(20), 
 type VARCHAR(10), 
 age INTEGER, 
 carOwner SMALLINT, 
 children INTEGER, 
 estimatedIncome DOUBLE, 
 churn VARCHAR(20), 
 churnRisk  DECIMAL(8,2),
 gender VARCHAR(10), 
 maritalStatus  VARCHAR(50), 
 mostDominantTone VARCHAR(50), 
 profession VARCHAR(100), 
  zipcode VARCHAR(20), 
 creationDate TIMESTAMP, 
 updateDate TIMESTAMP, 
 ACCOUNT_ACCOUNTNUMBER VARCHAR(20),
 PRIMARY KEY (id)) 
 
  CREATE INDEX I_CUSTOMER_ACCOUNT 
    ON CUSTOMERS (ACCOUNT_ACCOUNTNUMBER);
    
 
CREATE TABLE PRODUCTS (
  name VARCHAR(20) NOT NULL, 
  downloadSpeed INTEGER, 
  monthlyUsage INTEGER, 
  packageName VARCHAR(50), 
  price  DECIMAL(8,2), 
  productCategory VARCHAR(50), 
  creationDate TIMESTAMP, 
  updateDate TIMESTAMP, 
  PRIMARY KEY (name)) 

CREATE TABLE CUSTOMERS_PRODUCTS (CUSTOMERID BIGINT NOT NULL,
        productName VARCHAR(20) NOT NULL, 
        phoneNumber VARCHAR(20), 
        CUSTOMER_ID BIGINT,
        OWNEDPRODUCTS_NAME VARCHAR(20),
        PRIMARY KEY (CUSTOMERID, productName)) 

 CREATE INDEX I_CSTMCTS_CUSTOMER 
    ON CUSTOMERS_PRODUCTS (CUSTOMER_ID) 
 
 CREATE INDEX I_CSTMCTS_PRODUCT 
    ON CUSTOMERS_PRODUCTS (OWNEDPRODUCTS_NAME) 
    
COMMIT;
