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

