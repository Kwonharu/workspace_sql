-- ������ �Լ�

-- �����Լ� - INITCAP(�÷���)
select email, initcap(email), department_id
from employees
where department_id = 100;

-- �����Լ� - LOWER(�÷���) / UPPER(�÷���)
select first_name, lower(first_name), upper(first_name)
from employees
where department_id = 100;

-- �����Լ� ? SUBSTR(�÷���, ������ġ, ���ڼ�)
select  first_name, 
        SUBSTR(first_name, 1, 3), 
        SUBSTR(first_name, -3, 2)
from employees
where department_id = 100;

-- �����Լ� ? LPAD(�÷���, �ڸ���, ��ä�﹮�ڡ�) /  RPAD(�÷���, �ڸ���, ��ä�﹮�ڡ�)
select  first_name,
        lpad(first_name, 10, '*'),
        rpad(first_name, 17, '������/*')
from employees;

-- �����Լ� ? REPLACE (�÷���, ����1, ����2)
select  first_name,
        REPLACE(first_name,'a','*'),
        REPLACE(first_name,'an','/*-/-*'),
        replace(first_name, substr(first_name, 2, 3), '***') as eventName
from employees
where department_id = 100;

-- �����Լ� ? ROUND(����, ����� ���ϴ� �ڸ���) 
select  round(123.456, 2) as round2,
        round(123.956, 0) as round0,
        round(123.456, -1) as "round-1"
from dual;

-- �����Լ� ? TRUNC(����, ����� ���ϴ� �ڸ���) 
select  trunc(123.456, 2) t2,
        trunc(123.956, 0) t0,
        trunc(123.456, -2) "t-2",
        trunc(123.456, -4) "t-4"
from dual;

-- ��¥�Լ� ? SYSDATE
select sysdate
from dual;

-- �����Լ�>��¥�Լ� ? MONTHS_BETWEEN(d1, d2) 
select  first_name,
        hire_date,
        sysdate,
        trunc(MONTHS_BETWEEN('2002-07-27', hire_date), 0)
from employees
where department_id = 110;

-- TO_CHAR(����, ����¸�硯)  ������?���������� ��ȯ�ϱ�
select  first_name,
        salary,
        salary*12,
        to_char(salary, '99,999,999'),
        to_char(salary*102, '$99,999,999.99'),
        to_char(salary, '099999')
from employees
where department_id = 110;

-- �����Լ�>��ȯ�Լ�>TO_CHAR(��¥, ����¸�硯)  ��¥?���������� ��ȯ
select  first_name,
        hire_date,
        to_char(hire_date, 'yyyy-mm-dd hh:mi:ss'),
        to_char(hire_date, 'yyyy"��"mm"��"dd"��" hh"��"mi"��"ss"��"')
from employees;

-- �Ϲ��Լ�>NVL(�÷���, null�϶���)/NVL2(�÷���, null�ƴҶ���, null�϶� ��)
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






