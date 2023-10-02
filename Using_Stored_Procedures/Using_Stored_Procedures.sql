SHOW DATABASES;
USE PETSALE;
SHOW TABLES;
CREATE TABLE PETSALE (
	ID INT NOT NULL PRIMARY KEY,
    ANIMAL VARCHAR(20),
    SALEPRICE DEC (6,2),
    SALEDATE DATE,
    QUANTITY INT
    );

INSERT INTO PETSALE VALUES
	(1,'Cat',450.09,'2018-05-29',9),
	(2,'Dog',666.66,'2018-06-01',3),
	(3,'Parrot',50.00,'2018-06-04',2),
	(4,'Hamster',60.60,'2018-06-11',6),
	(5,'Goldfish',48.48,'2018-06-14',24);
    
SELECT * FROM PETSALE;

DELIMITER //

CREATE PROCEDURE RETRIEVE_ALL ()
BEGIN
	SELECT * FROM PETSALE;
END //
DELIMITER ;

CALL RETRIEVE_ALL;

DELIMITER @
CREATE PROCEDURE UPDATE_SALEPRICE (IN ANIMAL_ID INT, IN ANIMAL_HEALTH VARCHAR(10))

BEGIN

	IF ANIMAL_HEALTH = 'BAD' THEN
		UPDATE PETSALE
		SET SALEPRICE = SALEPRICE - (SALEPRICE * 0.25)
		WHERE ID = ANIMAL_ID;

	ELSEIF ANIMAL_HEALTH = 'WORSE' THEN
		UPDATE PETSALE
		SET SALEPRICE = SALEPRICE - (SALEPRICE * 0.5)
		WHERE ID = ANIMAL_ID;

	ELSE
		UPDATE PETSALE
		SET SALEPRICE = SALEPRICE
		WHERE ID = ANIMAL_ID;
    
    END IF;
    
END @

DELIMITER ;

CALL UPDATE_SALEPRICE(1, 'BAD');
CALL RETRIEVE_ALL;

CALL UPDATE_SALEPRICE(3, 'WORSE');
CALL RETRIEVE_ALL;