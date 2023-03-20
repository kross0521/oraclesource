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
FROM daul;

--4) replace : Ư�� ���ڸ� �ٸ� ���ڷ� ����
-- relplace(���ڿ�������, ã�¹���, ���湮��)

-- 010-1234-5678 - �� �� ���ڿ��� ���� / -�� ���ֱ�
select '010-1234-5678' as ������, replace('010-1234-5678','-',' ') as replace_1, replace('010-1234-5678','-') as replace_2
from dual;

-- '�̰��� Oracle �̴�', '�̰���' => this is ����
select '�̰��� Oracle �̴�' as ������, replace('�̰��� Oracle �̴�','�̰���','This is') as replace_1
from dual;

-- 5) concat : �� ���ڿ� ������ ��ġ��
select
concat(empno, ename)
from
emp;
-- concat(empno,':',ename) : ������, �� 2���� �����ϱ� ����
select
concat(empno,concat(':',ename))
from
emp;