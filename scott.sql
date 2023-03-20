-- scott

-- emp 테이블 구성 보기
-- 필드명(열이름)     제약조건        데이터타입
--     EMPNO(사원번호)        NOTNULL       NUMBER(4)
--     ENAME(사원명). JOB(직책),MGR(직속상관 번호),HIREDATE(입사일),SAL(급여),COMM(수당),DEPTNO(부서번호)
--     NUMBER : 소수점 자릿수를 포함해서 지정 가능
--     NUMBER(4) : 4자리 숫자까지 허용, NUMBER(8,2) : 전체 자릿수는 8자리이고 소수점 2자리를 포함한다.
--     VARCHAR2 : 가변형 문자열 저장 가능
--     VARCHAR2(10) : 10byte 문자까지 저장 가능
--     DATE : 날짜 데이터


DESC emp;

-- DEPTNO(부서번호),DNAME(부서명),LOC(부서위치)
DESC dept;

-- GRADE(급여등급),LOSAL(최소 급여액), HISAL(최대 급여액)
DESC salgrade;

-- select : 데이터 조회
-- 조회 방식 : 셀렉션(행 단위로 조회), 프로젝션(열 단위로 조회), 조인(두 개 이상의 테이블을 사용하여 조회)
-- SELECT 열이름1, 열이름2.....(조회할 열이 전체라면 * 로 처리)
-- FROM 테이블명;

-- 1. EMP 테이블의 전체 열을 조회
SELECT
    *
FROM
    emp;

-- 2. EMP 테이블에서 사원번호, 이름, 급여 열을 조회
SELECT empno, ename, sal
FROM emp
SELECT
    *
FROM
    emp;
    
-- 3. DEPT 테이블 전체 조회
select * from dept;
-- 4. DEPT 테이블안에 부서번호ㅡ 지역만 조회
select deptno, loc FROM
dept;

-- 5. EMP 테이블 안에 부서번호 조회
SELECT
    deptno
FROM
    emp;

-- 6. EMP 테이블안에 부서번호 조회(단, 중복된 부서 번호는 제거)
-- DISTINCT : 중복 제거
SELECT DISTINCT
    deptno
FROM
    emp;

-- 열이 여러 개인 경우(묶어서 중복이냐 아니냐를 판단)
SELECT DISTINCT
    job, deptno
from
emp;

-- 7. 연산
-- 사원들의 1년 연봉 구하기 ( SAL * 12 + COMM ), 이름 붙이기 : 뒤에 as 이름명(굳이 as 안해도 되고 한 칸띠고 이름), 이름에 공백이 있다면 ""로 묶어주기
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
    ename           사원명,
    job             "직 책",
    sal * 12 + comm annsal
FROM
    emp;


-- 8. 정렬 : ORDER BY
--          내림차순 => DESC, 오름차순 => ASC
--  ENAME, SAL 열 추출하고, SAL 내림차순으로 정렬

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
    sal;  -- asc 는 생략가능

-- 전체 내용 출력하고, 결과가 사원번호의 오름차순으로 정렬
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

--[실습] emp 테이블의 모든 열 출력
-- empno => emplyee_no
-- ename => employee_name
-- mgr => namager
-- sal => salary
-- comm => commission
-- deptno => department_no
-- 부서 번호를 기준으로 내림차순으로 정렬하되 부서번호가 같다면 사원 이름을 기준으로 오름차순 정렬

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

-- WHERE : 특정 조건을 기준으로 원하는 행을 조회

-- 부서번호가 30인 데이터만 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30;  -- = : 같다

-- 사원번호가 7782인 사원 조회

SELECT
    *
FROM
    emp
WHERE
    empno = 7782;

-- 부서번호가 30이고, 사원직책이 SALESMAN인 행 조회
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';

-- 사원번호가 7499이고, 부서번호가 30인 행 조회
SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;

-- 부서번호가 30이거나, 사원직책이 CLERK 인 행 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';
    
-- 산술연산자 : +,-,*,/ 가능, mod(나머지)
-- 비교연산자 : >, >=, <, <=
-- 등가비교연산자 : =, !=, <>, ^= (!=, <>, ^=, : A값과 B값이 다를 경우 true, 같은 경우 false)
-- 논리부정연산자 : NOT
-- IN 연산자
-- BETWEEN A AND B 연산자
-- LIKE 연산자와 와일드 카드(_,%)
-- 집합연산자 : UNION(합집합-중복제거), UNION ALL(합집합-중복포함), MINUS(차집합), INTERSECT(교집합)

-- 연산자 우선순위
-- 1) 산술연산자 *, /
-- 2) 산술연산자 +, -
-- 3) 비교연산자
-- 4) IS NULL, IS NOT NULL, LIKE, IN
-- 5) BETWEEN A AND B
-- 6) NOT
-- 7) AND
-- 8) OR
-- 우선순위를 줘야 한다면 소괄호 사용 추천



-- EMP 테이블에서 급여 열에 12를 곱한 값이 36000 인 행 조회
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

-- ename 이 F 이후의 문자로 시작하는 사원 조회
-- 문자 표현시 ''만 사용
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

-- JOB이 MANAGER, SALESMAN, CLERK 사원 조회

SELECT
    *
FROM
    emp
WHERE
    job = 'MANAGER'
    OR job = 'SALESMAN'
       OR job = 'CLERK';

-- sal 이 3000이 아닌 사원 조회
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

-- JOB이 MANAGER, SALESMAN, CLERK 사원 조회 ==> IN 연산자
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'MANAGER', 'SALESMAN', 'CLERK' );

