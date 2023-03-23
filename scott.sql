-- scott

-- emp ���̺� ���� ����
-- �ʵ��(���̸�)     ��������        ������Ÿ��
--     EMPNO(�����ȣ)        NOTNULL       NUMBER(4)
--     ENAME(�����). JOB(��å),MGR(���ӻ�� ��ȣ),HIREDATE(�Ի���),SAL(�޿�),COMM(����),DEPTNO(�μ���ȣ)
--     NUMBER : �Ҽ��� �ڸ����� �����ؼ� ���� ����
--     NUMBER(4) : 4�ڸ� ���ڱ��� ���, NUMBER(8,2) : ��ü �ڸ����� 8�ڸ��̰� �Ҽ��� 2�ڸ��� �����Ѵ�.
--     VARCHAR2 : ������ ���ڿ� ���� ����
--     VARCHAR2(10) : 10byte ���ڱ��� ���� ����
--     DATE : ��¥ ������


DESC emp;

-- DEPTNO(�μ���ȣ),DNAME(�μ���),LOC(�μ���ġ)
DESC dept;

-- GRADE(�޿����),LOSAL(�ּ� �޿���), HISAL(�ִ� �޿���)
DESC salgrade;

-- select : ������ ��ȸ
-- ��ȸ ��� : ������(�� ������ ��ȸ), ��������(�� ������ ��ȸ), ����(�� �� �̻��� ���̺��� ����Ͽ� ��ȸ)
-- SELECT ���̸�1, ���̸�2.....(��ȸ�� ���� ��ü��� * �� ó��)
-- FROM ���̺��;

-- 1. EMP ���̺��� ��ü ���� ��ȸ
SELECT
    *
FROM
    emp;

-- 2. EMP ���̺��� �����ȣ, �̸�, �޿� ���� ��ȸ
SELECT empno, ename, sal
FROM emp
SELECT
    *
FROM
    emp;
    
-- 3. DEPT ���̺� ��ü ��ȸ
select * from dept;
-- 4. DEPT ���̺�ȿ� �μ���ȣ�� ������ ��ȸ
select deptno, loc FROM
dept;

-- 5. EMP ���̺� �ȿ� �μ���ȣ ��ȸ
SELECT
    deptno
FROM
    emp;

-- 6. EMP ���̺�ȿ� �μ���ȣ ��ȸ(��, �ߺ��� �μ� ��ȣ�� ����)
-- DISTINCT : �ߺ� ����
SELECT DISTINCT
    deptno
FROM
    emp;

-- ���� ���� ���� ���(��� �ߺ��̳� �ƴϳĸ� �Ǵ�)
SELECT DISTINCT
    job, deptno
from
emp;

-- 7. ����
-- ������� 1�� ���� ���ϱ� ( SAL * 12 + COMM ), �̸� ���̱� : �ڿ� as �̸���(���� as ���ص� �ǰ� �� ĭ��� �̸�), �̸��� ������ �ִٸ� ""�� �����ֱ�
SELECT
    empno,
    ename,
    SAL,
    COMM,
    sal * 12 + comm AS annsal
FROM
    emp;

SELECT
    empno,
    ename           �����,
    job             "�� å",
    sal * 12 + comm annsal
FROM
    emp;


-- 8. ���� : ORDER BY
--          �������� => DESC, �������� => ASC
--  ENAME, SAL �� �����ϰ�, SAL ������������ ����

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal;  -- asc �� ��������

-- ��ü ���� ����ϰ�, ����� �����ȣ�� ������������ ����
SELECT
    *
FROM
    emp
ORDER BY
    empno;

SELECT
    *
FROM
    emp
ORDER BY
    deptno,
    sal DESC;

--[�ǽ�] emp ���̺��� ��� �� ���
-- empno => emplyee_no
-- ename => employee_name
-- mgr => namager
-- sal => salary
-- comm => commission
-- deptno => department_no
-- �μ� ��ȣ�� �������� ������������ �����ϵ� �μ���ȣ�� ���ٸ� ��� �̸��� �������� �������� ����

SELECT
    empno  AS employee_no,
    ename  AS employee_name,
    mgr    AS namager,
    sal    AS salary,
    comm   AS commission,
    deptno AS department_no
FROM
    emp
ORDER BY
    deptno DESC,
    ename ASC;

-- WHERE : Ư�� ������ �������� ���ϴ� ���� ��ȸ

-- �μ���ȣ�� 30�� �����͸� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    deptno = 30;  -- = : ����

-- �����ȣ�� 7782�� ��� ��ȸ

SELECT
    *
FROM
    emp
WHERE
    empno = 7782;

-- �μ���ȣ�� 30�̰�, �����å�� SALESMAN�� �� ��ȸ
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';

-- �����ȣ�� 7499�̰�, �μ���ȣ�� 30�� �� ��ȸ
SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;

-- �μ���ȣ�� 30�̰ų�, �����å�� CLERK �� �� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';
    
-- ��������� : +,-,*,/ ����, mod(������)
-- �񱳿����� : >, >=, <, <=
-- ��񱳿����� : =, !=, <>, ^= (!=, <>, ^=, : A���� B���� �ٸ� ��� true, ���� ��� false)
-- ������������ : NOT
-- IN ������
-- BETWEEN A AND B ������
-- LIKE �����ڿ� ���ϵ� ī��(_,%)
-- ���տ����� : UNION(������-�ߺ�����), UNION ALL(������-�ߺ�����), MINUS(������), INTERSECT(������)

-- ������ �켱����
-- 1) ��������� *, /
-- 2) ��������� +, -
-- 3) �񱳿�����
-- 4) IS NULL, IS NOT NULL, LIKE, IN
-- 5) BETWEEN A AND B
-- 6) NOT
-- 7) AND
-- 8) OR
-- �켱������ ��� �Ѵٸ� �Ұ�ȣ ��� ��õ



-- EMP ���̺��� �޿� ���� 12�� ���� ���� 36000 �� �� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

-- ename �� F ������ ���ڷ� �����ϴ� ��� ��ȸ
-- ���� ǥ���� ''�� ���
SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';

SELECT
    *
FROM
    emp
WHERE
    ename <= 'FORZ';

-- JOB�� MANAGER, SALESMAN, CLERK ��� ��ȸ

SELECT
    *
FROM
    emp
WHERE
    job = 'MANAGER'
    OR job = 'SALESMAN'
       OR job = 'CLERK';

-- sal �� 3000�� �ƴ� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    sal != 3000;

SELECT
    *
FROM
    emp
WHERE
    sal <> 3000;

SELECT
    *
FROM
    emp
WHERE
    sal^= 3000;

-- JOB�� MANAGER, SALESMAN, CLERK ��� ��ȸ ==> IN ������
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'MANAGER', 'SALESMAN', 'CLERK' );

-- JOB �� MANAGER, SALESMAN, CLERK �ƴ� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
        job != 'manager'
    AND job <> 'salesman'
        AND job^= 'clerk';

SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'MANAGER', 'SALESMAN', 'CLERK' );

SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;

-- �μ���ȣ�� 10,20 �����ȸ(in ���)

SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );

-- �޿��� 2000 �̻� 3000 ������ ��� ��ȸ

SELECT
    *
FROM
    emp
WHERE
        sal >= 2000
    AND sal <= 3000;

-- between �ּҰ� and �ִ밪;

SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;

-- �޿��� 2000 �̻� 3000 ���ϰ� �ƴ� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;

-- LIKE �����ڿ� ���ϵ� ī��(_,%)
-- _ : � ���̵� ������� �� ���� ���� �����͸� �ǹ�
-- % : ���̿� �������(���� ���� ��쵵 ����) ��� ���� �����͸� �ǹ�

-- ��� �̸��� S�� �����ϴ� ��� ���� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

-- ��� �̸��� �ι� ° ���� L �� ����� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';
-- ��� �̸��� AM �� ���Ե� ����� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM';
-- ��� �̸��� AM �� ���Ե��� ���� ����� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM';

-- NULL : ������ ���� ������ ��� �ִ� ����
-- = �� ����� �� ����

-- COMM �� NULL�� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;

-- MGR �� NULL�� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL;

-- MGR �� NULL�� �ƴ� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;

-- ���տ�����

-- union, union all : ������

select empno, ename, sal, deptno
from emp
where deptno = 10
union
select empno, ename, sal, deptno
from emp
where deptno = 10;

select empno, ename, sal, deptno
from emp
where deptno = 10
UNION ALL
select empno, ename, sal, deptno
from emp
where deptno = 10;

-- MINUS
select empno, ename, sal, deptno
from emp
MINUS
select empno, ename, sal, deptno
from emp
where deptno = 10;

-- INTERSECT
select empno, ename, sal, deptno
from emp
INTERSECT
select empno, ename, sal, deptno
from emp
where deptno = 10;

-- EMP ���̺��� ����̸��� S�� ������ ��� ������ ��ȸ
SELECT * FROM emp
where ename like '%S';

-- EMP ���̺��� 30�� �μ��� �ٹ��ϴ� ��� �߿��� ��å�� SALESMAN�� �����
-- �����ȣ, �̸�, �޿� ��ȸ(SAL ��������)
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE deptno = 30 and  job = 'SALESMAN'
order by EMPNO, ENAME, SAL desc;

-- EMP ���̺��� ����Ͽ� 20,30�� �μ��� �ٹ��ϰ� �ִ� ��� �� �޿��� 2000 �ʰ��� ��� ��ȸ
-- �����ȣ, �̸�, �޿�, �μ���ȣ ��ȸ
-- ���� �����ڸ� ����ϴ� ��İ� ������� �ʴ� ��� �� ������ ����Ѵ�

-- ���տ����� ������� ���� ���
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE deptno IN(20,30) and  SAL > 2000;
order by EMPNO, ENAME, SAL
desc;

-- ���տ����� ����� ���
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    sal > 2000
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
        deptno = 20
    AND sal > 2000
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
        deptno = 30
    AND sal > 2000;

-- ��� �̸��� E�� ���ԵǾ� �ִ� 30�� �μ� ��� �� �޿��� 1000~2000 ���̰� �ƴ� ����� �̸�
-- �����ȣ, �޿�, �μ���ȣ�� ��ȸ�ϱ�

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    ename LIKE '%E%'
    AND deptno = 30
        AND sal NOT BETWEEN 1000 AND 2000;

-- �߰� ������ �������� ������, ����ڰ� �ְ� ��å�� MANAGER, CLERK �� ��� �߿��� ��� �̸���
-- �ι� ° ���ڰ� L �� �ƴ� ����� ���� ��ȸ

SELECT
    *
FROM
    emp
WHERE
    comm IS NULL
    AND mgr IS NOT NULL
        AND job IN ( 'MANAGER', 'CLERK' )
            AND ename NOT LIKE '_L%';

-- ����Ŭ �Լ�
-- ����Ŭ���� �⺻������ �����Ѵ� ���� �Լ��� ����ڰ� �ʿ信 ���� ���� ������ ����� ���� �Լ�

-- 1. ���ڿ� �Լ�
-- 1) UPPER, LOWER, INITCAP
-- UPPER : ��� �빮��, LOWER : ��� �빮�� INITCAP : ù ���ڸ� �빮��
-- LIKE '%ORACLE%' OR LIKE '%oracle%'  ==> �˻� �� ���
SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;

SELECT
    *
FROM
    emp
WHERE
    upper(ename) = 'FORD';

SELECT
    *
FROM
    emp
WHERE
    upper(ename) LIKE upper('%ford%');

-- 2) LENGTH : ���ڿ� ����
SELECT
    ename,
    length(ename)
FROM
    emp;

-- ��� �̸��� ���̰� 5 �̻��� ��� ��ȸ
SELECT
    ename,
    length ( ename ) FROM emp WHERE
        length(ename) >= 5;

-- �ѱ��� ��
-- dual : sys�� �����ϴ� ���̺�(�ӽ� �����̳� �Լ��� ��� �� Ȯ���ϴ� �뵵)
-- length, lengthb(���ڰ� ����ϴ� ����Ʈ ��)
-- ���� : ����1 => 1byte, �ѱ� : ���� 1 => 3byte
SELECT
    length('�ѱ�'),
    lengthb('�ѱ�'),
    lengthb('ab')
FROM
    dual;

-- 3) SUBSTR(���ڿ�������, ������ġ, �������) : ������� ���� ����
--      ���ڿ� �Ϻ� ����

SELECT
    JOB, SUBSTR(JOB, 1,2), SUBSTR(JOB,3,2), SUBSTR(JOB,5), SUBSTR(JOB,-3)
    FROM
        EMP;

-- ENAME, ����° ���ں��� ���
SELECT
    ENAME,
    SUBSTR(ENAME, 3)
    FROM
    EMP;

-- 3) INSTR : ���ڿ� ������ �ȿ��� Ư�� ���� ��ġ ã��
-- INSTR(����ڿ�, ��ġ�� ã������ ���ڿ�, ����ڿ����� ã�⸦ ������ ��ġ(����),������ġ���� ã������ ���ڰ� ���°���� ����

-- HELLO, ORACLE! ���ڿ����� L ���ڿ� ã��
SELECT  INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
        INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
        INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
FROM
daul;

--4) replace : Ư�� ���ڸ� �ٸ� ���ڷ� ����
-- relplace(���ڿ�������, ã�¹���, ���湮��)

-- 010-1234-5678 - �� �� ���ڿ��� ���� / -�� ���ֱ�
SELECT
    '010-1234-5678'                    AS ������,
    replace('010-1234-5678', '-', ' ') AS replace_1,
    replace('010-1234-5678', '-')      AS replace_2
