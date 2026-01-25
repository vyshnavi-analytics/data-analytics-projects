SELECT e.name, e.salary, e.department, d.manager_name
FROM employees e
JOIN departments d
ON e.department = d.department_name;
