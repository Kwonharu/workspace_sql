--‘Den’ 보다 급여를 많은 사람의 이름과 급여는?

--1) Den의 salary 구함
SELECT salary
from employees
where first_name = 'Den';
-- = 11000

--2) 나온 값으로 검색
select  first_name,
        salary
from employees
where salary > 11000;


--를 1개의 query로 통합
select  first_name,
        salary
from employees
where salary > (select salary
                from employees
                where first_name = 'Den');


--급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?
select  first_name,
        salary,
        employee_id
from employees
where salary = (select min(salary)
                      from employees);


--평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요?

--1) 평균급여보다 적게 받는 놈
select  first_name,
        salary
from employees
where salary < ('평균급여');

--2) 평균급여
select avg(salary)
from employees;

--3) 합치기
select  first_name,
        salary
from employees
where salary < (select avg(salary)
                from employees);

-----------------------------------------------------------
--다중행 SubQuery 

select *
from employees
where salary in (12008, 8300);

--위 아래 코드는 같은 의미이다. 그냥 그렇다고. 무요.

select *
from employees
where salary = 12008
and salary = 8300;


--부서번호가 110인 직원의 급여와 같은 모든 직원의 사번, 이름, 급여를 출력하세요

-- 사번이 110인 놈들 찾기
select  employee_id,
        first_name,
        salary
from employees
where department_id = 110;
-- = Shelley, William

--방법 1) where or 사용
select  employee_id,
        first_name,
        salary
from employees
where first_name = 'Shelley'
or first_name = 'William';

--방법 2) where in 사용
select  employee_id,
        first_name,
        salary
from employees
where first_name in ('Shelley', 'William');

-- 이제 subQuery가 출똥한다 작은 미물들아
select  employee_id,
        first_name,
        salary
from employees
where first_name in (select first_name
                     from employees
                     where department_id = 110);

/*select  employee_id,
        first_name,
        salary
from employees
where first_name in (select first_name, department_id
                     from employees
                     where department_id = 110);

('Shelley', 110 ) 
('William', 110 )


select  employee_id,
        first_name,
        salary
from employees
where first_name in ('William', 110);

desc employees;*/


--각 부서별로 최고급여를 받는 사원을 출력하세요

-- 부서별 최고급여 (어느 부서인지는 몰?루)
select max(salary)
from employees
group by department_id;

-- 이게 되네
select *
from employees
where (salary, department_id) in ((12008, 110));

-- 그래서 구했습니다. 제 의지로.
select department_id,
       salary,
       first_name
from employees
where (salary, department_id) in (select max(salary),
                                         department_id
                                  from employees
                                  group by department_id)
order by department_id desc;
--order by 메모리 먹는 괴물임


-- any (다중행, or)
select  salary,
        first_name
from employees
where department_id = 110;

select  salary,
        first_name
from employees
where salary > 12008
or salary > 8300;

select  salary,
        first_name
from employees
where salary > any (select  salary
                    from employees
                    where department_id = 110);


-- all (다중행, and)
select  salary,
        first_name
from employees
where department_id = 110;

select  salary,
        first_name
from employees
where salary > 12008
and salary > 8300;

select  salary,
        first_name
from employees
where salary > all (select  salary
                    from employees
                    where department_id = 110);
        

select  salary,
        first_name
from employees
where salary < all (12008)
and salary > 10000;

-------------------------------------------------------
--각 부서별로 최고급여를 받는 사원을 출력하세요

--조건에 맞는 사원 출력
select  first_name,
        salary,
        department_id
from employees
where (salary, department_id) in ('(최고급여, 부서번호) 리스트');

--(최고급여, 부서번호) 리스트
select max(salary), department_id
from employees
group by department_id;

--퓨우우우우우져어어어어어언
select  first_name,
        salary,
        department_id
from employees
where (salary, department_id) in (select max(salary), department_id
                                  from employees
                                  group by department_id);


--조건절에서 비교 vs 테이블에서 조인
select *
from employees
where (department_id, salary) in (select department_id, 
                                         max(salary)
                                  from employees
                                  group by department_id);

select *
from employees e, (select department_id, 
                          max(salary) salary
                   from employees
                   group by department_id) s 
where e.department_id = s.department_id
and e.salary = s.salary;


--급여를 가장 많이 받는 5명의 직원의 이름을 출력하시오.

--정렬, rownum 같이 사용하면 번호 부여 후 정렬한다. 똥막대기 같은 넘
select  rownum,
        first_name,
        salary
from employees
order by salary desc;

select  rownum,
        first_name,
        salary
from ("정렬된 테이블");

--정렬된 테이블
select  first_name,
        salary
from employees
order by salary desc;

--정렬 후 번호 붙이라고 임마
select  rownum,
        first_name,
        salary
from (select  first_name,
              salary
      from employees
      order by salary desc);
-----------------------------------------------------
--1등부터 5등까지
select  rownum,
        first_name,
        salary
from (select  *             --실제 작업 때는 컬럼명 다 써야 함
      from employees
      order by salary desc)
where rownum >= 0
and rownum <= 5;



--완성본
select  ort.rn,
        ort.first_name,
        ort.salary
from (select  rownum rn,
              ot.first_name,
              ot.salary
      from (select salary,
                   first_name
            from employees
            order by salary desc) ot
     ) ort
where ort.rn >= 2
and ort.rn <=10;

--(정렬, rownum rn)
select  rownum,
        salary
from (급여순 정렬된 테이블)
order by salary desc 

--(급여순 정렬된 테이블)
select  salary,
        first_name
from employees
order by salary desc ;


-- (정렬, rownum rn) + (급여순 정렬된 테이블) 합체
(select  rownum rn,
        ot.first_name,
        ot.salary
from (select salary,
             first_name
      from employees
      order by salary desc) ot  --정렬된 테이블
) ort;


--07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은? 

select  first_name,
        hire_date,
        salary
from employees
where to_char(hire_date, 'yy') = 07
order by salary desc;

select  rownum rn,
        first_name,
        hire_date,
        salary
from (select  first_name,
              hire_date,
              salary
      from employees
      where to_char(hire_date, 'yy') = 07
      order by salary desc);

select  rn 등수,
        first_name 이름,
        salary 급여,
        hire_date 입사일
from (select  rownum rn,
              first_name,
              salary,
              hire_date
      from (select  first_name,
                    salary,
                    hire_date
            from employees
            where to_char(hire_date, 'yy') = '07'
            order by salary desc
            )
    )
where rn >= 3
and rn <= 7;







