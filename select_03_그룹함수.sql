-- 그룹함수

select  -- first_name,    -- 107개 같이 표현할 수 없다
        avg(salary)       -- 1개
from employees;

--그룹함수 - count()
select count(*), count(first_name)
from employees;

select count(commission_pct), count(*)
from employees;

select count(manager_id), count(*)
from employees;
-- where절 있을 때
select count(*)
from employees
where salary > 16000;

--그룹함수 - sum()
select sum(salary), count(salary), count(*)
from employees;

select sum(salary), avg(salary), count(salary), count(*)
from employees
where salary > 16000;

-- 그룹함수 - avg()
select  count(*),
        sum(salary),
        avg(salary)
from employees;

select  count(*),
        sum(salary),
        avg(nvl(salary, 0))
from employees;

-- 그룹함수 - max() / min()
select  count(*),
        max(salary),
        min(salary)
from employees;


-- GROUP BY 절
select  department_id,
        sum(salary)
from employees
group by department_id
order by department_id desc;

select  department_id,
        sum(salary),
        avg(salary),
        max(salary),
        job_id
from employees
group by department_id, job_id;

--연봉(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 급여합계를 출력하세요
select  department_id,
        count(*),
        sum(salary)
from employees
-- where sum(salary) >= 20000       -- where 절에는 그룹함수를 쓸 수 없다.
group by department_id;



-- 부서별로 합계를 내시오 (연봉 10000 이상만)
select sum(salary), department_id
from employees
where salary >= 10000
group by department_id;

-- 부서별로 합계를 내시오 (부서별 합계가 10000 이상 되는 부서만)
select sum(salary), department_id
from employees
group by department_id
having sum(salary) >= 10000
and department_id >= 100;


--CASE ~ END 문
select  employee_id, 
        first_name,
        salary,
        job_id,
        case when job_id = 'AC_ACCOUNT' then salary + salary * 0.1
             WHEN job_id = 'SA_REP'     THEN salary + salary * 0.2
		     WHEN job_id = 'ST_CLERK'   THEN salary + salary * 0.3
             else salary
        end "salary+bonus"
from employees;


--DECODE() 문 
select  employee_id,
        first_name,
        salary,
        job_id,
        decode(job_id, 'AC_ACCOUNT', salary + salary*0.1,
                       'SA_REP', salary + salary*0.2,
                       'ST_CLERK', salary + salary * 0.3, 
               salary) as bonus
from employees;


--직원의 이름, 부서, 팀을 출력하세요
--팀은 코드로 결정하며 부서코드가 10~50 이면 ‘A-TEAM’
--60~100이면 ‘B-TEAM’  110~150이면 ‘C-TEAM’ 나머지는 ‘팀없음’ 으로 출력하세요.
select  first_name,
        department_id,
        case when department_id >= 10 and department_id <= 50 then 'A-TEAM'
             when department_id >= 60 and department_id <= 100 then 'B-TEAM'
             when department_id >= 110 and department_id <= 150 then 'C-TEAM'
             else '팀없음'   
        end 팀
from employees;



/*
    JOIN
*/

--카티젼 프로덕트(Cartesian Product)
--     107    *     27    =   2889
select *
from employees, departments;


select  first_name, 
        salary,
        department_name,
        employees.department_id as eld,
        departments.department_id dld
from employees, departments
where employees.department_id = departments.department_id;


select  e.first_name, 
        salary,
        d.department_name,
        e.department_id
from employees e, departments d
where e.department_id = d.department_id;


--모든 직원이름, 부서이름, 업무명 을 출력하세요
select  e.first_name, 
        d.department_name,
        j.job_title,
        e.job_id
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id;


--outer Join > left join
select  e.first_name,
        e.salary,
        d.department_name,
        e.department_id
from employees e left outer join departments d
on e.department_id = d.department_id;

/* 무려 위 아래 코드는 같은 left join이다. 
--문법 ㅈ같네 */

select  e.first_name,
        e.salary,
        d.department_name,
        e.department_id
from employees e, departments d
where e.department_id = d.department_id(+);
                                    -- NULL이 올 수 있는 쪽 조건에 (+)를 붙인다.
                                    -- (+)가 left join임. 아니 oracle 문법을 왜 이따구로 만ㄷ

--outer Join > right join
select  e.first_name,
        e.salary,
        d.department_name,
        e.department_id
from employees e right outer join departments d
on e.department_id = d.department_id;

/* 무려 -이하생략- right join이다. */

select  e.first_name,
        e.salary,
        d.department_name,
        e.department_id
from employees e, departments d
where e.department_id(+) = d.department_id;

-- 왜 left join인데 오른쪽 (+)붙이고
-- right join인데 왼쪽에 (+)냐고 oracle 선비들아


--outer join > full join
select  e.first_name,
        e.salary,
        d.department_name,
        e.department_id
from employees e full outer join departments d
on e.department_id = d.department_id;
-- Kimberely 일병 구하기

/*
select  e.first_name,
        e.salary,
        d.department_name,
        e.department_id
from employees e, departments d
where e.department_id(+) = d.department_id(+);

그와 중에 + / + 안 되는 거 킹받네
*/


--Self Join
select  e.first_name name,
        e.salary,
        e.phone_number,
        m.first_name magName,
        m.phone_number
from employees e, employees m
where e.manager_id = m.employee_id;


-- 논리적으로 말이 안 돼도 값이 같으면 join이 된다.
select *
from employees e, locations l
where e.salary = l.location_id;







