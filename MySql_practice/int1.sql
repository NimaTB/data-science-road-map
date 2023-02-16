/*
aggregate functions

COUNT, SUM, AVG, MIN, MAX 
GROUP BY
also useful ROUND

*/

.open example.db
.mode column
.header on 

SELECT * FROM employees;

SELECT COUNT(*) FROM employees;

SELECT SUM(salary) FROM employees;

SELECT MIN(salary) FROM employees;

SELECT MAX(salary) FROM employees;

SELECT AVG(salary) FROM employees;

SELECT ROUND(AVG(salary),0) FROM employees;

SELECT department_id, AVG(salary) 
	FROM employees
	GROUP BY department_id;


SELECT department_id, ROUND(AVG(salary),0) avg_salary
	FROM employees
	GROUP BY department_id
	ORDER BY salary DESC;


/*
JOIN
	INNER
	LEFT/RIGHT
	FULL OUTER

*/

SELECT department_id, 
	   ROUND(AVG(salary),0) avg_salary
	FROM employees
	GROUP BY department_id
	ORDER BY salary DESC;

-- To get department name

SELECT e.department_id, 
	   ROUND(AVG(e.salary),0) avg_salary,
	   d.department_name,
	   l.state_province
	FROM employees e
	INNER JOIN departments d ON e.department_id = d.department_id
	INNER JOIN locations l ON d.location_id = l.location_id
	GROUP BY e.department_id
	ORDER BY e.salary DESC;

SELECT e.department_id, 
	   ROUND(AVG(e.salary),0) avg_salary,
	   d.department_name,
	   l.state_province
	FROM employees e
	INNER JOIN departments d ON e.department_id = d.department_id
	LEFT JOIN locations l ON d.location_id = l.location_id
	GROUP BY e.department_id
	ORDER BY e.salary DESC;	


/* 
WITH and subqueries
*/

SELECT * FROM departments
	WHERE location_id =1700;

SELECT * FROM employees WHERE department_id IN
	(SELECT department_id FROM departments
	WHERE location_id =1700);


SELECT * FROM employees WHERE department_id NOT IN
	(SELECT department_id FROM departments
	WHERE location_id =1700);


WITH dep_ids as (SELECT department_id FROM departments
	WHERE location_id =1700)

SELECT * FROM employees WHERE department_id NOT IN dep_ids;












