INSERT INTO MYSQL_LEARNER.PETSALE
VALUES
	(1,'Cat',450.09,100.47,'2018-05-29'),
    (2,'Dog',666.66,150.76,'2018-06-01'),
    (3,'Parrot',50.00,8.9,'2018-06-04'),
    (4,'Hamster',60.60,12,'2018-06-11'),
    (5,'Goldfish',48.48,3.5,'2018-06-14');

SELECT * FROM MYSQL_LEARNER.PETSALE;

ALTER TABLE MYSQL_LEARNER.PETSALE
	ADD COLUMN QUANTITY INT;

SELECT * FROM MYSQL_LEARNER.PETSALE;

UPDATE MYSQL_LEARNER.PETSALE
	SET QUANTITY = 9 WHERE ID = 1;

SET SQL_SAFE_UPDATES =  0;

UPDATE MYSQL_LEARNER.PETSALE
	SET QUANTITY = 9 WHERE ID = 1;

SELECT * FROM MYSQL_LEARNER.PETSALE;

UPDATE MYSQL_LEARNER.PETSALE SET QUANTITY = 3 WHERE ID = 2;
UPDATE MYSQL_LEARNER.PETSALE SET QUANTITY = 2 WHERE ID = 3;
UPDATE MYSQL_LEARNER.PETSALE SET QUANTITY = 6 WHERE ID = 4;
UPDATE MYSQL_LEARNER.PETSALE SET QUANTITY = 24 WHERE ID = 5;

SELECT * FROM MYSQL_LEARNER.PETSALE;

ALTER TABLE MYSQL_LEARNER.PETSALE
	DROP COLUMN PROFIT;
    
SELECT * FROM MYSQL_LEARNER.PETSALE;

ALTER TABLE MYSQL_LEARNER.PETSALE
	CHANGE PET PET VARCHAR(20);
    
ALTER TABLE MYSQL_LEARNER.PETSALE
	CHANGE PET ANIMAL VARCHAR(20);
    
SELECT * FROM MYSQL_LEARNER.PETSALE;