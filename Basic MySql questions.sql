show databases;
create database	practice;
use practice;
create table worker(
worker_id int not null auto_increment,
first_name varchar(25),
last_name varchar(25),
salary int,
joining_date datetime,
department varchar(25),
primary key(worker_id)
);

Insert into worker( worker_id,first_name,last_name,salary,joining_date,department)
			values(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
				  (002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
				  (003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		          (004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
				  (005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
				  (006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
				  (007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
				  (008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
select*from worker;

create table Bouns(
worker_ref_id int not null ,
bouns_amount int(10),
bouns_date datetime,
foreign key(worker_ref_id) references worker (worker_id)
ON DELETE CASCADE
);

insert into Bouns(worker_ref_id, bouns_amount,bouns_date)
		   values(001, 5000, '16-02-20'),
				 (002, 3000, '16-06-11'),
				 (003, 4000, '16-02-20'),
				 (001, 4500, '16-02-20'),
				 (002, 3500, '16-06-11');
                 
create table title(
		worker_ref_id int not null,
		worker_title varchar(25),
        affected_from datetime,
        foreign key ( worker_ref_id) references worker(worker_id)
        on delete cascade
        );
insert into title(worker_ref_id, worker_title,affected_from)
			values(001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 select*from title;
 
 -- Q-1. Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>. --
 select first_name as Worker_name from worker;
 
 -- Q-2. Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case--
 select upper(first_name) from worker ;
 
 -- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.--
 select distinct department from worker;
 
 -- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from the Worker table.--
 select substring(first_name,1,3) from worker;
 
 -- Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table.--
 select instr(first_name,binary'a') from worker where first_name='Amitabh';
 
 -- Q-6. Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side.--
 select rtrim(first_name)as Worker_name from worker;
 ##rtrim -Some versions allow you to specify characters to be removed beyond whitespace##
 
 -- Q-7. Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side. --
 select ltrim(department)as Worker_name from worker;
 ## LTRIM is a string manipulation function similar to RTRIM, but it removes leading whitespace ##
 
 -- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.--
 
 select distinct length(department) from worker;
 
 -- Q-9. Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.--
 
 select replace(first_name,'a','A') from worker;
 
 -- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME. A space char should separate them.--
 
 select concat(first_name,' ',last_name) as 'full_name' from worker;
 
 -- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.--
 select * from worker order by first_name asc;
 
 -- Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.--
 select* from worker order by first_name asc, department desc;
 
 -- Q-13. Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.--
 select * from worker where first_name in ('vipul','satish');
 
 -- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.--
 
 select * from worker where first_name not in ('vipul','satish');
 
 -- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.--
  
 select * from worker where department like 'admin%';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.--

select * from worker where first_name like '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.--

select * from worker where first_name like '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.--

select * from worker where first_name like '_____h';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.--

select * from worker where salary between 100000  and 500000;

-- Q-20. Write an SQL query to print details of the Workers who joined in Feb’2014.--

select * from worker where year(joining_date)=2014 and month(joining_date)=2;

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.--
select count(*) from worker where department='Admin';

-- Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.--
SELECT CONCAT(first_name, ' ', last_name) AS worker_name, salary
FROM worker
WHERE salary BETWEEN 50000 AND 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in descending order. --
select department , count(worker_id) AS no_of_workers
from worker
group by department
order by no_of_workers desc;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.--

select distinct w.first_name, t.worker_title
from worker w inner join title t
on w.worker_id= t.worker_ref_id 
and t.worker_title in ('manager');

-- Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.--
select worker_title, affected_from, count(*)
from title
group by worker_title
 , affected_from
having count(*)>1;

-- Q-26. Write an SQL query to show only odd rows from a table.--
select * from worker where mod(worker_ID,2)<>0;	# Comparison Operators: =, <>, != , >, <, >=, <=
# MOD is a function in MySQL used to find the remainder of one number divided by another. It's essentially the modulus operation.


-- Q-27. Write an SQL query to show only even rows from a table. --
	
select * from worker where mod(worker_ID,2)=0; # Comparison Operators: =, <>, != , >, <, >=, <=


-- Q-28. Write an SQL query to clone a new table from another table. --

Create table new_table Like worker; # First create new table using LIKE function

select * from new_table;

insert into new_table select * from worker; # copy all data into new_table

-- Q-29. Write an SQL query to fetch intersecting records of two tables. --

(select * from worker) INTERSECT (select *from new_table); # INTERSECT operator: The INTERSECT operator is used to compare the results of the two SELECT statements.
 
 # For more info use Gemini
 
 -- Q-30. Write an SQL query to show records from one table that another table does not have. --
  # Using "NOT IN"
 select * from worker where worker_id not in (select worker_ref_id from title);
 
 # Using LEFT JOIN
 
 select * from worker  left join title on worker_id = worker_ref_id 
 where worker_ref_id is null;
 
 -- Q-31. Write an SQL query to show the current date and time. -- 
 
 select curdate();
 
 select now(); # shown time 
 
-- Q-32. Write an SQL query to show the top n (say 10) records of a table.--

# MySQL query to return the top n records using the LIMIT method

select* from worker order by salary desc limit 10; # this is standard way

# SQL Server query to return the top n records using the TOP command:
 select TOP 10 * from worker order by salary desc; 
 
 -- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table. --
 
 # MySQL query to find the nth highest salary:
 
 select salary from worker order by salary limit 3,2;
 
 /* LIMIT number: This form returns the first number rows of the result set.
LIMIT offset, count: This form returns count rows starting from the offset row. */

-- Q-34. Write an SQL query to determine the 5th highest salary without using the TOP or limit method. --
select	* from worker;

select salary from worker w1 where 4=(select count(distinct(w2.salary)) 
from worker w2 where w2.salary >= w1.salary);

-- Q-35. Write an SQL query to fetch the list of employees with the same salary.--

Select distinct w.worker_id ,w.first_name,w.salary
from worker w ,worker w1 where w.salary = w1.salary and w.worker_id != w1.worker_id;

# distinct is used to return only unique rows based on the specified columns.


-- Q-36. Write an SQL query to show the second-highest salary from a table. --
select max(salary) from worker
where salary not in (select max(salary) from worker);

-- Q-37. Write an SQL query to show one row twice in the results from a table.--
select first_name, department from worker w  where w.department ='HR'
union all
select first_name,department from worker w1 where w1.department='HR';

-- Q-38. Write an SQL query to fetch intersecting records of two tables. --
(select * from worker) intersect (select * from new_table);

-- Q-39. Write an SQL query to fetch the first 50% of records from a table.--
select* from worker where worker_id <= (select count(worker_id)/2 from worker);

-- Q-40. Write an SQL query to fetch the departments that have less than five people in them. --
select department ,count(worker_id) as 'Number of Workers' from worker group by department having count(worker_id)<5;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.--
select department, count(department) as 'Number of workers' from worker group by department ;

-- Q-42. Write an SQL query to show the last record from a table.--
select * from worker where worker_id = (select max(worker_id)from worker);

-- Q-43. Write an SQL query to fetch the first row of a table.--
select * from worker where worker_id =(select min(worker_id)from worker);

-- Q-44. Write an SQL query to fetch the last five records from a table. --
select * from worker where worker_id>=5; # union 
#select * from (select* from worker w order by w.worker_id desc)as w1 where w1.worker_id <=5;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department. --
select t.department.t.First_name,t.salary from(select max(salary) as totalsalary.department from worker group by  department) as tempnew inner join worker.t on the Tempnew.department=t.department and Tempnew.Totalsalary=t.salary;
