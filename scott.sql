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
select
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
FROM
daul;

--4) replace : 특정 문자를 다른 문자로 변경
-- relplace(문자열데이터, 찾는문자, 변경문자)

-- 010-1234-5678 - 를 빈 문자열로 변경 / -를 없애기
SELECT
    '010-1234-5678'                    AS 변경전,
    replace('010-1234-5678', '-', ' ') AS replace_1,
    replace('010-1234-5678', '-')      AS replace_2
FROM
    dual;

-- '이것이 Oracle 이다', '이것이' => this is 변경
SELECT
    '이것이 Oracle 이다'                            AS 변경전,
    replace('이것이 Oracle 이다', '이것이', 'This is') AS replace_1
FROM
    dual;

-- 5) concat : 두 문자열 데이터 합치기
SELECT
    concat(empno, ename)
FROM
    emp;
    
-- concat(empno,':',ename) : 오류남, 딱 2개만 수용하기 때문
SELECT
    concat(empno,
           concat(':', ename))
FROM
    emp;

-- || : 문자열 연결 연산자
SELECT
    empno || ename,
    empno || ':'
             || ename
FROM
    emp;

-- 6) TRIM, LTRIM, RTRIM : 공백 포함 특정 문자 제거
SELECT
    '    이것이    ',
    TRIM(' 이것이 ')
FROM
    dual;

-- 2. 숫자함수
-- 1) ROUND, TRUNC, CEIL, FLOOR, MOD

SELECT
    round(1234.5678)      AS round,      -- 소수점 첫째 자리에서 반올림
    round(1234.5678, 0)   AS round0,   -- 소수점 첫째 자리에서 반올림
    round(1234.5678, 1)   AS round1,   -- 소수점 둘째 자리에서 반올림
    round(1234.5678, 2)   AS round2,   -- 소수점 세번째 자리에서 반올림
    round(1234.5678, - 1) AS round_minus1,   -- 자연수 첫번째 자리에서 반올림
    round(1234.5678, - 2) AS round_minus2    -- 자연수 두번째 자리에서 반올림
FROM
    dual;

--trunc : 특정 위치에서 버리는 함수
--trunc(숫자, 버림 위치(선택))
SELECT
    round(1234.5678)      AS trunc,          -- 소수점 첫째 자리에서 반올림
    round(1234.5678, 0)   AS trunc0,         -- 소수점 첫째 자리에서 반올림
    round(1234.5678, 1)   AS trunc1,         -- 소수점 둘째 자리에서 반올림
    round(1234.5678, 2)   AS trunc2,         -- 소수점 세번째 자리에서 반올림
    round(1234.5678, - 1) AS trunc_minus1,   -- 자연수 첫째 자리에서 반올림
    round(1234.5678, - 2) AS trunc_minus2    -- 자연수 둘째 자리에서 반올림
FROM
    dual;
    

-- ceil(숫자), floor(숫자) : 입력된 숫자와 가까운 큰 정수, 작은 정수

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
    
-- 날짜 함수
-- 날짜 데이터 + 숫자 : 날짜 데이터보다 숫자만큼 일수 이후의 날짜
-- 날짜 데이터 - 날짜 데이터 : 두 날짜 데이터 간의 일수 차이

-- 날짜 데이터 + 날짜 데이터 : 연산불가
-- 1) sysdate 함수 : 오라클 데이터베이스 서버가 설치된 os의 현재날짜와 시간을 가져옴
SELECT
    sysdate,
    sysdate - 1 AS yesterday,
    sysdate + 1 AS tomorrow
FROM
    dual;
    
-- 2) add_months(날짜, 더할 개월수) : 몇 개월 이후 날짜 구하기
SELECT
    sysdate,
    add_months(sysdate, 3)
FROM
    dual;

-- 입사 50주년이 되는 날짜 구하기
-- empno, ename, hiredate, 입사 50주년날짜 조회
SELECT
    empno,
    ename,
    hiredate,
    add_months(hiredate, 600)
FROM
    emp;

--3) months_between(첫번째 날짜, 두번째 날짜) : 두 날짜 데이터 간의 날짜 차이를 개월 수로 계산하여 출력

-- 입사 45년 미만인 사원 데이터 조회
-- empno, ename, hiredate

SELECT
    empno,
    ename,
    hiredate
FROM
    emp
WHERE
    months_between(sysdate, hiredate) < 540;

-- 현재 날짜와 6개월 후 날짜가 출력
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

-- 4)   next_day,(날짜 , 요일) : 특정 날짜를 기준으로 돌아옹는 요일의 날짜 출력
--      last_day (날짜) : 특정 날짜가 속한 달의 마지막 날짜를 출력
SELECT
    sysdate,
    next_day(sysdate, '금요일'),
    last_day(sysdate)
FROM
    dual;

-- 날짜의 반올림, 버림 : ROUND, TRUNK
-- CC : 네 자리 연도의 끝 두자리를 기준으로 사용
--      2023 년인 경우 2050 이하이므로 2001년으로 처리

SELECT
    sysdate,
    round(sysdate, 'CC')   AS format_cc,
    round(sysdate, 'YYYY') AS format_yyyy,
    round(sysdate, 'DDD')  AS format_ddd,
    round(sysdate, 'HH')   AS format_hh
FROM
    dual;

-- 형변환 함수 : 자료형을 형 변환
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

-- TO_CHAR() : 숫자 또는 날짜 데이터를 문자 데이터로 변환
-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환
-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환

-- 원하는 출력 형태로 날짜 출력하기 TO_CHAR 주로 사용됨
SELECT
    sysdate,
    to_char(sysdate, 'HH12:MI:SS AM') AS 현재날짜시간
FROM
    dual;

-- MON, MONTH : 월 이름
-- DDD : 365일 중에서 며칠 지났는 지 알려줌
SELECT
    sysdate,
    to_char(sysdate, 'YYYY/MM/DD') AS 현재날짜,
    to_char(sysdate, 'YYYY') AS 현재연도,
    to_char(sysdate, 'MM') AS 현재월,
    to_char(sysdate, 'MON') AS 현재월1,
    to_char(sysdate, 'DD') AS 현재일자,
    to_char(sysdate, 'DDD') AS 현재일자2
    to_char(sysdate, 'HH12:MI:SS AM') AS 현재날짜시간