FROM
    dual;

-- '�̰��� Oracle �̴�', '�̰���' => this is ����
SELECT
    '�̰��� Oracle �̴�'                            AS ������,
    replace('�̰��� Oracle �̴�', '�̰���', 'This is') AS replace_1
FROM
    dual;

-- 5) concat : �� ���ڿ� ������ ��ġ��
SELECT
    concat(empno, ename)
FROM
    emp;
    
-- concat(empno,':',ename) : ������, �� 2���� �����ϱ� ����
SELECT
    concat(empno,
           concat(':', ename))
FROM
    emp;

-- || : ���ڿ� ���� ������
SELECT
    empno || ename,
    empno || ':'
             || ename
FROM
    emp;

-- 6) TRIM, LTRIM, RTRIM : ���� ���� Ư�� ���� ����
SELECT
    '    �̰���    ',
    TRIM(' �̰��� ')
FROM
    dual;

-- 2. �����Լ�
-- 1) ROUND, TRUNC, CEIL, FLOOR, MOD

SELECT
    round(1234.5678)      AS round,      -- �Ҽ��� ù° �ڸ����� �ݿø�
    round(1234.5678, 0)   AS round0,   -- �Ҽ��� ù° �ڸ����� �ݿø�
    round(1234.5678, 1)   AS round1,   -- �Ҽ��� ��° �ڸ����� �ݿø�
    round(1234.5678, 2)   AS round2,   -- �Ҽ��� ����° �ڸ����� �ݿø�
    round(1234.5678, - 1) AS round_minus1,   -- �ڿ��� ù��° �ڸ����� �ݿø�
    round(1234.5678, - 2) AS round_minus2    -- �ڿ��� �ι�° �ڸ����� �ݿø�
FROM
    dual;

--trunc : Ư�� ��ġ���� ������ �Լ�
--trunc(����, ���� ��ġ(����))
SELECT
    round(1234.5678)      AS trunc,          -- �Ҽ��� ù° �ڸ����� �ݿø�
    round(1234.5678, 0)   AS trunc0,         -- �Ҽ��� ù° �ڸ����� �ݿø�
    round(1234.5678, 1)   AS trunc1,         -- �Ҽ��� ��° �ڸ����� �ݿø�
    round(1234.5678, 2)   AS trunc2,         -- �Ҽ��� ����° �ڸ����� �ݿø�
    round(1234.5678, - 1) AS trunc_minus1,   -- �ڿ��� ù° �ڸ����� �ݿø�
    round(1234.5678, - 2) AS trunc_minus2    -- �ڿ��� ��° �ڸ����� �ݿø�
FROM
    dual;
    

-- ceil(����), floor(����) : �Էµ� ���ڿ� ����� ū ����, ���� ����

SELECT
    ceil(3.14),
    floor(3.14),
    ceil(- 3.14),
    floor(- 3.14)
FROM
    dual;

SELECT
    ceil(3.14),
    floor(3.14),
    ceil(- 3.14),
    floor(- 3.14)
FROM
    dual;
    
-- ��¥ �Լ�
-- ��¥ ������ + ���� : ��¥ �����ͺ��� ���ڸ�ŭ �ϼ� ������ ��¥
-- ��¥ ������ - ��¥ ������ : �� ��¥ ������ ���� �ϼ� ����

-- ��¥ ������ + ��¥ ������ : ����Ұ�
-- 1) sysdate �Լ� : ����Ŭ �����ͺ��̽� ������ ��ġ�� os�� ���糯¥�� �ð��� ������
SELECT
    sysdate,
    sysdate - 1 AS yesterday,
    sysdate + 1 AS tomorrow
FROM
    dual;
    
-- 2) add_months(��¥, ���� ������) : �� ���� ���� ��¥ ���ϱ�
SELECT
    sysdate,
    add_months(sysdate, 3)
FROM
    dual;

-- �Ի� 50�ֳ��� �Ǵ� ��¥ ���ϱ�
-- empno, ename, hiredate, �Ի� 50�ֳ⳯¥ ��ȸ
SELECT
    empno,
    ename,
    hiredate,
    add_months(hiredate, 600)
FROM
    emp;

--3) months_between(ù��° ��¥, �ι�° ��¥) : �� ��¥ ������ ���� ��¥ ���̸� ���� ���� ����Ͽ� ���

-- �Ի� 45�� �̸��� ��� ������ ��ȸ
-- empno, ename, hiredate

SELECT
    empno,
    ename,
    hiredate
FROM
    emp
WHERE
    months_between(sysdate, hiredate) < 540;

-- ���� ��¥�� 6���� �� ��¥�� ���
SELECT
    sysdate,
    add_months(sysdate, 6)
FROM
    dual;

SELECT
    empno,
    ename,
    hiredate,
    sysdate,
    months_between(hiredate, sysdate)        AS months1,
    months_between(sysdate, hiredate)        AS months2,
    trunc(months_between(sysdate, hiredate)) AS months3
FROM
    emp;

-- 4)   next_day,(��¥ , ����) : Ư�� ��¥�� �������� ���ƿ˴� ������ ��¥ ���
--      last_day (��¥) : Ư�� ��¥�� ���� ���� ������ ��¥�� ���
SELECT
    sysdate,
    next_day(sysdate, '�ݿ���'),
    last_day(sysdate)
FROM
    dual;

-- ��¥�� �ݿø�, ���� : ROUND, TRUNK
-- CC : �� �ڸ� ������ �� ���ڸ��� �������� ���
--      2023 ���� ��� 2050 �����̹Ƿ� 2001������ ó��

SELECT
    sysdate,
    round(sysdate, 'CC')   AS format_cc,
    round(sysdate, 'YYYY') AS format_yyyy,
    round(sysdate, 'DDD')  AS format_ddd,
    round(sysdate, 'HH')   AS format_hh
FROM
    dual;

-- ����ȯ �Լ� : �ڷ����� �� ��ȯ
-- NUMBER, VARCHAR2, DATE

SELECT
    empno,
    ename,
    empno + '500'
FROM
    emp
WHERE
    ename = 'FORD';

--01722. 00000 -  "invalid number"
--SELECT empno, ename, 'ABCD'+EMPNO
--from emp
--where ename = 'FORD';

-- TO_CHAR() : ���� �Ǵ� ��¥ �����͸� ���� �����ͷ� ��ȯ
-- TO_NUMBER() : ���� �����͸� ���� �����ͷ� ��ȯ
-- TO_DATE() : ���� �����͸� ��¥ �����ͷ� ��ȯ

-- ���ϴ� ��� ���·� ��¥ ����ϱ� TO_CHAR �ַ� ����
SELECT
    sysdate,
    to_char(sysdate, 'HH12:MI:SS AM') AS ���糯¥�ð�
FROM
    dual;

