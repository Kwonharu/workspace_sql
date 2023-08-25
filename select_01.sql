--�� �� �ּ�
/*
������ �ּ�
*/


--select �� �⺻
select * from employees;
select * from departments;
select * from jobs;


--���ϴ� �÷� ��������
select first_name from employees;


--����� �̸�(fisrt_name)�� ��ȭ��ȣ �Ի��� ������ ����ϼ���
select  first_name,
        phone_number,
        hire_date,
        salary 
from employees;


--����� �̸�(first_name)�� ��(last_name) �޿�, ��ȭ��ȣ, �̸���, �Ի����� ����ϼ���
select  first_name,
        last_name,
        salary,
        phone_number,
        email,
        hire_date
from employees;


--����� �̸�(fisrt_name)�� ��ȭ��ȣ �Ի��� �޿� �� ǥ�õǵ��� ����ϼ���
select  first_name �̸�,      --as ���� ����
        phone_number "��ȭ�� ���� �ֽÿ�..!",       --��ҹ���, Ư�� ���� �� " " ���
        hire_date as �Ի���,
        salary as ����
from employees;


--����� �����ȣ �̸�(first_name) ��(last_name) �޿� ��ȭ��ȣ �̸��� �Ի��Ϸ� ǥ�õǵ��� ����ϼ���
select  employee_id �����ȣ,
        first_name �̸�,
        last_name ��,
        salary ����,
        phone_number ��ȭ��ȣ,
        email �̸���,
        hire_date �Ի���
from employees;

select  employee_id "eID",
        first_name �̸�,
        last_name ��,
        salary "�� ��",
        phone_number ��ȭ��ȣ,
        email �̸���,
        hire_date �Ի���
from employees;


--���� ������(Concatenation)�� �÷��� ���̱�
select first_name, last_name
from employees;

select first_name || last_name
from employees;

select first_name || ' ' || last_name name
from employees;

select first_name || ' hire date is ' || hire_date
from employees;


--��� ������ ����ϱ�
select  first_name, 
        salary
from employees;

select  first_name,
        salary,
        salary*12 "year-salary"
from employees;

select  first_name,
        salary,
        salary*12 ysalary,
        salary/30 daysalary,
        (salary+300)*12 bsalary
from employees;

select job_id * 10      --job_id ������
from employees;

/*
��ü������ ������ ������ ���� ����ϼ���
����(first_name last_name)
      ���� �̸����̿� ? �� ���� ex) William-Gietz
      �޿�
      ����(�޿�*12)
      ����2(�޿�*12+5000)
      ��ȭ��ȣ
*/
select  first_name || '-' || last_name �̸�,
        salary ����,
        salary*12 ����,
        (salary*12+5000) ����2,
        phone_number ��ȭ��ȣ
from employees;



--where ��
select first_name
from employees
where department_id = 90;


--������ 15000 �̻��� ������� �̸��� ������ ����ϼ���
select  first_name || ' ' || last_name �̸�,
        salary ����
from employees
where salary >= 15000;


--07/01/01 �� ���Ŀ� �Ի��� ������� �̸��� �Ի����� ����ϼ���
select  first_name �̸�,
        hire_date �Ի���
from employees
where hire_date > '07/01/01';     --��ģ ����Ŭ �̰� ���ϳ�
--where TO_CHAR(hire_date) > TO_CHAR('07-01#01');


--�̸��� Lex�� ������ ������ ����ϼ���
select  first_name �̸�,
        salary ����
from employees
where first_name = 'Lex';


--������ 14000 �̻� 17000 ������ ����� �̸��� ������ ���Ͻÿ�
select  first_name,
        salary
from employees
where salary >= 14000 
and salary <= 17000;


--������ 14000 �����̰ų� 17000 �̻��� ����� �̸��� ������ ����ϼ���
select  first_name,
        salary
from employees
where salary <= 14000
or salary >= 17000;


--�Ի����� 04/01/01 ���� 05/12/31 ������ ����� �̸��� �Ի����� ����ϼ���
select  first_name,
        hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';


--BETWEEN ������
select *
from employees
where salary between 14000 and 17000;


--IN ������
select  first_name, 
        last_name, 
        salary
from employees
where first_name = 'Neena'
or first_name = 'Lex'
or first_name = 'John';

select  first_name, 
        last_name, 
        salary
from employees
where first_name in ('Neena', 'Lex', 'John');

--������ 2100, 3100, 4100, 5100 �� ����� �̸��� ������ ���Ͻÿ�
select  first_name,
        salary
from employees
where salary in ('2100', '3100', '4100', '5100');


--Like ������
select first_name, last_name, salary
from employees
where first_name like 'L%';

--�̸��� am �� ������ ����� �̸��� ������ ����ϼ���
select  first_name,
        salary
from employees
where first_name like '%am%';

--�̸��� �ι�° ���ڰ� a �� ����� �̸��� ������ ����ϼ���
select  first_name,
        salary
from employees 
where first_name like '_a%';

--�̸��� �׹�° ���ڰ� a �� ����� �̸��� ����ϼ���
select  first_name
from employees 
where first_name like '___a%';

--�̸��� 4������ ����� ������ �ι�° ���ڰ� a�� ����� �̸��� ����ϼ���
select  first_name
from employees 
where first_name like '__a_';


--NULL
select  first_name, 
        salary,
        commission_pct,
        salary*commission_pct
from employees
where salary between 13000 and 15000;


--commision�� null�� ����� ���Ͻÿ�
select  first_name, 
        salary, 
        commission_pct
from employees
where commission_pct is null;       -- null�� = �� ���/���� �Ұ�

--Ŀ�̼Ǻ����� �ִ� ����� �̸��� ���� Ŀ�̼Ǻ����� ����ϼ���
select  first_name, 
        salary, 
        commission_pct
from employees
where commission_pct is not null;

--���Ŵ����� ���� Ŀ�̼Ǻ����� ���� ������ �̸��� ����ϼ���
select first_name
from employees
where manager_id is null
and commission_pct is null;


--ORDER BY ��
select  first_name, 
        salary
from employees
order by salary desc; 

/*
    ����1�� -> ū1�� : �������� asc
    ū1�� -> ����1�� : �������� desc
*/

select first_name,
        salary
from employees
where salary >= 9000
order by salary desc;


select  salary,
        first_name
from employees
where salary >= 9000
order by salary desc, first_name asc;

--�μ���ȣ�� ������������ �����ϰ� �μ���ȣ, �޿�, �̸��� ����ϼ���
select  department_id,
        salary,
        first_name
from employees
order by department_id asc;

--�޿��� 10000 �̻��� ������ �̸� �޿��� �޿��� ū�������� ����ϼ���
select  first_name,
        salary
from employees
where salary >= 10000
order by salary desc;

--�μ���ȣ�� ������������ �����ϰ� �μ���ȣ�� ������ �޿��� ���� ������� �μ���ȣ �޿� �̸��� ����ϼ���  
select  department_id,
        salary,
        first_name
from employees
order by department_id asc, salary desc;

















