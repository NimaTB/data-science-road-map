-- SELECT FRMO LIMIT WHERE
/*

.mode column
.headers on
.shell cls -- clear the SQLlite

= equal
<> not equal 
>, <, <=, >= 
BETWEEN
LIKE 
IN () -> set
*/



SELECT * FROM countries;

SELECT country_id, country_name
	FROM countries; 

SELECT * FROM countries LIMIT 10; 


SELECT * FROM employees LIMIT 10;


SELECT * FROM employees WHERE manager_id = 100; 

SELECT first_name, hire_date 
	FROM employees WHERE hire_date >= '1994-08-17';

SELECT * FROM countries WHERE region_id IN (1,3);

SELECT * FROM countries WHERE region_id BETWEEN 1 AND 3;

SELECT * FROM countries WHERE country_name LIKE 'M%';

SELECT * FROM countries WHERE country_name LIKE '%M';

SELECT * FROM countries WHERE country_name LIKE '%M%';

SELECT * FROM countries WHERE country_name LIKE '_e%';

SELECT * FROM countries WHERE country_name LIKE '_n%';

/*
AND OR NOT EXISTS (subqueries T/F if any rows exist)
IS NULL, IS NOT NULL
*/
SELECT * FROM countries 
	WHERE country_name LIKE '_r%'
	AND region_id = 2;

SELECT * FROM countries 
	WHERE country_name LIKE '_r%'
	OR region_id = 2;

SELECT * FROM countries 
	WHERE country_name NOT LIKE '_r%'
	OR region_id = 2;


SELECT * FROM countries 
	WHERE 
	EXISTS (SELECT * FROM countries
	WHERE country_name NOT LIKE '_r%'
	OR region_id = 2);

SELECT * FROM employees 
	WHERE phone_number IS NOT null; 

SELECT * FROM employees 
	WHERE phone_number IS null; 


/*
ORDER BY (ACS, DESC)
DISTINCT
*/

SELECT first_name, salary FROM employees 
	ORDER BY first_name, salary;

SELECT first_name, salary FROM employees 
	ORDER BY  salary, first_name;

SELECT first_name, salary FROM employees 
	ORDER BY  salary ASC;

SELECT first_name, salary FROM employees 
	ORDER BY  salary DESC;	

SELECT DISTINCT  salary FROM employees 
	ORDER BY  salary DESC;	