-- MON, MONTH : �� �̸�
-- DDD : 365�� �߿��� ��ĥ ������ �� �˷���
SELECT
    sysdate,
    to_char(sysdate, 'YYYY/MM/DD') AS ���糯¥,
    to_char(sysdate, 'YYYY') AS ���翬��,
    to_char(sysdate, 'MM') AS �����,
    to_char(sysdate, 'MON') AS �����1,
    to_char(sysdate, 'DD') AS ��������,
    to_char(sysdate, 'DDD') AS ��������2
    to_char(sysdate, 'HH12:MI:SS AM') AS ���糯¥�ð�
FROM
dual;

-- sal �ʵ忡 , �� ��ȭǥ�ø� �ϰ� �ʹٸ�?
-- L (Locale) ���� ȭ�� ���� ��ȣ �ٿ���
SELECT
    sal,
    to_char(sal, '$999,999') AS sal_$,
    to_char(sal, 'L999,999') AS sal_l
FROM
    emp;








-- TO_NUMBER(���ڿ�������, �ν� �� ��������)

-- �ڵ�����ȯ
SELECT
    1300 - '1500',
    '1300' + 1500
FROM
    dual;

-- �ڵ�����ȯ�ȵǴ� ��Ȳ
SELECT
    TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
FROM
    dual;

-- to_date(���ڿ�������, '�νĵ� ��¥ ����')
SELECT
    TO_DATE('2018-07-14', 'YYYY-MM-DD') AS todate1,
    TO_DATE('20230320', 'YYYY-MM-DD')   AS todate2
FROM
    dual;

--ORA-01722: ��ġ�� �������մϴ�
--select '2023-03-21' - '2023-02-01'
--from dual;

SELECT
    TO_DATE('2023-03-21') - TO_DATE('2023-02-01')
FROM
    dual;

-- ��ó�� �Լ�
-- NULL + 300 => NULL

-- NVL(������, ���� ��� ��ȯ�� ������)
SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm
FROM
    emp;

-- NVL2(������, ���� �ƴҰ�� ��ȯ�� ������, ���� ��� ��ȯ�� ������)
SELECT
    empno,
    ename,
    comm,
    nvl2(comm, 'O', 'X'),
    nvl2(comm, sal * 12 + comm, sal * 12) AS annsal
FROM
    emp;

-- decode�Լ� / case ��

-- decode(�˻� ����� �� ������, 
--        ����1, ����1�� ��ġ�� �� ������ ����
--        ����2, ����2�� ��ġ�� �� ������ ����)

-- emp ���̺� ��å�� manager �� ����� �޿��� 10% �λ�,
-- saleman �� ����� 5%, ANALYST �� ����� �״��, �������� 3% �λ�� �޿� ���

SELECT empno, ename, job, sal,
decode(job, 'MANAGER', sal*1.1, 'SALESMAN',sal * 1.05,'ANALYST',sal,sal * 1.03) as upsal
FROM EMP;


SELECT empno, ename, job, sal,
case job 
when 'MANAGER' then sal * 1.1
when 'SALESMAN' then sal * 1.05 
when 'ANALYST' then sal 
else sal * 1.03 
end as upsal
FROM
emp;

SELECT
    empno,
    ename,
    job,
    sal,
    CASE
        WHEN comm IS NULL THEN
            '�ش���� ����'
        WHEN comm = 0 THEN
            '�������'
        WHEN comm > 0 THEN
            '���� : ' || comm
        ELSE
            sal * 1.03
    END AS comm_text
FROM
    emp;

-- emp ���̺��� ������� �� ��� �ٹ��ϼ��� 21.5���̴�.
-- �Ϸ� �ٹ� �ð��� 8�ð����� ������ �� �������
-- �Ϸ� �޿�(DAY_PAY)�� �ñ�(TIME_PAY)�� ����Ͽ�
-- ����� ����Ѵ�. ��, �Ϸ� �޿��� �Ҽ��� ��° �ڸ�����
-- ������, �ñ��� �� ��° �Ҽ������� �ݿø��Ͻÿ�.
SELECT
    empno,
    ename,
    sal,
    trunc(sal / 21.5, 2)     AS day_pay,
    round(sal / 21.5 / 8, 1) AS time_pay
FROM
    emp;

-- EMP ���̺��� ������� �Ի���(HIREDATE)�� �������� 3������ ���� �� ù �����Ͽ� �������� �ȴ�. 
-- ������� �������� �Ǵ� ��¥(R_JOB)�� YYYY-MM-DD �������� �Ʒ��� ���� ����Ͻÿ�. 
-- ��, �߰�����(COMM)�� ���� ����� �߰������� N/A�� ����Ͻÿ�.

SELECT
    comm,
    nvl(to _char(comm), 'N/A')  --ORA-01722: ��ġ�� �������մϴ�, to_char�� �����ش�.
FROM
emp;

SELECT
    empno,
    ename,
    hiredate,
    next_day(add_months(hiredate, 3),
             '������') AS r_job,
    nvl(to_char(comm),
        'N/A')      AS comm
FROM
    emp;

-- EMP ���̺��� ��� ����� ������� ���� ����� ��� ��ȣ(MGR)�� ������ ���� ������ �������� ��ȯ�ؼ� CHG_MGR ���� ����Ͻÿ�.
-- ���ӻ���� ��� ��ȣ�� �������� ���� ��� : 0000
-- ���ӻ���� ��� ��ȣ �� ���ڸ��� 75�� ��� : 5555
-- ���ӻ���� ��� ��ȣ �� ���ڸ��� 76�� ��� : 6666
-- ���ӻ���� ��� ��ȣ �� ���ڸ��� 77�� ��� : 7777
-- ���ӻ���� ��� ��ȣ �� ���ڸ��� 78�� ��� : 8888
-- �� �� ���� ��� ��� ��ȣ�� ��� : ���� ���� ����� �����ȣ �״�� ���

SELECT empno,
ename,
mgr,
decode(
    substr(to_char(mgr), 1, 2),
    null,
    '0000',
    '75',
    '5555',
    '76',
    '6666',
    '77',
    '7777',
    '78',
    '8888',
    substr(to_char(mgr),
           1)
) as chg_mgr
from
emp;

SELECT
    empno,
    ename,
    mgr,
    CASE
        WHEN mgr IS NULL THEN
            '0000'
        WHEN substr(to_char(mgr), 1, 2) = '75' THEN
            '5555'
        WHEN substr(to_char(mgr), 1, 2) = '76' THEN
            '6666'
        WHEN substr(to_char(mgr), 1, 2) = '77' THEN
            '7777'
        WHEN substr(to_char(mgr), 1, 2) = '78' THEN
            '8888'
        ELSE
            to_char(mgr)
    END AS chg_mgr
FROM
    emp;

-- ������ �Լ� : sum, count, max, min, avg
--ORA-00937: ���� �׷��� �׷� �Լ��� �ƴմϴ�
--select
--    ename,
--    sum(sal)
--    from
--   emp;

