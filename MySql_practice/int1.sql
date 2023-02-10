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