##Exercises Working with Multiple Tables in MySQL##
##Objectives##
##Write SQL queries that access more than one table##
##Compose queries that access multiple tables using a nested statement in the WHERE clause##
##Build queries with multiple tables in the FROM clause##
##Write Implicit Join queries with join criteria specified in the WHERE clause##
##Specify aliases for table names and qualify column names with table aliases##

##Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.##
SELECT
	*
FROM
	HR.EMPLOYEES
WHERE
	HR.EMPLOYEES.JOB_ID IN (SELECT JOB_IDENT FROM HR.JOBS);

##Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.##

SELECT
	*
FROM
	HR.EMPLOYEES
WHERE 
	JOB_ID IN (SELECT JOB_IDENT FROM HR.JOBS WHERE JOB_TITLE = 'Jr. Designer');
    
##Retrieve JOB information and who earn more than $70,000.##

SELECT
	*
FROM
	HR.JOBS
WHERE
	JOB_IDENT IN (SELECT JOB_ID FROM HR.EMPLOYEES WHERE SALARY > 70000);
    
##Retrieve JOB information and list of employees whose birth year is after 1976.##

SELECT
	*
FROM
	HR.JOBS
WHERE
	JOB_IDENT IN (SELECT JOB_ID FROM HR.EMPLOYEES WHERE YEAR(B_DATE) > 1976);
    
##Retrieve JOB information and list of female employees whose birth year is after 1976.##

SELECT
	*
FROM
	HR.JOBS
WHERE
	JOB_IDENT IN (SELECT JOB_ID FROM HR.EMPLOYEES WHERE YEAR(B_DATE) > 1976 AND SEX = 'F');
    
###Exercise 2: Accessing Multiple Tables with Implicit Joins###

##Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.##

SELECT
	*
FROM
	HR.EMPLOYEES,
    HR.JOBS;
    
##Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.##
SELECT
	*
FROM
	HR.EMPLOYEES,
    HR.JOBS
WHERE
	HR.EMPLOYEES.JOB_ID = HR.JOBS.JOB_IDENT;
    
##Redo the previous query, using shorter aliases for table names.##

SELECT
	*
FROM
	HR.EMPLOYEES E,
    HR.JOBS J
WHERE
	E.JOB_ID = J.JOB_IDENT;

##Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title.##

SELECT
	EMP_ID,
    F_NAME,
    L_NAME,
    JOB_TITLE
FROM
	HR.EMPLOYEES E,
    HR.JOBS J
WHERE
	E.JOB_ID = J.JOB_IDENT;
    
##Redo the previous query, but specify the fully qualified column names with aliases in the SELECT clause.##

SELECT
	E.EMP_ID,
    E.F_NAME,
    E.L_NAME,
    J.JOB_TITLE
FROM
	HR.EMPLOYEES E,
    HR.JOBS J
WHERE
	E.JOB_ID = J.JOB_IDENT;
    