FROM
dual;

-- sal 필드에 , 나 통화표시를 하고 싶다면?
-- L (Locale) 지역 화폐 단위 기호 붙여줌
SELECT
    sal,
    to_char(sal, '$999,999') AS sal_$,
    to_char(sal, 'L999,999') AS sal_l
FROM
    emp;








-- TO_NUMBER(문자열데이터, 인식 될 숫자형태)

-- 자동형변환
SELECT
    1300 - '1500',
    '1300' + 1500
FROM
    dual;

-- 자동형변환안되는 상황
SELECT
    TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
FROM
    dual;

-- to_date(문자열데이터, '인식될 날짜 형태')
SELECT
    TO_DATE('2018-07-14', 'YYYY-MM-DD') AS todate1,
    TO_DATE('20230320', 'YYYY-MM-DD')   AS todate2
FROM
    dual;

--ORA-01722: 수치가 부적합합니다
--select '2023-03-21' - '2023-02-01'
--from dual;

SELECT
    TO_DATE('2023-03-21') - TO_DATE('2023-02-01')
FROM
    dual;

-- 널처리 함수
-- NULL + 300 => NULL

-- NVL(데이터, 널일 경우 반환할 데이터)
SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm
FROM
    emp;

-- NVL2(데이터, 널이 아닐경우 반환할 데이터, 널일 경우 반환할 데이터)
SELECT
    empno,
    ename,
    comm,
    nvl2(comm, 'O', 'X'),
    nvl2(comm, sal * 12 + comm, sal * 12) AS annsal
FROM
    emp;

-- decode함수 / case 문

-- decode(검사 대상이 될 데이터, 
--        조건1, 조건1이 일치할 때 실행할 구문
--        조건2, 조건2가 일치할 때 실행할 구문)

-- emp 테이블에 직책이 manager 인 사람은 급여의 10% 인상,
-- saleman 인 사람은 5%, ANALYST 인 사람은 그대로, 나머지는 3% 인상된 급여 출력

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
            '해당사항 없음'
        WHEN comm = 0 THEN
            '수당없음'
        WHEN comm > 0 THEN
            '수당 : ' || comm
        ELSE
            sal * 1.03
    END AS comm_text
FROM
    emp;

-- emp 테이블에서 사원들의 월 평균 근무일수는 21.5일이다.
-- 하루 근무 시간을 8시간으로 보았을 때 사원들의
-- 하루 급여(DAY_PAY)와 시급(TIME_PAY)를 계산하여
-- 결과를 출력한다. 단, 하루 급여는 소수점 셋째 자리에서
-- 버리고, 시급은 두 번째 소수점에서 반올림하시오.
SELECT
    empno,
    ename,
    sal,
    trunc(sal / 21.5, 2)     AS day_pay,
    round(sal / 21.5 / 8, 1) AS time_pay
FROM
    emp;

-- EMP 테이블에서 사원들은 입사일(HIREDATE)을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다. 
-- 사원들이 정직원이 되는 날짜(R_JOB)를 YYYY-MM-DD 형식으로 아래와 같이 출력하시오. 
-- 단, 추가수당(COMM)이 없는 사원의 추가수당은 N/A로 출력하시오.

SELECT
    comm,
    nvl(to _char(comm), 'N/A')  --ORA-01722: 수치가 부적합합니다, to_char로 맞춰준다.
FROM
emp;

SELECT
    empno,
    ename,
    hiredate,
    next_day(add_months(hiredate, 3),
             '월요일') AS r_job,
    nvl(to_char(comm),
        'N/A')      AS comm
FROM
    emp;

-- EMP 테이블의 모든 사원을 대상으로 직속 상관의 사원 번호(MGR)를 다음과 같은 조건을 기준으로 변환해서 CHG_MGR 열에 출력하시오.
-- 직속상관의 사원 번호가 존재하지 않을 경우 : 0000
-- 직속상관의 사원 번호 앞 두자리가 75일 경우 : 5555
-- 직속상관의 사원 번호 앞 두자리가 76일 경우 : 6666
-- 직속상관의 사원 번호 앞 두자리가 77일 경우 : 7777
-- 직속상관의 사원 번호 앞 두자리가 78일 경우 : 8888
-- 그 외 직속 상관 사원 번호의 경우 : 본래 직속 상관의 사원번호 그대로 출력

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

-- 다중행 함수 : sum, count, max, min, avg
--ORA-00937: 단일 그룹의 그룹 함수가 아닙니다
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

-- SUM() : NULL 은 제외하고 합계 구해줌
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

-- 부서번호가 20인 사원의 입사일 중 제일 최근 입사일
SELECT
    max(hiredate)
FROM
    emp
where deptno = 20;

-- 부서번호가 20인 사원의 입사일 중 제일 오래된 입사일
SELECT
    min(hiredate)
FROM
    emp
where deptno = 20;

select avg(sal)
from emp
where deptno = 30;

-- group by : 결과 값을 원하는 열로 묶어 출력

-- 부서별 sal 평균 구하기
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

-- 부서별 추가수당 평균 구하기
SELECT
    deptno,
    AVG(comm)
FROM
    emp
GROUP BY
    deptno;

    -- group by 표현식이 아닙니다.
-- SELECT
--    avg(sal),
--    deptno,
--    ename
--FROM
--    emp
-- GROUP BY
--    deptno;

-- group by + having : group by 절에 조건을 줄 때
-- having : 그룹화된 대상을 출력 제한 걸때

-- 각 부서의 직책별 평균 급여 구하기(단, 평균 급여가 2000이상인 그룹만 출력)
-- deptno, job, 평균

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


-- 그룹 함수는 허가되지 않습니다.
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

-- 1) from 구문 실행 2) where 실행 3) group by 4) having 5) select 6) order by
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


-- emp 테이블을 이용하여 부서번호(DEPTNO), 평균급여(AVG_SAL), 최고급여(MAX_SAL), 최저급여(MIN_SAL), 사원수(CNT)를 출력한다. 
-- 단, 평균 급여를 출력할 때 소수점을 제외하고 각 부서번호별로 출력하는 SQL 문을 작성하시오.

SELECT DEPTNO, FLOOR(AVG(SAL)) AS AVG_SAL, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, COUNT(*) AS CNT
FROM EMP
GROUP BY DEPTNO;