-- JOB 이 MANAGER, SALESMAN, CLERK 아닌 사원 조회
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

-- 부서번호가 10,20 사원조회(in 사용)

SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );

-- 급여가 2000 이상 3000 이하인 사원 조회

SELECT
    *
FROM
    emp
WHERE
        sal >= 2000
    AND sal <= 3000;

-- between 최소값 and 최대값;

SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;

-- 급여가 2000 이상 3000 이하가 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;

-- LIKE 연산자와 와일드 카드(_,%)
-- _ : 어떤 값이든 상관없이 한 개의 문자 데이터를 의미
-- % : 길이와 상관없이(문자 없는 경우도 포함) 모든 문자 데이터를 의미

-- 사원 이름이 S로 시작하는 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

-- 사원 이름의 두번 째 글작 L 인 사원만 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';
-- 사원 이름에 AM 이 포함된 사원만 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM';
-- 사원 이름에 AM 이 포함되지 않은 사원만 조회
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM';

-- NULL : 데이터 값이 완전히 비어 있는 상태
-- = 을 사용할 수 없음

-- COMM 이 NULL인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;

-- MGR 이 NULL인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL;

-- MGR 이 NULL이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;

-- 집합연산자

-- union, union all : 합집합

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

-- EMP 테이블에서 사원이름이 S로 끝나는 사원 데이터 조회
SELECT * FROM emp
where ename like '%S';

-- EMP 테이블에서 30번 부서에 근무하는 사원 중에서 직책이 SALESMAN인 사원의
-- 사원번호, 이름, 급여 조회(SAL 내림차순)
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE deptno = 30 and  job = 'SALESMAN'
order by EMPNO, ENAME, SAL desc;

-- EMP 테이블을 사용하여 20,30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인 사원 조회
-- 사원번호, 이름, 급여, 부서번호 조회
-- 집합 연산자를 사용하는 방식과 사용하지 않는 방식 두 가지를 사용한다

-- 집합연산자 사용하지 않은 경우
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE deptno IN(20,30) and  SAL > 2000;
order by EMPNO, ENAME, SAL
desc;

-- 집합연산자 사용한 경우
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

-- 사원 이름에 E가 포함되어 있는 30번 부서 사원 중 급여가 1000~2000 사이가 아닌 사원의 이름
-- 사원번호, 급여, 부서번호를 조회하기

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

-- 추가 수당이 존재하지 않으며, 상급자가 있고 직책이 MANAGER, CLERK 인 사원 중에서 사원 이름의
-- 두번 째 글자가 L 이 아닌 사원의 정보 조회

SELECT
    *
FROM
    emp
WHERE
    comm IS NULL
    AND mgr IS NOT NULL
        AND job IN ( 'MANAGER', 'CLERK' )
            AND ename NOT LIKE '_L%';

-- 오라클 함수
-- 오라클에서 기본적으로 제공한느 내장 함수와 사용자가 필요에 의해 직접 정의한 사용자 정의 함수

-- 1. 문자열 함수
-- 1) UPPER, LOWER, INITCAP
-- UPPER : 모두 대문자, LOWER : 모두 대문자 INITCAP : 첫 글자만 대문자
-- LIKE '%ORACLE%' OR LIKE '%oracle%'  ==> 검색 시 사용
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

-- 2) LENGTH : 문자열 길이
SELECT
    ename,
    length(ename)
FROM
    emp;

-- 사원 이름의 길이가 5 이상인 사원 조회
SELECT
    ename,
    length ( ename ) FROM emp WHERE
        length(ename) >= 5;

-- 한글일 때
-- dual : sys가 소유하는 테이블(임시 연산이나 함수의 결과 값 확인하는 용도)
-- length, lengthb(문자가 사용하는 바이트 수)
-- 영어 : 문자1 => 1byte, 한글 : 문자 1 => 3byte
SELECT
    length('한글'),
    lengthb('한글'),
    lengthb('ab')
FROM
    dual;

-- 3) SUBSTR(문자열데이터, 시작위치, 추출길이) : 추출길이 생략 가능
--      문자열 일부 추출

SELECT
    JOB, SUBSTR(JOB, 1,2), SUBSTR(JOB,3,2), SUBSTR(JOB,5), SUBSTR(JOB,-3)
    FROM
        EMP;

-- ENAME, 세번째 글자부터 출력
SELECT
    ENAME,
    SUBSTR(ENAME, 3)
    FROM
    EMP;

-- 3) INSTR : 문자열 데이터 안에서 특정 문자 위치 찾기
-- INSTR(대상문자열, 위치를 찾으려는 문자열, 대상문자열에서 찾기를 시작할 위치(선택),시작위치에서 찾으려는 문자가 몇번째인지 지정

-- HELLO, ORACLE! 문자열에서 L 문자열 찾기
SELECT  INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
        INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
        INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
FROM daul;

--4) replace : 특정 문자를 다른 문자로 변경
-- relplace(문자열데이터, 찾는문자, 변경문자)

-- 010-1234-5678 - 를 빈 문자열로 변경 / -를 없애기
select '010-1234-5678' as 변경전, replace('010-1234-5678','-',' ') as replace_1, replace('010-1234-5678','-') as replace_2
from dual;

-- '이것이 Oracle 이다', '이것이' => this is 변경
select '이것이 Oracle 이다' as 변경전, replace('이것이 Oracle 이다','이것이','This is') as replace_1
from dual;

-- 5) concat : 두 문자열 데이터 합치기
select
concat(empno, ename)
from
emp;
-- concat(empno,':',ename) : 오류남, 딱 2개만 수용하기 때문
select
concat(empno,concat(':',ename))
from
emp;