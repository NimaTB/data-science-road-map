/* 
INSERT INTO (VALUES), UPDATE (SET), DELETE
*/


.open example.db
.mode column
.header on 

SELECT * FROM dependents;

-- If we don't comment the following, we'll get the following error 
-- error: UNIQUE constraint failed: dependents.dependent_id
/*
INSERT INTO dependents (dependent_id, 
						first_name, 
						last_name,
						relationship,
						employee_id)

--VALUES (31, 'Isaac', 'Faber', 'Child', 176),
--	(31, 'Isaac', 'Faber', 'Child', 176);
*/

VALUES (31, 'Isaac', 'Faber', 'Child', 176);

UPDATE dependents 
SET last_name = 'Smith' 
WHERE first_name = 'Isaac';


SELECT * FROM dependents;



DELETE FROM dependents 
WHERE first_name = 'Isaac';


SELECT * FROM dependents;

/*
We can store complicated queries to be used later 
CREATE VIEW view_name AS 
SELECT * FROM view_name 
DROP VIEW
*/

-- Getting the department ids based on the sorted ave_salary
SELECT e.department_id, 
	   ROUND(AVG(e.salary),0) avg_salary,
	   d.department_name
	FROM employees e
	INNER JOIN departments d ON e.department_id = d.department_id
	GROUP BY e.department_id
	ORDER BY e.salary DESC;
-- If above is a frequently query, I can save this as:

CREATE VIEW salary_report AS 
SELECT e.department_id, 
	   ROUND(AVG(e.salary),0) avg_salary,
	   d.department_name
	FROM employees e
	INNER JOIN departments d ON e.department_id = d.department_id
	GROUP BY e.department_id
	ORDER BY e.salary DESC;

.schema	

SELECT * from salary_report
WHERE avg_salary>9000;

-- We can DROP a VIEW as follows:

/*
DROP VIEW salary_report;

.schema	
*/

CREATE VIEW salary_report_all AS 
SELECT e.department_id, 
	   ROUND(AVG(e.salary),0) avg_salary,
	   ROUND(MIN(e.salary),0) min_salary,
	   ROUND(MAX(e.salary),0) max_salary,
	   d.department_name
	FROM employees e
	INNER JOIN departments d ON e.department_id = d.department_id
	GROUP BY e.department_id
	ORDER BY e.salary DESC;