SELECT
    SUM(sal)
FROM
    emp;

SELECT
    SUM(DISTINCT sal),
    SUM(ALL sal),
    SUM(sal)
FROM
    emp;

-- SUM() : NULL �� �����ϰ� �հ� ������
SELECT
    SUM(comm)
FROM
    emp;

SELECT
    COUNT(comm)
FROM
    emp;

SELECT
    COUNT(*)
FROM
    emp
where deptno = 30;

SELECT
    max(sal)
FROM
    emp;

-- �μ���ȣ�� 20�� ����� �Ի��� �� ���� �ֱ� �Ի���
SELECT
    max(hiredate)
FROM
    emp
where deptno = 20;

-- �μ���ȣ�� 20�� ����� �Ի��� �� ���� ������ �Ի���
SELECT
    min(hiredate)
FROM
    emp
where deptno = 20;

select avg(sal)
from emp
where deptno = 30;

-- group by : ��� ���� ���ϴ� ���� ���� ���

-- �μ��� sal ��� ���ϱ�
select avg(sal) from emp where deptno=10;
select avg(sal) from emp where deptno=20;
select avg(sal) from emp where deptno=30;
SELECT
    AVG(sal),
    deptno,
    ename
FROM
    emp
GROUP BY
    deptno;

-- �μ��� �߰����� ��� ���ϱ�
SELECT
    deptno,
    AVG(comm)
FROM
    emp
GROUP BY
    deptno;

    -- group by ǥ������ �ƴմϴ�.
-- SELECT
--    avg(sal),
--    deptno,
--    ename
--FROM
--    emp
-- GROUP BY
--    deptno;

-- group by + having : group by ���� ������ �� ��
-- having : �׷�ȭ�� ����� ��� ���� �ɶ�

-- �� �μ��� ��å�� ��� �޿� ���ϱ�(��, ��� �޿��� 2000�̻��� �׷츸 ���)
-- deptno, job, ���

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000
ORDER BY
    deptno,
    job;


-- �׷� �Լ��� �㰡���� �ʽ��ϴ�.
-- SELECT
--    deptno,
--    job,
--    AVG(sal)
--FROM
--    emp
--WHERE
--    AVG(sal) >= 2000
--GROUP BY
--   deptno,
--    job
--ORDER BY
--    deptno,
--    job;

-- 1) from ���� ���� 2) where ���� 3) group by 4) having 5) select 6) order by
 SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
WHERE
    sal <= 3000
GROUP BY
   deptno,
    job
having
    avg(sal) >= 2000
ORDER BY
    deptno,
    job;


-- emp ���̺��� �̿��Ͽ� �μ���ȣ(DEPTNO), ��ձ޿�(AVG_SAL), �ְ�޿�(MAX_SAL), �����޿�(MIN_SAL), �����(CNT)�� ����Ѵ�. 
-- ��, ��� �޿��� ����� �� �Ҽ����� �����ϰ� �� �μ���ȣ���� ����ϴ� SQL ���� �ۼ��Ͻÿ�.

SELECT DEPTNO, FLOOR(AVG(SAL)) AS AVG_SAL, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, COUNT(*) AS CNT
FROM EMP
GROUP BY DEPTNO;


-- ���� ��å�� �����ϴ� ����� 3�� �̻��� ��å�� �ο� ���� ����ϴ� SQL���� �ۼ��Ͻÿ�.

SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(JOB) >= 3;

-- ������� �Ի翬��(HIRE_YEAR)�� �������� �μ����� �� ���� �Ի��ߴ� �� ����ϴ� SQL�� �ۼ��Ͻÿ�.
SELECT TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR, DEPTNO, COUNT(*) AS CNT
FROM emp
GROUP BY TO_CHAR(HIREDATE,'YYYY'), deptno;

