## GROUPING EXERCISE ##

##For each department ID retrieve the number of employees in the department.##

SELECT
	DEP_ID,
	COUNT(*) AS "NUMBER OF EMPLOYEES"
FROM
	HR.EMPLOYEES
GROUP BY
	DEP_ID;
    
##For each department retrieve the number of employees in the department,##
##and the average employee salary in the department##
##Label the computed columns in the result set "NUMBER OF EMPLOYEES" and "AVERAGE SALARY" ##

SELECT
	DEP_ID,
    COUNT(*) AS "NUMBER OF EMPLOYEES",
    ROUND(AVG(SALARY),2) AS "AVERAGE SALARY"
FROM
	HR.EMPLOYEES
GROUP BY
	DEP_ID;
  
##In SQL problem 2, order the result set by Average Salary..##

SELECT
	DEP_ID,
	COUNT(*) AS "NUMBER OF EMPLOYEES",
	ROUND(AVG(SALARY),2) AS "AVERAGE SALARY"
FROM
	HR.EMPLOYEES
GROUP BY DEP_ID
ORDER BY AVG(SALARY);

## Limit the result to departments with fewer than 4 employees. ##

SELECT
	DEP_ID,
    COUNT(*) AS "NUMBER OF EMPLOYEES",
    ROUND(AVG(SALARY),2) AS "AVERAGE SALARY"
FROM
	HR.EMPLOYEES
GROUP BY
	DEP_ID
HAVING
	COUNT(*) < 4
ORDER BY
	AVG(SALARY);





