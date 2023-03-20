-- emloyee ���̺� ��ü ���� ��ȸ
SELECT
    *
FROM
    employees;
-- emloyee ���̺� first_name, last_name,job_id �� ��ȸ

SELECT
    first_name,
    last_name,
    job_id
FROM
    employees;

-- �����ȣ�� 176�� ����� LAST_NAME ��ȸ
SELECT
    last_name
FROM
    employees
WHERE
    employee_id = 176;

-- ������ 12000 �̻� �Ǵ� �������� LAST-NAME, SALARY ��ȸ
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 12000;

-- ������ 5000 ���� 12000 ������ �ƴ� ������� LAST-NAME, SALARY ��ȸ

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary < 5000
    OR salary > 12000
ORDER BY
    last_name DESC;

-- 20, 50 �� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME, �μ���ȣ�� ������������ ��ȸ
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN ( 20, 50 )
ORDER BY
    last_name,
    department_id;
-- Ŀ�̼��� �޴� ��� ������� LAST_NAME, ����, Ŀ�̼� ��ȸ(������ ��������, Ŀ�̼� ��������)
SELECT
    last_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct > 0
ORDER BY
    salary DESC,
    commission_pct DESC;
-- ������ 2500,3500,7000�� �ƴϸ� ������ SA_REP �̳� ST_CLERK �� ��� ��ȸ
SELECT
    *
FROM
    employees
WHERE
    salary NOT IN ( 2500, 3500, 7000 )
    AND job_id IN ( 'SA_REP', 'ST_CELRK' );

-- 2008/02/20 ~ 2008/05/01 ���̿� ���� ������� last_name,���,������� ��ȸ
-- ������� �������� ����
-- ��¥ ǥ�� �� Ȧ����ǥ �ȿ� ǥ�� - OR /��� ����

SELECT
    last_name,
    employee_id,
    hire_date
FROM
    employees
WHERE
        hire_date >= '2008-02-20'
    AND hire_date >= '2008-05-01'
ORDER BY
    hire_date DESC;

SELECT
    last_name,
    employee_id,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2008-02-20' AND '2008-05-01'
ORDER BY
    hire_date DESC;

-- 2004�⵵�� ���� ������� last_name, hire _date ��ȸ
-- ������� �������� ����

SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
        hire_date >= '2004-01-01'
    AND hire_date <= '2004-12-31'
ORDER BY
    hire_date;

-- �μ��� 20,50dlrh ������ 5000 ���� 12000 ������ ������� LAST_NAME, SALARY ��ȸ
-- ���� �������� ����
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary BETWEEN 5000 AND 12000
ORDER BY
    salary;

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    department_id IN ( 20, 50 )
    AND salary BETWEEN 5000 AND 12000
ORDER BY
    last_name,
    department_id;

-- LIKE
-- 2004�⵵�� ���� ������� last_name, hire_date ��ȸ
-- ������� �������� ����
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date LIKE '%04'
ORDER BY
    hire_date;
    
-- LAST_NAME �� u�� ���Ե� ������� ���, last_name ��ȸ

SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '%u%';
    
-- LAST_NAME �� �׹�° ���ڰ� a�� ������� last_name ��ȸ
SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '___a%';
    
-- LAST_NAME �� �׹�° ���ڰ� a�� ������� la
-- last_name �������� ����
SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%'
    OR last_name LIKE '%e%'
ORDER BY
    last_name;
    

-- LAST_NAME �� a �� e ���ڰ� ���Ե� ������� last_name ��ȸ
-- last_name �������� ����
SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%e%'
    OR last_name LIKE '%e%a%'
ORDER BY
    last_name;
    
-- �Ŵ���(manager_id)�� ���� ������� last_name, job_id ��ȸ
SELECT
    last_name,
    job_id
FROM
    employees
WHERE
    manager_id IS NULL OR manager_id = '';
-- job_id�� ST_CLERK �� ����� �μ���ȣ ��ȸ(�� �μ���ȣ�� NULL �� ����� �����Ѵ�.)
-- �ߺ��� ������ �� �μ���ȣ�� ��ȸ
SELECT DISTINCT
    department_id
FROM
    employees
WHERE
        job_id = 'ST_CLERK'
    AND department_id IS NOT NULL
ORDER BY
    department_id;
-- commission_pct �� null�� �ƴ� ����� �߿��� commission = salary * commission_pct �� ���Ͽ�
-- employee_id, first_name, job_id ���
SELECT
    department_id,
    first_name,
    job_id,
    salary * commission_pct as commission
FROM
    employees
WHERE
    commission_pct IS NOT NULL;

