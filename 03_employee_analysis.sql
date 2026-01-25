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