-- 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원 수를 출력하는 SQL문을 작성하시오.

SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(JOB) >= 3;

-- 사원들의 입사연도(HIRE_YEAR)를 기준으로 부서별로 몇 명이 입사했는 지 출력하는 SQL문 작성하시오.
SELECT TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR, DEPTNO, COUNT(*) AS CNT
FROM emp
GROUP BY TO_CHAR(HIREDATE,'YYYY'), deptno;

-- 조인 : 여러 테이블을 하나의 테이블처럼 사용
-- 1) 내부조인(inner join)`: 여러 개의 테이블에서 공통된 부분만 추출
-- 1. 등가조인: 두 개의 열이 일치할 때 값 추출
-- 2. 비등가조인 : 범위에 해당할 때 값 추출

-- 2) 외부조인(outer join)
-- 1. left outer join
-- 2. right outer join
-- 3. full outer join

-- dept : 4행 , emp : 120god ==> 4*12 = 48행
-- 크로스 조인(나올 수 있는 모든 조합 추출)
select *
from emp, dept
order by empno;


-- ORA-00918: 열의 정의가 애매합니다, 00918. 00000 -  "column ambiguously defined"
-- 중복된 컬럼이 있을 때 나오는 문구

-- inner join
select e.empno, e.ename, d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno;

-- SQL-99 표준
-- join ~ on
select e.empno, e.ename, d.deptno, d.dname, d.loc
from emp e join dept d on e.deptno = d.deptno;

select e.empno, e.ename, d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and sal >= 3000;

-- SQL-99 표준
-- join ~ on

select e.empno, e.ename, d.deptno, d.dname, d.loc
from emp e join dept d on e.deptno = d.deptno 
where sal >= 3000;


-- emp, dept inner join, 급여가 2500 이하이고, 사원번호가 9999 이하인 사원 정보 조회
select e.empno, e.ename, d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and e.sal <= 2500 and e.empno <=9999;


-- SQL-99 표준
-- join ~ on
select e.empno, e.ename, d.deptno, d.dname, d.loc
from emp e join dept d on e.deptno = d.deptno
where e.sal <= 2500 and e.empno <=9999;


-- emp와 salgrade 조인
-- emp 테이블의 sal 이 salgrade 테이블의 losal 과 hisal 범위에 들어가는 형태로 조인

select *
from emp e, salgrade s
where e.sal between s.losal and s.hisal;

-- SQL-99 표준
-- join ~ on
select *
from emp e join salgrade s on e.sal between s.losal and s.hisal;


-- self join : 자기 자신 테이블과 조인
select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1, emp e2
where e1.mgr = e2.empno;

-- outer join

-- 1) left outer join
select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1, emp e2
where e1.mgr = e2.empno(+);

-- SQL-99 표준
-- join ~ on
select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1 left outer join emp e2 on e1.mgr = e2.empno;


-- 2) right outer join
select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1, emp e2
where e1.mgr(+) = e2.empno;

-- SQL-99 표준
-- join ~ on
select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1 right outer join emp e2 on e1.mgr = e2.empno;


-- ORA-01468: outer-join된 테이블은 1개만 지정할 수 있습니다
-- 01468. 00000 -  "a predicate may reference only one outer-joined table"
-- select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
-- from emp e1, emp e2
-- where e1.mgr(+) = e2.empno(+);

-- SQL-99 표준
-- join ~ on
select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1 full outer
JOIN emp e2 ON e1.mgr =
e2.empno;


-- 연결해야 할 테이블이 3개일 때

-- select *
-- from table t1, table t2, table t3
-- where t1.empno = t2.empno and t2.deptno = t3.deptno;

-- select *
-- from table t1 join table2 t2 on t1.empno = t2.empno join table3 t3 on t2.deptno = t3.deptno;

-- 급여가 2000초과인 사원들의 부서 정보, 사원 정보를 아래와 같이 출력하는 sql문을 작성하시오.

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

-- 각 부서별 평균 급여, 최대 급여, 최소 급여, 사원수를 출력하는 sql문을 작성하시오.
select d.deptno, d.dname, floor(avg(sal)) as avg_sal, max(sal) as max_sal, min(sal) as min_sal, count(*) as cnt
from emp e, dept d
where e.deptno = d.deptno
group by d.deptno, d.dname;

-- 모든 부서정보와 사원 정보를 아래와 같이 부서번호, 사원이름 순으로 정렬하여 출력하는 sql문을 작성하시오.

select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from dept d, emp e
where d.deptno = e.deptno(+);

select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from dept d left outer
JOIN emp e ON d.deptno =
e.deptno;

-- 서브쿼리
-- sql 문을 실행하는 데 필요한 데이터를 추가로 조회하기 위해 sql 문 내부에서 사용하는 select 문
-- 1) 단일행 서브쿼리 2) 다중행 서브쿼리 3) 다중열 서브쿼리

--select 조회할 열
--from 테이블 명
--where 조건식(select 조회할 열 from 테이블 where 조건식)

-- 존스의 급여보다 높은 급여를 받는 사원 조회
-- jones 급여 알아내기 / 알아낸 jones 급여를 가지고 조건식

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

-- 단일행 서브쿼리 : 서브쿼리 결과로 하나의 행 반환
-- =, >, <, >=, <=, <>, ^=, != 연산자 허용


-- 존스의 급여보다 높은 급여를 받는 사원 조회(서브쿼리)
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

-- 사원이름이 ALLEN 인 사원의 추가수당 보다 많은 추가수당을 받는 사원 조회
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

-- 사원이름이 WARD 인 사원의 입사일보다 빨리 입사한 사원 조회
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

-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원정보 및
-- 부서정보 조회
-- 사원번호, 사원명, 직무, 급여, 부서번호, 부서명, 지역

select e.empno, e.ename, e.job, e.sal, d.deptno, d.dname, d.loc
from emp e join dept d on e.deptno = d.deptno
where e.deptno = 20 and e.sal > (select avg(sal) from emp);

-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 작거나 같은 급여를 받는 사원정보 및
-- 부서정보 조회

select e.empno, e.ename, e.job, e.sal, d.deptno, d.dname, d.loc
from emp e join dept d on e.deptno = d.deptno
where e.deptno = 20 and e.sal <= (select avg(sal) from emp);


-- 다중행 서브쿼리 : 서브쿼리 결과로 여러 개의 행 반환
-- IN, ANY(SOME), ALL, EXISTS 연산자 허용(단일행 서브쿼리에 쓰는 연산자 사용 불가)

-- 각 부서별 최고 급여와 동일한 급여를 받는 사원정보 조회

-- 각 부서별 최고 급여
select max(sal) from emp group by deptno;

-- 단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.
-- select * from emp where sal = (select max(sal) from emp group by deptno);

-- IN : 메인쿼리 결과가 서브쿼리 결과 중 하나라도 일치하면 TRUE
select * from emp where sal IN (select max(sal) from emp group by deptno);

-- 30번 부서 사원들의 급여보다 적은 급여를 받는 사원 정보 조회

-- any(some) : 메인쿼리 결과가 서브쿼리 결과가 하나이상이면 TRUE
select * from emp where sal < any (select sal from emp WHERE deptno = 30);
select * from emp where sal < some (select sal from emp WHERE deptno = 30);

-- 위 결과는 단일행 쿼리로 작성이 가능한 상황임
select * from emp where sal < (select max(sal) from emp WHERE deptno = 30);

-- 30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 정보 조회

-- 1. 단일행 서브쿼리
select * from emp where sal > (select min(sal) from emp WHERE deptno = 30);
-- 2. 다중행 서브쿼리
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

-- ALL : 서브쿼리 모든 결과가 조건식에 맞아 떨어져야만 메인쿼리 조건식이 TRUE
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

-- EXISTS : 서브 쿼리에 결과 값이 하나 이상 존재하면 조건식이 모두 TRUE, 존재하지 않으면 false
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

-- 전체 사원 중 ALLEN과 같은 직책인 사원들의 사원정보, 부서 정보를 다음과 같이 출력하는 sql문을 작성하시오.
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

-- 전체 사원의 평균 급여보다 높은 급여를 받는 사원들의 사원정보, 부서정보, 급여 등급 정보를 출력하는 sql문을 작성하시오
-- (단 출력할 때 급여가 많은 순으로 정렬하되 급여가 같은 경우에는 사원 번호를 기준으로 오름차순으로 정렬하기)

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

-- 다중열 서브쿼리 : 서브쿼리의 select 절에 비교할 데이터를 여러 개 지정

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

-- FROM 절에 사용하는 서브쿼리(인라인 뷰)
-- from 절에 직접 테이블을 명시해서 사용하기에는 테이블 내 데이터 규모가 클 때, 불필요한 열이 많을 때
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

-- select 절에 사용하는 서브쿼리(스칼라 서브쿼리)
-- select 절에 사용하는 서브쿼리는 반드시 하난의 결과만 반환해야 함
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

-- 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 사원들의 사원정보, 부서 정보를 다음과 같이 출력하는 sql문을 작성하시오.
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
    
-- 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 사원정보, 급여등급 정보를 출력하는 SQL문을 작성하시오
-- (단, 서브쿼리를 활용할 때 다중행 함수를 사용하는 방법과 사용하지 않는 방법을 통해 사원번호를 기준으로 오름차순 정렬하여 출력하시오.)

-- 단일행 서브쿼리
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
    


-- 다중행 함수 사용 시(IN, ANY, SOME, ALL, EXISTS)
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

-- DML(data manipulation language) : 데이터 추가(INSERT), 수정(UPDATE), 삭제(DELETE)하는 데이터 조작어
-- COMMIT : DML 작업을 데이터베이스에 최종 반영
-- ROLLBACK : DML 작업을 취소
-- select + DML ==> 자주 사용하는 sql 임

-- 연습용 테이블 생성
-- 기본 테이블 복사
CREATE TABLE dept_temp
    AS
        SELECT
            *
        FROM
            dept;

DROP TABLE dept_temp;

-- 열이름은 선택사항임
-- insert into 테이블이름(열이름1, 열이름2......)
-- values(데이터1, 데이터2....);


-- dept_temp 새로운 부서 추가하기
INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    50,
    'DATABASE',
    'SEOUL'
);

-- 열 이름 제거할 때
INSERT INTO dept_temp VALUES (
    60,
    'NETWORK',
    'BUSAN'
);

-- INSERT 시 오류

-- ORA-01438: 이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다.
-- INSERT INTO DEPT_TEMP
-- VALUES(600,'NETWORK','BUSAN');

-- ORA-01722: 수치가 부적합합니다
-- INSERT INTO DEPT_TEMP
-- VALUES('NO', 'NETWORK','BUSAN');

-- ORA-00947: 값의 수가 충분하지 않습니다
-- insert into dept_temp(deptno, dname, loc)
-- values(70,'DATABASE');

-- NULL 삽입
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

-- NULL 삽입할 컬럼명 지정하지 않았음
-- 삽입시 전체 컬럼을 삽입하지 않는다면 필드명 필수
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


-- emp_temp 생성(emp 테이블 복사 - 테이터는 복사를 하지 않을 때)
-- 구조만 복사
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
    '홍길동',
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
    '성춘향',
    'MANAGER',
    9999,
    '2002-01-05',
    4000,
    NULL,
    20
);

-- 날짜 입력 시 년/월/일 순서 => 일/월/년 삽입
-- 날짜 형식의 지정에 불필요한 데이터가 포함
-- insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
-- values(2222,'이순신','MANAGER',9999,'07/01/2001',4000,NULL,20);

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
    '이순신',
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
    '심봉사',
    'MANAGER',
    9999,
    sysdate,
    4000,
    NULL,
    30
);

-- 서브쿼리로 INSERT 구현
-- emp, salgrade 테이블을 조인 후 급여 등급이 1인 사원만 emp_tmep 에 추가
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
    
    
    
-- UPDATE : 테이블에 있는 데이터 수정

-- UPDATE 테이블명
-- SET 변경할 열이름 = 데이터, 변경할 열이름 = 데이터 ....
-- WHERE 변경을 위한 대상 행을 선별하기 위한 조건

SELECT * FROM dept_temp;

-- dept_temp 부서번호가 40번인 loc 열의 값을 seoul 로 변경
update dept_temp
set loc = 'SEOUL';
WHERE DEPTNO = '40';
ROLLBACK;

-- 데이터 일부분 수정: WHERE 사용
-- DEPT_TEMP 부서번호가 40번인 LOC 열의 값을 SEOUL 로 변경
UPDATE dept_temp
SET
    loc = 'SEOUL'
WHERE
    deptno = '40';

-- DEPT_TEMP 부서번호가 80번인 DNAME 은 SALES, LOC 는 CHICAGO
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

-- emp_temp 사원들 중에서 급여가 2500이하인 사원만 추가수당을 50으로 수정
UPDATE emp_temp
SET
    comm = 50
WHERE
    sal <= 2500;

-- 서브쿼리를 사용하여 데이터 수정
-- dept 테이블의 40번 부서의 dname, loc를 dept_temp 40번 부서의 dname, loc로 업데이트

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

-- delete : 테이블에 있는 데이터 삭제
-- delete 테이블명 
-- from (선택)
-- where 삭제 데이터를 선별하기 위한 조건식

create table emp_temp2 as select * from emp;

-- job이 manager 인 사원 삭제

delete from emp_temp2
where job = 'MANAGER';

-- job이 SALESMAN 인 사원 삭제

delete from emp_temp2
where job = 'SALESMAN';

-- 전체 데이터 삭제
DELETE EMP_TEMP2;

ROLLBACK;

-- 서브쿼리를 사용하여 삭제
-- 급여 등급이 3등급이고, 30번부서의 사원 삭제

SELECT e.empno
from emp_temp2 e, salgrade s
where e.sal between s.losal and s.hisal and e.deptno = 30;

delete from emp_temp2
from empno in (select e.empno from emp_temp2 e, salgrade s where e.sal between s.losal and s.hisal and s.grade=3 and e.deptno = 30);

select *from emp_temp2;

-- 실습을 위하여 기존 테이블을 이용하여 테이블을 생성한다.
-- emp 테이블의 내용을 이용하여 exam_emp 생성
CREATE TABLE EXAM_EMP
    AS
        SELECT
            *
        FROM
            EMP;

-- DEPT 테이블의 내용을 이용하여 exam_DEPT 생성
CREATE TABLE EXAM_DEPT
    AS
        SELECT
            *
        FROM
            DEPT;

 -- SALGRADE 테이블의 내용을 이용하여 exam_SALGRADE 생성
CREATE TABLE EXAM_SALGRADE
    AS
        SELECT
            *
        FROM
            SALGRADE; 

-- 다음의 정보를 EXAM_EMP 테이블에 입력하시오.
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

-- EXAM_EMP에 속한 사원 중 50번 부서에서 근무하는 사원들의 평균 급여보다 많은 급여를 받고 있는 사원들을 70번 부서로 옮기는 SQL 문 작성하기
update exam_emp
set deptno = 70
where sal> (select avg(sal) from exam_emp where deptno=50);

-- EXAM_EMP에 속한 사원 중 60번 부서의 사원 중에서 입사일이 가장 빠른 사원보다 늦게 입사한 사원의 급여를 10% 인상하고 80번 부서로 옮기는 SQL문 작성하기
update exam_emp set sal = sal*1.1, deptno=80 where
hiredate > (select min(hiredate) from exam_emp where deptno=60);

-- EXAM_EMP에 속한 사원 중, 급여 등급이 5인 사원을 삭제하는 SQL문을 작성하기
DELETE FROM exam_emp
WHERE
    empno IN (
        SELECT
            empno
        FROM
            exam_emp, salgrade
        WHERE
            sal BETWEEN losal AND hisal
            AND grade = 5
    );


-- 트랜잭션(transaction) : 최소 수행 단위
-- 트랜잭션 제어하는 구문 TCL(Transaction Control Language) : commit, rollback

CREATE TABLE dept_tcl
    AS
        SELECT
            *
        FROM
            dept;

INSERT INTO dept_tcl VALUES (
    50,
    'DATABASE',
    'SEOUL'
);

UPDATE dept_tcl
SET
    loc = 'BUSAN'
WHERE
    deptno = 40;

DELETE FROM dept_tcl
WHERE
    dname = 'RESEARCH';

SELECT
    *
FROM
    dept_tcl;

-- 트랜잭션 취소
ROLLBACK;

-- 트랜잭션 최종 반영
COMMIT;

-- 세션 : 어떤 활동을 위한 시간이나 기간
-- 데이터베이스 세션 : 데이터베이스 접속을 시작으로 관련작업 수행한 후 접속 종료
-- LOCK : 잠금(수정 중인 데이터 접근 막기)

DELETE FROM dept_tcl
WHERE
    deptno = 50;

UPDATE dept_tcl
SET
    loc = 'SEOUL'
WHERE
    deptno = 30;

SELECT
    *
FROM
    dept_temp;
    
-- DDL : 데이터 정의어( 데이터 베이스 객체 생성, 수정, 삭제)
-- 1. 테이블 생성
--CREATE TABLE 테이블명 (
--    열이름1 자료형,
--    열이름2 자료형,
--    열이름3 자료형,
--   열이름4 자료형
--    );
-- 테이블 생성 규칙
-- 1) 테이블 이름은 문자로 시작
-- 2) 테이블 이름은 30BYTE 이하
-- 3) 같은 사용자 소유의 테이블 이름은 중복될 수 없음
-- 4) 테이블 명에 사용할 수 있는 특수문자는 $,#,_ 가능
-- 5) SQL 키워드(EX SELECT, FROM, WHERE....)는 테이블명에 사용할 수 없음

-- 자료형

-- 1. 문자
-- VARCHAR2(길이) : 가변 길이 문자열 데이터 저장(최대 4000BYTE), 내가 입력한 데이터 길이에 맞춰서 데이터 크기르 사용한다
-- CHAR(길이) : 고정 길이 문자열 데이터 저장, 내가 입력한 데이터 길이에 상관없이 설정한 데이터 크기만큼 데이터를 사용한다.
-- NVARCHAR2(길이) : 가변 길이(unicode) 데이터 저장
--      name varchar2(10) : 영어는 10자, 한글은 3자리까지 밖에 안됨(한글은 한 문자에 3byte 들어가기때문에) 
--      name nvarchar2(10) : 영어 10자, 한글 10자 까지 입력
-- NCHAR(길이) : 고정 길이(unicode)
--  name char2(10) : 영어는 10자, 한글은 3자리, + 메모리 10byte 고정
--  name nchar2(10) : 영어는 10자, 한글은 10자리, + 메모리 10byte 고정

-- 2. 숫자
-- NUMBER(전체자릿수, 소수점이하자릿수)

-- 3. 날짜
-- DATE : 날짜, 시간 저장
-- TIMESTAMP

-- 4. 기타
-- BLOB : 대용량 이진 데이터 저장
-- CLOB : 대용량 텍스트 데이터 저장
-- JSON : JSON 데이터 저장

CREATE TABLE emp_ddl(
    empno number(4),    -- 4번을 총 4자리 지정
    ename varchar2(10), -- 사원명을 총 10byte 로 지정
    job varchar2(9),    -- 직무 총 9byte 지정
    mgr number(4),      -- 매니저 번호
    hiredate date,      -- 날짜/시간 저장
    sal number(7,2),    -- 급여를 전체 자릿수 7자리 지정(소수점 2자리까지 허용)
    comm number(7,2),   -- 추가수당
    deptno number(2)    -- 부서번호
);
desc emp_ddl;

-- 2. 테이블 수정 : ALTER
-- 1) 열 추가 : ADD
ALTER TABLE emp_temp2 ADD hp VARCHAR2(20);

-- 2) 열 이름 변경 : RENAME
ALTER TABLE emp_temp2 RENAME COLUMN hp TO tel;

-- 3) 열 자료형(길이) 변경 : MODIFY
ALTER TABLE emp_temp2 MODIFY
    empno NUMBER(5);

-- 4) 특정 열을 삭제 : DROP
ALTER TABLE emp_temp2 DROP COLUMN tel;



-- 3. 테이블 삭제 : DROP
DROP TABLE emp_rename;

-- 테이블 명 변경
RENAME emp_temp2 TO emp_rename;

-- 테이블 데이터 전체 삭제
DELETE FROM emp_rename;

SELECT
    *
FROM
    emp_rename;

ROLLBACK;

-- rollback 안됨 : DDL 구문이기 때문
TRUNCATE TABLE emp_rename;

-- member 테이블 만들기
CREATE TABLE member (
    id     CHAR(8),
    name   VARCHAR2(10),
    addr   VARCHAR2(50),
    nation NCHAR(4),
    email  VARCHAR2(50),
    age    NUMBER(7, 2)
);

-- member 테이블에 bigo 열 추가하기
ALTER TABLE member ADD bigo VARCHAR2(20);

-- 조건: 가변형 문자열, 길이는 20, bigo 열 크기를 30을 변경, bigo 열 이름을 remark로 변경
ALTER TABLE member MODIFY
    bigo VARCHAR2(30);

ALTER TABLE member RENAME COLUMN bigo TO remark;

DROP TABLE member;

-- ORA-12899: "SCOTT"."MEMBER"."NATION" 열에 대한 값이 너무 큼(실제: 12, 최대값: 4)
-- 데이터 값이 맞지 않은 member 테이블 삭제 후 다시 작성, 열값 수정 후 다시 입력, 정상 작동
INSERT INTO member VALUES (
    'hong1234',
    '홍길동',
    '서울시 구로구 개봉동',
    '대한민국',
    'hong123@naver.com',
    25,
    NULL
);


-- 데이터 베이스 객체
-- 테이블, 인덱스, 뷰, 데이터 사전, 시퀀스, 시노님, 프로시저, 함수, 패키지, 트리거
-- 생성 : create, 수정: alter, 삭제 : drop

-- 인덱스 : 더 빠른 검색을 도와줌
-- 인덱스 : 사용자가 직접 특정 테이블 열에 지정 가능
--         기본키(혹은 unique key) 를 생성하면 인덱스로 지정

-- CREATE INDEX 인덱스이름 ON 테이블명(인덱스로 사용할 열이름)

-- emp 테이블의 sal 열을 인덱스로 지정
CREATE INDEX idx_emp_sal ON
    emp (
        sal
    );

-- select : 검색방식
-- FULL Scan
-- Index Scan

SELECT
    *
FROM
    emp
WHERE
    empno = 7900;

-- 인덱스 삭제
DROP INDEX idx_emp_sal;

-- View : 가상 테이블
-- 편리성 : select 문의 복잡도를 완화하기 위해
-- 보안성 : 테이블의 특정 열을 노출하고 싶지 않을 때

-- CREATE[OR REPLACE] [FORCE | NOFORCE] VIEW 뷰이름(열이름1,열이름2.....)
-- AS (저장할 SELECT 구문)
-- [WITH CHECK OPTION]
-- [WITH READ ONLY]

-- FROM (SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO=20);
CREATE VIEW vm_emp20 AS
    (
        SELECT
            empno,
            ename,
            job,
            deptno
        FROM
            emp
        WHERE
            deptno = 20
    );

-- 서브쿼리를 사용
SELECT
    *
FROM
    (
        SELECT
            empno,
            ename,
            job,
            deptno
        FROM
            emp
        WHERE
            deptno = 20
    );

-- 뷰 사용
SELECT
    *
FROM
    vm_emp20;

-- 뷰 삭제
DROP VIEW vm_emp20;

-- 뷰 생성 시 읽기만 가능
CREATE VIEW vm_emp_read AS
    SELECT
        empno,
        ename,
        job
    FROM
        emp
WITH READ ONLY;

-- VIEW 에 INSERT 작업?
INSERT INTO vm_emp20 VALUES (
    8888,
    'KIM',
    'SALES',
    20
);
-- 원본 변경이 일어남
SELECT
    *
FROM
    emp;

-- ORA-42399: 읽기 전용 뷰에서는 DML 작업을 수행할 수 없습니다.
-- WITH READ ONLY 를 사용하면 읽기 전용이라 INSERT 불가
INSERT INTO vm_emp_read VALUES (
    9999,
    'KIM',
    'SALES'
);

-- 인라인 뷰 : 일회성으로 만들어서 사용하는 뷰
-- rownum : 조회된 순서대로 일련번호 매김

SELECT
    ROWNUM,
    e.*
FROM
    (
        SELECT
            *
        FROM
            emp e
        ORDER BY
            sal DESC
    ) e;

-- 급여 높은 상위 세 사람 조회
SELECT
    ROWNUM,
    e.*
FROM
    (
        SELECT
            *
        FROM
            emp e
        ORDER BY
            sal DESC
    ) e
WHERE
    ROWNUM <= 3;

-- 시퀀스 : 규칙에 따라 순번 생성
-- CREATE SEQUENCE 시퀀스 이름; (설정안하는 것들은 다 기본값으로 세팅)

--CREATE SEQUENCE 시퀸스명
--[increment by 숫자]   기본값 1
--[start with 숫자]     기본값 1
--[m-axvalue 숫자 | NOMAXVALUE ]
--[MINVALUE 숫자 | NOMINVALUE ]
--[CYCLE | NOCYCLE ]  CYCLE 인 경우 MAXVALUE에 값이 다다르면 시작값부터 다시 시작
--[CACHE 숫자 | NOCACHE ]   시퀀스가 생성할 번호를 미리 메모리에 할당해 놓음(기본 CACHE 20)

CREATE TABLE dept_sequence
    AS
        SELECT
            *
        FROM
            dept
        WHERE
            1 <> 1;

CREATE SEQUENCE seq_dept_sequence INCREMENT BY 10 START WITH 10 MAXVALUE 90 MINVALUE 0 NOCYCLE CACHE 2;

-- 시퀀스 사용 : 시퀀스이름.CURRVAL(마지막으로 생성된 시퀀스 조회), 시퀀스이름.NEXTVAL(시퀀스 생성)

-- 부서번호 입력 시 시퀀스 사용
INSERT INTO dept_sequence (
    deptno,
    dname,
    loc
) VALUES (
    seq_dept_sequence.NEXTVAL,
    'DATABASE',
    'SEOUL'
);

SELECT
    *
FROM
    dept_sequence;

-- 최대값 90 까지 가능
-- 시퀀스 SEQ_DEPT_SEQUENCE.NEXTVAL exceeds MAXVALUE : NOCYCLE 옵션으로 생성했기 때문에 번호가 순환되지 않음

-- 시퀸스 삭제
DROP SEQUENCE seq_dept_sequence;

CREATE SEQUENCE seq_dept_sequence INCREMENT BY 3 START WITH 10 MAXVALUE 99 MINVALUE 0 CYCLE CACHE 2;
-- 1씩 증가하고 싶으면 조건 없이 사용하면 됨 --> CREATE SEQUENCE seq_dept_sequence 

SELECT
    seq_dept_sequence.CURRVAL
FROM
    dual;

-- SYNONYM(동의어) : 테이블, 뷰, 시퀀스 등 객체 이름 대신 사용할 수 있는 다른 이름을 부여하는 객체

-- EMP 테이블의 별칭을 E 로 지정
CREATE SYNONYM e FOR emp;

-- PUBLIC : 동의어를 데이터베이스 내 모든 사용자가 사용할 수 있도록 설정
-- CREATE [PUBLIC] SYNONYM FOR EMP;

SELECT
    *
FROM
    emp;

SELECT
    *
FROM
    e;

DROP SYNONYM e;

-- EMP 테이블과 같은 구조의 데이터를 저장하는 EMPIDX 테이블을 생성하시오.
-- 생성한 EMPIDX 테이블의 EMPNO 열에 IDX_EMPIDX_EMPNO 인덱스를 생성하시오.

CREATE TABLE empidx
    AS
        SELECT
            *
        FROM
            emp
        WHERE
            1 <> 1;

CREATE INDEX idx_empidx_empno ON
    empidx (
        empno
    );
-- 데이터 사전 뷰를 통해 인덱스 확인
SELECT
    *
FROM
    user_indexes;

-- 실습 1에서 생성한 EMPIDX 테이블의 데이터 중 급여가 1500 초과인 사원들만 출력하는 EMPIDX_OVER15K 뷰를 생성하시오.
--(사원번호, 사원이름, 직책, 부서번호, 급여, 추가수당 열을 가지고 있다)
CREATE VIEW empidx_over15k AS
    (
        SELECT
            empno,
            ename,
            job,
            deptno,
            sal,
            comm
        FROM
            empidx
        WHERE
            sal > 1500
    );

-- DEPT 테이블과 같은 열과 행 구성을 가지는 DEPTSEQ 테이블을 작성하시오.
-- 생성한 DEPTSEQ 테이블의 DEPTNO 열에 사용할 시퀸스를 아래에 제시된 특성에 맞춰 생성해 보시오.
CREATE TABLE deptseq
    AS
        SELECT
            *
        FROM
            dept
        WHERE
            1 <> 1;

CREATE SEQUENCE seq_dept START WITH 1 INCREMENT BY 1 MAXVALUE 99 MINVALUE 1 NOCYCLE NOCACHE;

-- 데이터 사전 뷰를 통해 시퀀스 확인
SELECT
    *
FROM
    user_sequences;

-- 제약조건 : 테이블의 특정 열에 지정
--           NULL 허용 / 불허용, 유일한 값, 조건식을 만족하는 데이터만 입력 가능...
--           데이터 무결성(데이터 정확성, 일관성 보장) 유지  ==> DML 작업 시 지켜야 함
--           영역 무결성, 개체 무결성, 참조 무결성
--           테이블 생성 시 제약조건 지정, OR 생성 후에 ALTER 를 통해 추가, 변경 가능

-- 1) NOT NULL : 빈값 허용 불가
-- 사용자로부터 입력값이 필수로 입력되야 할 때
CREATE TABLE table_notnull (
    login_id  VARCHAR2(20) NOT NULL,
    login_pwd VARCHAR2(20) NOT NULL,
    tel       VARCHAR2(20)
);


-- ORA-01400: NULL을 ("SCOTT"."TABLE_NOTNULL"."LOGIN_PWD") 안에 삽입할 수 없습니다 , 생성할 때 not_null로 생성함
INSERT INTO table_notnull (
    login_id,
    login_pwd,
    tel
) VALUES (
    'hong123',
    null,
    '010-1234-1234'
);

SELECT
    *
FROM
    table_notnull;

-- 제약조건 조회
select * from user_constraints;

-- 제약조건 + 제약조건 명 지정
CREATE TABLE table_notnull2 (
    login_id  VARCHAR2(20) constraint TBLNN2_login_NN NOT NULL,
    login_pwd VARCHAR2(20) constraint TBLNN2_LGPWD_NN NOT NULL,
    tel       VARCHAR2(20) 
);

-- 생성한 테이블에 제약조건 추가
-- ORA-02296: (SCOTT.) 사용으로 설정 불가 - 널 값이 발견되었습니다.
-- 이미 삽입된 데이터도 체크 대상이 되기 됨
ALTER TABLE TABLE_NOTNULL MODIFY(TEL NOT NULL);
ALTER TABLE TABLE_NOTNULL2 MODIFY(TEL constraint TBLNN2_TEL_NN NOT NULL);

UPDATE TALBE_NOTNULL
SET TEL = '010-1234-5678'
WHERE LOGIN_ID = 'hong123';

-- 제약조건 명 변경
ALTER TABLE TABLE_NOTNULL2 RENAME CONSTRAINT TBLNN2_TEL_NN TO TBLNN3_TEL_NN;

-- 제약조건 명 삭제
ALTER TABLE TABLE_NOTNULL2 DROP CONSTRAINT TBLNN3_TEL_NN;


-- 2)  UNIQUE : 중복되지 않는 값(null 삽입 가능)
--              아이디, 전화번호

CREATE TABLE table_UNIQUE (
    login_id  VARCHAR2(20) UNIQUE,
    login_pwd VARCHAR2(20) NOT NULL,
    tel       VARCHAR2(20)
);

INSERT INTO table_unique (
    login_id,
    login_pwd,
    tel
) VALUES (
    'hong123',
    'hong123',
    '010-1234-1234'
);

-- login_id 가 중복된 상황일 때 : unique 위배
-- ORA-00001: 무결성 제약 조건(SCOTT.SYS_C008361)에 위배됩니다

INSERT INTO table_unique (
    login_id,
    login_pwd,
    tel
) VALUES (
    null,
    'hong123',
    '010-1234-1234'
);

select * from table_unique;

-- 테이블 생성 제약조건 지정, 변경, 삭제 not null 형태와 동일함

-- 3) PRIMARY KEY(PK) :  UNIQUE + NOT NULL , 다른 행들을 구별하기 위한 구문
CREATE TABLE TABLE_PRIMARY (
 login_id varchar2(20) primary key,
 login_pwd varchar2(20) not null,
 tel    varchar2(20)
 );
 
 -- primary key ==> index 자동 생성 됨
 
 -- ORA-01400: NULL을 ("SCOTT"."TABLE_PRIMARY"."LOGIN_ID") 안에 삽입할 수 없습니다
 INSERT INTO table_primary (
    login_id,
    login_pwd,
    tel
) VALUES (
    null,
    'hong123',
    '010-1234-1234'
);

-- ORA-00001: 무결성 제약 조건(SCOTT.SYS_C008363)에 위배됩니다
INSERT INTO table_primary (
    login_id,
    login_pwd,
    tel
) VALUES (
    'hong123',
    'hong123',
    '010-1234-1234'
);

-- 4) 외래키 : Foreign key(FK) : 다른 테이블 간 관계를 정의하는 데 사용
--                              특정 테이블에서 primary key 제약조건을 지정한 열을 다른 테이블의 특정 열에서 참조

-- 사원 추가 시 부서 번호 입력을 해야 함 => dept 테이블의 deptno 만 삽입

-- 부모 테이블
CREATE TABLE DEPT_FK(
    DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
);

-- 자식 테이블
-- REFERENCES 참조할 테이블명 (참조할 열) : 외래키 지정
CREATE TABLE EMP_FK(
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO));

-- 무결성 제약조건(SCOTT.EMPFK_DEPTNO_FK)이 위배되었습니다 - 부모 키가 없습니다
INSERT INTO EMP_FK VALUES(1000,'TEST', 'SALES', 10);

-- 외래키 제약 조건
-- 부모 테이블 데이터가 데이터 먼저 입력

INSERT INTO DEPT_FK VALUES(10,'DATABASE', 'SEOUL');

-- 삭제 시
-- 자식 테이블 데이터 먼저 삭제
-- 부모 테이블 데이터 삭제

-- 무결성 제약조건(SCOTT.EMPFK_DEPTNO_FK)이 위배되었습니다- 자식 레코드가 발견되었습니다
-- DELETE FROM DEPT_FK WHERE DEPTNO=10;


-- 외래 키 제약조건 옵션
-- ON DELETE CASCADE : 부모가 삭제되면 부모를 참조하는 자식 레코드도 같이 삭제, EX) 블로그 글 작성후 삭제 할 때 글에 작성된 댓글도 같이 삭제
-- ON DELETE SET NULL :  부모가 삭제되면 부모를 참조하는 자식 레코드의 값을 NULL로 변경

CREATE TABLE DEPT_FK2(
    DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK2 PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
);

CREATE TABLE EMP_FK2(
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK2 PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK2 REFERENCES DEPT_FK2(DEPTNO) ON DELETE CASCADE);

INSERT INTO EMP_FK2 VALUES(1000,'TEST', 'SALES', 10);
INSERT INTO DEPT_FK2 VALUES(10,'DATABASE', 'SEOUL');

DELETE FROM DEPT_FK2 WHERE DEPTNO=10;

-- 5) CHECK : 열에 지정할 수 있는 값의 범위 또는 패턴 지정
-- 비밀번호는 3 자리보다 커야 한다

CREATE TABLE table_check(
    login_id varchar2(20) primary key,
    login_pwd varchar2(20) check (length(login_pwd) > 3),
    tel varchar2(20)
    );

-- 체크 제약조건(SCOTT.SYS_C008373)이 위배
INSERT INTO TABLE_CHECK VALUES('TEST','123','010-1234-5678');

INSERT INTO TABLE_CHECK VALUES('TEST','1234','010-1234-5678');

-- 6) DEFAULT : 기본값 지정
CREATE TABLE table_default(
    login_id varchar2(20) primary key,
    login_pwd varchar2(20) default '1234',
    tel varchar2(20)
);

insert into table_default values('test',null,'010-1234-5678');
insert into table_default(login_id, tel) values('TEST1','010-1234-5678');

select * from TABLE_DEFAULT;