-- ���� : ���� ���̺��� �ϳ��� ���̺�ó�� ���
-- 1) ��������(inner join)`: ���� ���� ���̺��� ����� �κи� ����
-- 1. �����: �� ���� ���� ��ġ�� �� �� ����
-- 2. ������ : ������ �ش��� �� �� ����

-- 2) �ܺ�����(outer join)
-- 1. left outer join
-- 2. right outer join
-- 3. full outer join

-- dept : 4�� , emp : 120god ==> 4*12 = 48��
-- ũ�ν� ����(���� �� �ִ� ��� ���� ����)
select *
from emp, dept
order by empno;


-- ORA-00918: ���� ���ǰ� �ָ��մϴ�, 00918. 00000 -  "column ambiguously defined"
-- �ߺ��� �÷��� ���� �� ������ ����

-- inner join
select e.empno, e.ename, d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno;

-- SQL-99 ǥ��
-- join ~ on
select e.empno, e.ename, d.deptno, d.dname, d.loc
from emp e join dept d on e.deptno = d.deptno;

select e.empno, e.ename, d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and sal >= 3000;

-- SQL-99 ǥ��
-- join ~ on

select e.empno, e.ename, d.deptno, d.dname, d.loc
from emp e join dept d on e.deptno = d.deptno 
where sal >= 3000;


-- emp, dept inner join, �޿��� 2500 �����̰�, �����ȣ�� 9999 ������ ��� ���� ��ȸ
select e.empno, e.ename, d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and e.sal <= 2500 and e.empno <=9999;


-- SQL-99 ǥ��
-- join ~ on
select e.empno, e.ename, d.deptno, d.dname, d.loc
from emp e join dept d on e.deptno = d.deptno
where e.sal <= 2500 and e.empno <=9999;


-- emp�� salgrade ����
-- emp ���̺��� sal �� salgrade ���̺��� losal �� hisal ������ ���� ���·� ����

select *
from emp e, salgrade s
where e.sal between s.losal and s.hisal;

-- SQL-99 ǥ��
-- join ~ on
select *
from emp e join salgrade s on e.sal between s.losal and s.hisal;


-- self join : �ڱ� �ڽ� ���̺�� ����
select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1, emp e2
where e1.mgr = e2.empno;

-- outer join

-- 1) left outer join
select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1, emp e2
where e1.mgr = e2.empno(+);

-- SQL-99 ǥ��
-- join ~ on
select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1 left outer join emp e2 on e1.mgr = e2.empno;


-- 2) right outer join
select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1, emp e2
where e1.mgr(+) = e2.empno;

-- SQL-99 ǥ��
-- join ~ on
select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1 right outer join emp e2 on e1.mgr = e2.empno;


-- ORA-01468: outer-join�� ���̺��� 1���� ������ �� �ֽ��ϴ�
-- 01468. 00000 -  "a predicate may reference only one outer-joined table"
-- select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
-- from emp e1, emp e2
-- where e1.mgr(+) = e2.empno(+);

-- SQL-99 ǥ��
-- join ~ on
select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1 full outer
JOIN emp e2 ON e1.mgr =
e2.empno;


-- �����ؾ� �� ���̺��� 3���� ��

-- select *
-- from table t1, table t2, table t3
-- where t1.empno = t2.empno and t2.deptno = t3.deptno;

-- select *
-- from table t1 join table2 t2 on t1.empno = t2.empno join table3 t3 on t2.deptno = t3.deptno;

-- �޿��� 2000�ʰ��� ������� �μ� ����, ��� ������ �Ʒ��� ���� ����ϴ� sql���� �ۼ��Ͻÿ�.

SELECT
    d.deptno,
    d.dname,
    e.empno,
    e.ename,
    e.sal
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND e.sal > 2000;

SELECT
    d.deptno,
    d.dname,
    e.empno,
    e.ename,
    e.sal
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
    e.sal > 2000;

-- �� �μ��� ��� �޿�, �ִ� �޿�, �ּ� �޿�, ������� ����ϴ� sql���� �ۼ��Ͻÿ�.
select d.deptno, d.dname, floor(avg(sal)) as avg_sal, max(sal) as max_sal, min(sal) as min_sal, count(*) as cnt
from emp e, dept d
where e.deptno = d.deptno
group by d.deptno, d.dname;

-- ��� �μ������� ��� ������ �Ʒ��� ���� �μ���ȣ, ����̸� ������ �����Ͽ� ����ϴ� sql���� �ۼ��Ͻÿ�.

select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from dept d, emp e
where d.deptno = e.deptno(+);

select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from dept d left outer
JOIN emp e ON d.deptno =
e.deptno;

-- ��������
-- sql ���� �����ϴ� �� �ʿ��� �����͸� �߰��� ��ȸ�ϱ� ���� sql �� ���ο��� ����ϴ� select ��
-- 1) ������ �������� 2) ������ �������� 3) ���߿� ��������

--select ��ȸ�� ��
--from ���̺� ��
--where ���ǽ�(select ��ȸ�� �� from ���̺� where ���ǽ�)

-- ������ �޿����� ���� �޿��� �޴� ��� ��ȸ
-- jones �޿� �˾Ƴ��� / �˾Ƴ� jones �޿��� ������ ���ǽ�

SELECT
    sal
FROM
    emp
WHERE
    ename = 'JONES'; -- 2975

SELECT
    *
FROM
    emp
WHERE
    sal > 2975;

-- ������ �������� : �������� ����� �ϳ��� �� ��ȯ
-- =, >, <, >=, <=, <>, ^=, != ������ ���


-- ������ �޿����� ���� �޿��� �޴� ��� ��ȸ(��������)
SELECT
    *
FROM
    emp
WHERE
    sal > (
        SELECT
            sal
        FROM
            emp
        WHERE
            ename = 'JONES'
    );

-- ����̸��� ALLEN �� ����� �߰����� ���� ���� �߰������� �޴� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    sal > (
        SELECT
            comm
        FROM
            emp
        WHERE
            ename = 'ALLEN'
    );

-- ����̸��� WARD �� ����� �Ի��Ϻ��� ���� �Ի��� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    hiredate < (
        SELECT
            hiredate
        FROM
            emp
        WHERE
            ename = 'WARD'
    );

-- 20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ������� ��
-- �μ����� ��ȸ
-- �����ȣ, �����, ����, �޿�, �μ���ȣ, �μ���, ����

select e.empno, e.ename, e.job, e.sal, d.deptno, d.dname, d.loc
from emp e join dept d on e.deptno = d.deptno
where e.deptno = 20 and e.sal > (select avg(sal) from emp);

-- 20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� �۰ų� ���� �޿��� �޴� ������� ��
-- �μ����� ��ȸ

select e.empno, e.ename, e.job, e.sal, d.deptno, d.dname, d.loc
from emp e join dept d on e.deptno = d.deptno
where e.deptno = 20 and e.sal <= (select avg(sal) from emp);


-- ������ �������� : �������� ����� ���� ���� �� ��ȯ
-- IN, ANY(SOME), ALL, EXISTS ������ ���(������ ���������� ���� ������ ��� �Ұ�)

-- �� �μ��� �ְ� �޿��� ������ �޿��� �޴� ������� ��ȸ

-- �� �μ��� �ְ� �޿�
select max(sal) from emp group by deptno;

-- ���� �� ���� ���ǿ� 2�� �̻��� ���� ���ϵǾ����ϴ�.
-- select * from emp where sal = (select max(sal) from emp group by deptno);

-- IN : �������� ����� �������� ��� �� �ϳ��� ��ġ�ϸ� TRUE
select * from emp where sal IN (select max(sal) from emp group by deptno);

-- 30�� �μ� ������� �޿����� ���� �޿��� �޴� ��� ���� ��ȸ

-- any(some) : �������� ����� �������� ����� �ϳ��̻��̸� TRUE
select * from emp where sal < any (select sal from emp WHERE deptno = 30);
select * from emp where sal < some (select sal from emp WHERE deptno = 30);

-- �� ����� ������ ������ �ۼ��� ������ ��Ȳ��
select * from emp where sal < (select max(sal) from emp WHERE deptno = 30);

-- 30�� �μ� ������� �ּ� �޿����� ���� �޿��� �޴� ��� ���� ��ȸ

-- 1. ������ ��������
select * from emp where sal > (select min(sal) from emp WHERE deptno = 30);
-- 2. ������ ��������
SELECT
    *
FROM
    emp
WHERE
    sal > ANY (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );

-- ALL : �������� ��� ����� ���ǽĿ� �¾� �������߸� �������� ���ǽ��� TRUE
SELECT
    *
FROM
    emp
WHERE
    sal < ALL (
        SELECT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );

-- EXISTS : ���� ������ ��� ���� �ϳ� �̻� �����ϸ� ���ǽ��� ��� TRUE, �������� ������ false
SELECT
    *
FROM
    emp
WHERE
    EXISTS (
        SELECT
            dname
        FROM
            dept
        WHERE
            deptno = 10
    );

SELECT
    *
FROM
    emp
WHERE
    EXISTS (
        SELECT
            dname
        FROM
            dept
        WHERE
            deptno = 50
    );

-- ��ü ��� �� ALLEN�� ���� ��å�� ������� �������, �μ� ������ ������ ���� ����ϴ� sql���� �ۼ��Ͻÿ�.
SELECT
    e.job,
    e.empno,
    e.ename,
    e.sal,
    d.deptno,
    d.dname
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND e.job = (
        SELECT
            job
        FROM
            emp
        WHERE
            ename = 'ALLEN'
    );

-- ��ü ����� ��� �޿����� ���� �޿��� �޴� ������� �������, �μ�����, �޿� ��� ������ ����ϴ� sql���� �ۼ��Ͻÿ�
-- (�� ����� �� �޿��� ���� ������ �����ϵ� �޿��� ���� ��쿡�� ��� ��ȣ�� �������� ������������ �����ϱ�)

SELECT
    e.empno,
    e.ename,
    d.dname,
    e.hiredate,
    d.loc,
    e.sal,
    s.grade
FROM
    emp      e,
    dept     d,
    salgrade s
WHERE
        e.deptno = d.deptno
    AND e.sal BETWEEN s.losal AND s.hisal
        AND e.sal > (
        SELECT
            AVG(sal)
        FROM
            emp
    )
ORDER BY
    e.sal DESC,
    e.empno ASC;

-- ���߿� �������� : ���������� select ���� ���� �����͸� ���� �� ����

SELECT
    *
FROM
    emp
WHERE
    ( deptno, sal ) IN (
        SELECT
            deptno, MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );

-- FROM ���� ����ϴ� ��������(�ζ��� ��)
-- from ���� ���� ���̺��� ����ؼ� ����ϱ⿡�� ���̺� �� ������ �Ը� Ŭ ��, ���ʿ��� ���� ���� ��
SELECT
    e10.empno,
    e10.ename,
    e10.deptno,
    d.dname,
    d.loc
FROM
    (
        SELECT
            *
        FROM
            emp
        WHERE
            deptno = 10
    ) e10,
    (
        SELECT
            *
        FROM
            dept
    ) d
WHERE
    e10.deptno = d.deptno;

-- select ���� ����ϴ� ��������(��Į�� ��������)
-- select ���� ����ϴ� ���������� �ݵ�� �ϳ��� ����� ��ȯ�ؾ� ��
SELECT
    empno,
    ename,
    job,
    sal,
    (
        SELECT
            grade
        FROM
            salgrade
        WHERE
            e.sal BETWEEN losal AND hisal
    ) AS salgrade,
    deptno,
    (
        SELECT
            dname
        FROM
            dept
        WHERE
            e.deptno = dept.deptno
    ) AS dname
FROM
    emp e;

-- 10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ���� ������� �������, �μ� ������ ������ ���� ����ϴ� sql���� �ۼ��Ͻÿ�.
SELECT
    e.empno,
    e.ename,
    e.job,
    d.deptno,
    d.dname,
    d.loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND e.job NOT IN (
        SELECT
            job
        FROM
            emp
        WHERE
            deptno = 30
    )
        AND e.deptno = 10;
    
-- ��å�� SALESMAN�� ������� �ְ� �޿����� ���� �޿��� �޴� ������� �������, �޿���� ������ ����ϴ� SQL���� �ۼ��Ͻÿ�
-- (��, ���������� Ȱ���� �� ������ �Լ��� ����ϴ� ����� ������� �ʴ� ����� ���� �����ȣ�� �������� �������� �����Ͽ� ����Ͻÿ�.)

-- ������ ��������
SELECT
    e.empno,
    e.ename,
    e.sal,
    s.grade
FROM
    emp      e,
    salgrade s
WHERE
    e.sal BETWEEN s.losal AND s.hisal
    AND e.sal > (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            job = 'SALESMAN'
    )
ORDER BY
    e.empno;
    


-- ������ �Լ� ��� ��(IN, ANY, SOME, ALL, EXISTS)
SELECT
    e.empno,
    e.ename,
    e.sal,
    (
        SELECT
            grade
        FROM
            salgrade
        WHERE
            e.sal BETWEEN losal AND hisal
    ) AS grade
FROM
    emp e
WHERE
    e.sal > ALL (
        SELECT
            sal
        FROM
            emp
        WHERE
            job = 'SALESMAN'
    )
ORDER BY
    e.empno;

-- DML(data manipulation language) : ������ �߰�(INSERT), ����(UPDATE), ����(DELETE)�ϴ� ������ ���۾�
-- COMMIT : DML �۾��� �����ͺ��̽��� ���� �ݿ�
-- ROLLBACK : DML �۾��� ���
-- select + DML ==> ���� ����ϴ� sql ��

-- ������ ���̺� ����
-- �⺻ ���̺� ����
CREATE TABLE dept_temp
    AS
        SELECT
            *
        FROM
            dept;

DROP TABLE dept_temp;

-- ���̸��� ���û�����
-- insert into ���̺��̸�(���̸�1, ���̸�2......)
-- values(������1, ������2....);


-- dept_temp ���ο� �μ� �߰��ϱ�
INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    50,
    'DATABASE',
    'SEOUL'
);

-- �� �̸� ������ ��
INSERT INTO dept_temp VALUES (
    60,
    'NETWORK',
    'BUSAN'
);

-- INSERT �� ����

-- ORA-01438: �� ���� ���� ������ ��ü �ڸ������� ū ���� ���˴ϴ�.
-- INSERT INTO DEPT_TEMP
-- VALUES(600,'NETWORK','BUSAN');

-- ORA-01722: ��ġ�� �������մϴ�
-- INSERT INTO DEPT_TEMP
-- VALUES('NO', 'NETWORK','BUSAN');

-- ORA-00947: ���� ���� ������� �ʽ��ϴ�
-- insert into dept_temp(deptno, dname, loc)
-- values(70,'DATABASE');

-- NULL ����
INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    80,
    'WEB',
    NULL
);

INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    90,
    'MOBILE',
    ''
);

-- NULL ������ �÷��� �������� �ʾ���
-- ���Խ� ��ü �÷��� �������� �ʴ´ٸ� �ʵ�� �ʼ�
INSERT INTO dept_temp (
    deptno,
    loc
) VALUES (
    91,
    'INCHEON'
);

SELECT
    *
FROM
    dept_temp;


-- emp_temp ����(emp ���̺� ���� - �����ʹ� ���縦 ���� ���� ��)
-- ������ ����
CREATE TABLE emp_temp
    AS
        SELECT
            *
        FROM
            emp
        WHERE
            1 <> 1;

SELECT
    *
FROM
    emp_temp;

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    9999,
    'ȫ�浿',
    'PRESIDENT',
    NULL,
    '2001/01/01',
    5000,
    1000,
    10
);

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    1111,
    '������',
    'MANAGER',
    9999,
    '2002-01-05',
    4000,
    NULL,
    20
);

-- ��¥ �Է� �� ��/��/�� ���� => ��/��/�� ����
-- ��¥ ������ ������ ���ʿ��� �����Ͱ� ����
-- insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
-- values(2222,'�̼���','MANAGER',9999,'07/01/2001',4000,NULL,20);

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    2222,
    '�̼���',
    'MANAGER',
    9999,
    TO_DATE('07/01/2001', 'DD/MM/YYYY'),
    4000,
    NULL,
    20
);

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    3333,
    '�ɺ���',
    'MANAGER',
    9999,
    sysdate,
    4000,
    NULL,
    30
);

-- ���������� INSERT ����
-- emp, salgrade ���̺��� ���� �� �޿� ����� 1�� ����� emp_tmep �� �߰�
INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
)
    SELECT
        e.empno,
        e.ename,
        e.job,
        e.mgr,
        e.hiredate,
        e.sal,
        e.comm,
        e.deptno
    FROM
        emp      e,
        salgrade s
    WHERE
        e.sal BETWEEN s.losal AND s.hisal
        AND s.grade = 1;

SELECT
    *
FROM
    emp_temp;
    
COMMIT;
    
    
    
-- UPDATE : ���̺� �ִ� ������ ����

-- UPDATE ���̺��
-- SET ������ ���̸� = ������, ������ ���̸� = ������ ....
-- WHERE ������ ���� ��� ���� �����ϱ� ���� ����

SELECT * FROM dept_temp;

-- dept_temp �μ���ȣ�� 40���� loc ���� ���� seoul �� ����
update dept_temp
set loc = 'SEOUL';
WHERE DEPTNO = '40';
ROLLBACK;

-- ������ �Ϻκ� ����: WHERE ���
-- DEPT_TEMP �μ���ȣ�� 40���� LOC ���� ���� SEOUL �� ����
UPDATE dept_temp
SET
    loc = 'SEOUL'
WHERE
    deptno = '40';

-- DEPT_TEMP �μ���ȣ�� 80���� DNAME �� SALES, LOC �� CHICAGO
UPDATE dept_temp
SET
    dname = 'SALES',
    loc = 'CHICAGO'
WHERE
    deptno = 80;

SELECT
    *
FROM
    dept_temp;

-- emp_temp ����� �߿��� �޿��� 2500������ ����� �߰������� 50���� ����
UPDATE emp_temp
SET
    comm = 50
WHERE
    sal <= 2500;

-- ���������� ����Ͽ� ������ ����
-- dept ���̺��� 40�� �μ��� dname, loc�� dept_temp 40�� �μ��� dname, loc�� ������Ʈ

UPDATE dept_temp
SET
    ( dname,
      loc ) = (
        SELECT
            dname,
            loc
        FROM
            dept
        WHERE
            deptno = 40
    )
WHERE
    deptno = 40;
    
commit;

-- delete : ���̺� �ִ� ������ ����
-- delete ���̺�� 
-- from (����)
-- where ���� �����͸� �����ϱ� ���� ���ǽ�

create table emp_temp2 as select * from emp;

-- job�� manager �� ��� ����

delete from emp_temp2
where job = 'MANAGER';

-- job�� SALESMAN �� ��� ����

delete from emp_temp2
where job = 'SALESMAN';

-- ��ü ������ ����
DELETE EMP_TEMP2;

ROLLBACK;

-- ���������� ����Ͽ� ����
-- �޿� ����� 3����̰�, 30���μ��� ��� ����

SELECT e.empno
from emp_temp2 e, salgrade s
where e.sal between s.losal and s.hisal and e.deptno = 30;

delete from emp_temp2
from empno in (select e.empno from emp_temp2 e, salgrade s where e.sal between s.losal and s.hisal and s.grade=3 and e.deptno = 30);

select *from emp_temp2;

-- �ǽ��� ���Ͽ� ���� ���̺��� �̿��Ͽ� ���̺��� �����Ѵ�.
-- emp ���̺��� ������ �̿��Ͽ� exam_emp ����
CREATE TABLE EXAM_EMP
    AS
        SELECT
            *
        FROM
            EMP;

-- DEPT ���̺��� ������ �̿��Ͽ� exam_DEPT ����
CREATE TABLE EXAM_DEPT
    AS
        SELECT
            *
        FROM
            DEPT;

 -- SALGRADE ���̺��� ������ �̿��Ͽ� exam_SALGRADE ����
CREATE TABLE EXAM_SALGRADE
    AS
        SELECT
            *
        FROM
            SALGRADE; 

-- ������ ������ EXAM_EMP ���̺� �Է��Ͻÿ�.
delete from EXAM_EMP;

INSERT INTO EXAM_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES (7201,'TEST_USER1','MANAGER',7788,'2016-01-02',4500,NULL,50);

INSERT INTO EXAM_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES (7202,'TEST_USER2','CLERK',7201,'2016-02-21',1800,NULL,50);

INSERT INTO EXAM_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES (7203,'TEST_USER3','ANALYST',7201,'2016-04-11',3400,NULL,60);

INSERT INTO EXAM_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES (7204,'TEST_USER4','SALESMAN',7201,'2016-05-31',2700,300,60);

INSERT INTO EXAM_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES (7205,'TEST_USER5','CLERK',7201,'2016-07-20',2600,NULL,70);

INSERT INTO EXAM_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES (7206,'TEST_USER6','CLERK',7201,'2016-09-08',2600,NULL,70);

INSERT INTO EXAM_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES (7207,'TEST_USER7','LECTURER',7201,'2016-10-28',2300,NULL,80);

INSERT INTO EXAM_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES (7208,'TEST_USER8','STUDENT',7201,'2018-03-09',1200,NULL,80);

SELECT * FROM EXAM_EMP;

-- EXAM_EMP�� ���� ��� �� 50�� �μ����� �ٹ��ϴ� ������� ��� �޿����� ���� �޿��� �ް� �ִ� ������� 70�� �μ��� �ű�� SQL �� �ۼ��ϱ�
update exam_emp
set deptno = 70
where sal> (select avg(sal) from exam_emp where deptno=50);

-- EXAM_EMP�� ���� ��� �� 60�� �μ��� ��� �߿��� �Ի����� ���� ���� ������� �ʰ� �Ի��� ����� �޿��� 10% �λ��ϰ� 80�� �μ��� �ű�� SQL�� �ۼ��ϱ�
update exam_emp set sal = sal*1.1, deptno=80 where
hiredate > (select min(hiredate) from exam_emp where deptno=60);

-- EXAM_EMP�� ���� ��� ��, �޿� ����� 5�� ����� �����ϴ� SQL���� �ۼ��ϱ�
delete from exam_emp
where empno in(select empno from exam_emp, salgrade where sal between losal and hisal and grade=5);


-- Ʈ�����(transaction) : �ּ� ���� ����
-- Ʈ����� �����ϴ� ���� TCL(Transaction Control Language) : commit, rollback

create table dept_tcl as select * from dept;

insert into dept_tcl values(50,'DATABASE','SEOUL');

UPDATE dept_tcl set loc='BUSAN' WHERE DEPTNO=40;

DELETE FROM DEPT_TCL where dname = 'RESEARCH';

SELECT * FROM dept_tcl;

-- Ʈ����� ���
rollback;

-- Ʈ����� ���� �ݿ�
commit;

-- ���� : � Ȱ���� ���� �ð��̳� �Ⱓ
-- �����ͺ��̽� ���� : �����ͺ��̽� ������ �������� �����۾� ������ �� ���� ����
-- LOCK : ���(���� ���� ������ ���� ����)

delete from dept_tcl where deptno =50;

update dept_tcl set loc='SEOUL' where deptno=30;

select * from dept_temp;