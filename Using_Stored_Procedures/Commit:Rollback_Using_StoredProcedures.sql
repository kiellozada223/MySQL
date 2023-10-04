SHOW DATABASES;
CREATE DATABASE BANK_SHOESHOP;
USE BANK_SHOESHOP;
CREATE TABLE BankAccounts (
	AccountNumber VARCHAR(5) NOT NULL PRIMARY KEY,
    AccountName VARCHAR(25) NOT NULL,
    Balance DEC (8,2) CHECK (Balance >=0) NOT NULL
    );
    
INSERT INTO BankAccounts VALUES
	('B001','Rose',300),
	('B002','James',1345),
	('B003','Shoe Shop',124200),
	('B004','Corner Shop',76000);
    
CREATE TABLE ShoeShop (
	Product VARCHAR(25) NOT NULL PRIMARY KEY,
    Stock INT NOT NULL,
    Price DEC (8,2) CHECK (Price > 0) NOT NULL
    );

INSERT INTO ShoeShop VALUES
	('Boots',11,200),
	('High heels',8,600),
	('Brogues',10,150),
	('Trainers',14,300);
    
##Objectives##
##After completing this lab, you will be able to:##
##Permanently save the changes done in a transaction##
##Undo the transaction that has not been saved##


##Create a stored procedure routine named TRANSACTION_ROSE which will include TCL commands like COMMIT and ROLLBACK.##
##Now develop the routine based on the given scenario to execute a transaction.##
##Scenario: Let’s buy Rose a pair of Boots from ShoeShop. ##
##So we have to update the Rose balance as well as the ShoeShop balance in the BankAccounts table. ##
##Then we also have to update Boots stock in the ShoeShop table. ##
##After Boots, let’s also attempt to buy Rose a pair of Trainers.##

DELIMITER //

CREATE PROCEDURE TRANSACTION_ROSE()

BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        RESIGNAL;
	END;
    
    START TRANSACTION;
    UPDATE BankAccounts
    SET Balance = Balance - 200
    WHERE AccountName = 'Rose';
    
    UPDATE BankAccounts
    SET Balance = Balance + 200
    WHERE AccountName = 'Shoe Shop';
    
    UPDATE ShoeShop
    SET Stock = Stock - 1
    WHERE Product = 'Boots';
    
    COMMIT;
    
END //

DELIMITER ;

SET SQL_SAFE_UPDATES = 0;
SHOW TABLES;
CALL TRANSACTION_ROSE;

SELECT * FROM BANK_SHOESHOP.BankAccounts;
SELECT * FROM BANK_SHOESHOP.ShoeShop;

DELIMITER //

CREATE PROCEDURE TRANSACTION_JAMES()

BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        RESIGNAL;
	END;
    
    START TRANSACTION;
    
    UPDATE BankAccounts
    SET Balance = Balance - 1200
    WHERE AccountName = 'James';
    
    UPDATE BankAccounts
    SET Balance = Balance + 1200
    WHERE AccountName = 'Shoe Shop';
    
    UPDATE ShoeShop
    SET Stock = Stock - 4
    WHERE Product = 'Trainers';
    
    COMMIT;
    
END //

DELIMITER ;

CALL TRANSACTION_JAMES;

SELECT * FROM BankAccounts;
SELECT * FROM ShoeShop;

