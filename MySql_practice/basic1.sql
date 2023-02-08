-- SELECT FRMO LIMIT WHERE
/*

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