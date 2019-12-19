--1
/*Find the average salary in the firm.*/
select avg(sal) as AVGSAL
from emp;

--2
/*Find the lowest salary for the job CLERK.*/
select min(sal) as MINSAL_CLERK
from emp
where job='CLERK';

--3
/*How many people are employed in department 20?*/
select count(empno) as COUNT_EMP
from emp
where deptno=20;

--4
/*Find the average salary for each job.*/
select job, avg(sal) as AVGSAL
from emp
group by job;

--5
/*Find the average salary for each job except MANAGER.*/
select job, avg(sal) as AVGSAL
from emp
where job!='MANAGER'
group by job;

--6
/*Find average salary for each job in each department.*/
select deptno,avg(sal) as AVGSAL
from emp
group by deptno,job;

--7
/*For each job find maximal salary.*/
select job,max(sal) as MAXSAL
from emp
group by job;

--8
/*Show the average salaries for all departments employing more than 3 people.*/
select deptno,count(empno) as People,avg(sal) as AVGSAL
from emp
group by deptno
having count(empno)>3;

--9
/*Find all jobs that the average salary for this job is not less than 3000.*/
select job,avg(sal) as AVGSAL
from emp
group by job
having avg(sal)>=3000;

--10
/*Find the average salary (monthly) and average yearly income for each job (do not forget about provision).*/
select job, avg(sal) as AVGSAL, avg(sal*12+nvl(comm,0)) as AVG_YEARLYSAL
from emp
group by job;

--11
/*Find the difference between the highest and the lowest salary.*/
select max(sal)-min(sal) as Difference
from emp;

--12
/*Find departments employing more than 3 people.*/
select deptno, count(empno) as EMP_Number
from emp
group by deptno
having count(empno)>3;

--13
/*Check if all personal numbers are really different from each other*/
select count(empno)-count(DISTINCT empno)
from emp;

--14
/*Find the lowest salary paid to employees working under each manager. 
Eliminate groups with minimal salaries below 1000. 
Present data by increasing values of incomes.*/
select min(e.sal) as LowestSAL_UnderManager
from emp e,emp s
where e.mgr=s.empno and s.job='MANAGER'
group by e.sal
having min(e.sal)>1000;

--15
/*How many people work in the department which is located in Dallas?*/
select count(empno) as EMP_Number_Dallas
from emp, dept
where dept.deptno=emp.deptno and loc='DALLAS';

--16
/*For each grade find the maximal salary earned by a person working in the firm and having a salary in this grade.*/
select grade,max(sal) MAXSAL_GRADE
from emp,salgrade
where sal between losal and hisal
group by grade;

--17
/*Find which values of salaries occur more than once.*/
select sal,count(sal) as REP_SAL
from emp
group by sal
having count(sal)>1;

--18
/*What is the average salary for people from the second grade?*/
select grade,avg(sal) as AVGSAL_SecondGrade
from emp,salgrade
where sal between losal and hisal and grade=2
group by grade;

--19
/*For each manager find the number of employees working under his supervision.*/
select s.ename, count(s.empno) as COUNT_EMP
from emp s, emp e
where e.mgr=s.empno and s.job='MANAGER'
group by(s.ename);

--20
/*Find the total income earned by people from the first grade.*/
select sum(12*sal+nvl(comm,0)) as Total_Income_FirstGrade
from emp,salgrade
where sal between losal and hisal and grade=1;




