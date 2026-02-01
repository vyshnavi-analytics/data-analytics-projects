-- 1. Salary classification
SELECT name, salary,
CASE
    WHEN salary >= 70000 THEN 'High'
    WHEN salary BETWEEN 50000 AND 69999 THEN 'Medium'
    ELSE 'Low'
END AS salary_category
FROM employees;

-- 2. Average salary by department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- 3. Departments paying above company average
SELECT department
FROM employees
GROUP BY department
HAVING AVG(salary) >
(
    SELECT AVG(salary)
    FROM employees
);
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department;
SELECT e.name, e.salary, e.department
FROM employees e
JOIN (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
) d
ON e.department = d.department
WHERE e.salary > d.avg_salary;
WITH dept_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT e.name, e.salary, e.department
FROM employees e
JOIN dept_avg d
ON e.department = d.department
WHERE e.salary > d.avg_salary;
SELECT name, department, salary,
RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM employees;
SELECT name,
EXTRACT(YEAR FROM AGE(CURRENT_DATE, joining_date)) AS experience_years
FROM employees;
