Nested Loop Join (Code Samples)
/* Nested loop join example */
SELECT * FROM employees e JOIN departments d
ON d.department_id = e.department_id
WHERE d.department_id = 60;
 
/* Even if we change the join order and on clause order, the plan did not change */
SELECT * FROM departments d JOIN employees e 
ON e.department_id = d.department_id
WHERE d.department_id = 60;
 
/* We can use leading hint to change the driving table */
SELECT /*+ leading(e) */ * FROM employees e JOIN departments d
ON d.department_id = e.department_id
WHERE d.department_id = 60;
 
/* Does not use nested loop without hint */
SELECT * FROM employees e JOIN departments d
ON d.department_id = e.department_id;
 
/* Using nested loop hint */
SELECT /*+ use_nl(d e) */ * FROM employees e JOIN departments d
ON d.department_id = e.department_id;
 
/* Nested loop prefetching and double nested loops example */
SELECT e.employee_id,e.last_name,d.department_id,d.department_name 
FROM employees e JOIN departments d
ON d.department_id = e.department_id
WHERE d.department_name LIKE 'A%';




-- Sort Merge Join (Code Samples)
/* Sort Merge Join example */
SELECT * FROM employees e JOIN departments d
ON d.department_id = e.department_id
WHERE e.last_name like 'K%';
 
/* Force it to use Nested Loop Join */
SELECT /*+ use_nl(e d) */* FROM employees e JOIN departments d
ON d.department_id = e.department_id
WHERE e.last_name like 'K%';
 
/* Another Sort Merge Join example */
SELECT * FROM employees e JOIN departments d
ON d.department_id = e.department_id
WHERE d.manager_id > 110;
 
/* Equality Operator prevented Sort Merge Join */
SELECT * FROM employees e JOIN departments d
ON d.department_id = e.department_id
WHERE d.manager_id = 110;
 
/* Using Sort Merge Join Hint*/
SELECT /*+ use_merge(e d) */* FROM employees e JOIN departments d
ON d.department_id = e.department_id
WHERE d.manager_id = 110;



CODE: Hash Joins
GRANT select_catalog_role TO hr;
GRANT SELECT ANY DICTIONARY TO hr;
 
SELECT * FROM employees e, departments d
WHERE d.department_id = e.department_id
AND d.manager_id = 110;
 
SELECT /*+ use_hash(d e) */ * FROM employees e, departments d
WHERE d.department_id = e.department_id
AND d.manager_id = 110;


CODE: Cartesian Joins
SELECT * FROM employees e, departments d
WHERE d.manager_id = 110;
 
SELECT * FROM customers, sales;


CODE: Equijoins & Nonequijoins
/* Equijoin example */
select * from employees e, departments d
where e.department_id = d.department_id;
 
/* Nonequijoin example */
select * from employees e, jobs j
where e.salary between j.min_salary and j.max_salary;

CODE: Outer Joins
select * from employees e right outer join departments d
  using(department_id);
 
select * from departments d left outer join employees e
  using(department_id);
 
select * from employees e left outer join departments d
  using(department_id);
 
select * from departments d right outer join employees e
  using(department_id);
  
select /*+ USE_MERGE(e d) */* from employees e left outer join departments d
  using(department_id);
 
select /*+ USE_NL(e d) */* from employees e left outer join departments d
  using(department_id);
 
select /*+ USE_NL(d e) */* from employees e right outer join departments d
  using(department_id);
 
select * from employees e full outer join departments d
  using(department_id);
 
select * from employees e, departments d
  where e.department_id = d.department_id(+);
 
select * from employees e, departments d
  where e.department_id(+) = d.department_id(+);
 
select * from employees e left outer join departments d
  using(department_id)
  union
select * from employees e right outer join departments d
  using(department_id);

  CODE: Semijoins
select * from departments d where exists
  (select 1 from employees e where d.department_id = e.department_id);
  
select * from departments d where department_id in
  (select department_id from employees e where d.department_id = e.department_id);
 
select * from employees e where exists
  (select 1 from departments d where d.department_id = e.department_id);

  CODE: Antijoins
SELECT * FROM departments d WHERE department_id NOT IN
  (SELECT department_id FROM employees e WHERE d.department_id = e.department_id);
 
SELECT * FROM departments d WHERE NOT EXISTS
  (SELECT 1 FROM employees e WHERE d.department_id = e.department_id);
 
SELECT /*+ HASH_AJ */* FROM departments d WHERE NOT EXISTS
  (SELECT 1 FROM employees e WHERE d.department_id = e.department_id);
  
SELECT * FROM departments d WHERE NOT EXISTS
  (SELECT /*+ HASH_AJ */1 FROM employees e WHERE d.department_id = e.department_id);
 
SELECT * FROM employees e WHERE NOT EXISTS
  (SELECT 1 FROM departments d WHERE d.department_id = e.department_id);