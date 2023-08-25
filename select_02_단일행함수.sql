-- 단일행 함수

-- 문자함수 - INITCAP(컬럼명)
select email, initcap(email), department_id
from employees
where department_id = 100;

-- 문자함수 - LOWER(컬럼명) / UPPER(컬럼명)
select first_name, lower(first_name), upper(first_name)
from employees
where department_id = 100;

-- 문자함수 ? SUBSTR(컬럼명, 시작위치, 글자수)
select  first_name, 
        SUBSTR(first_name, 1, 3), 
        SUBSTR(first_name, -3, 2)
from employees
where department_id = 100;

-- 문자함수 ? LPAD(컬럼명, 자리수, ‘채울문자’) /  RPAD(컬럼명, 자리수, ‘채울문자’)
select  first_name,
        lpad(first_name, 10, '*'),
        rpad(first_name, 17, '뭉탱이/*')
from employees;

-- 문자함수 ? REPLACE (컬럼명, 문자1, 문자2)
select  first_name,
        REPLACE(first_name,'a','*'),
        REPLACE(first_name,'an','/*-/-*'),
        replace(first_name, substr(first_name, 2, 3), '***') as eventName
from employees
where department_id = 100;

-- 숫자함수 ? ROUND(숫자, 출력을 원하는 자리수) 
select  round(123.456, 2) as round2,
        round(123.956, 0) as round0,
        round(123.456, -1) as "round-1"
from dual;

-- 숫자함수 ? TRUNC(숫자, 출력을 원하는 자리수) 
select  trunc(123.456, 2) t2,
        trunc(123.956, 0) t0,
        trunc(123.456, -2) "t-2",
        trunc(123.456, -4) "t-4"
from dual;

-- 날짜함수 ? SYSDATE
select sysdate
from dual;

-- 단일함수>날짜함수 ? MONTHS_BETWEEN(d1, d2) 
select  first_name,
        hire_date,
        sysdate,
        trunc(MONTHS_BETWEEN('2002-07-27', hire_date), 0)
from employees
where department_id = 110;

-- TO_CHAR(숫자, ‘출력모양’)  숫자형?문자형으로 변환하기
select  first_name,
        salary,
        salary*12,
        to_char(salary, '99,999,999'),
        to_char(salary*102, '$99,999,999.99'),
        to_char(salary, '099999')
from employees
where department_id = 110;

-- 단일함수>변환함수>TO_CHAR(날짜, ‘출력모양’)  날짜?문자형으로 변환
select  first_name,
        hire_date,
        to_char(hire_date, 'yyyy-mm-dd hh:mi:ss'),
        to_char(hire_date, 'yyyy"년"mm"월"dd"일" hh"시"mi"분"ss"초"')
from employees;

-- 일반함수>NVL(컬럼명, null일때값)/NVL2(컬럼명, null아닐때값, null일때 값)
select  first_name,
        salary,
        commission_pct,
        nvl(commission_pct, 0),
        salary + (salary * nvl(commission_pct, 0))
from employees;

select  first_name,
        salary,
        commission_pct,
        nvl(commission_pct, 0),
        nvl2(commission_pct, 100, 0)
from employees;






