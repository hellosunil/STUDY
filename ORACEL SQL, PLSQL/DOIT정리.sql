# 대소문자 구분 안 하지만, 다른 프로그래밍 언어와의 구분을 위해 보통 대문자 사용
DESC EMP;
DESC DEPT;
DESC SALGRADE;

# SELECTION은 행 단위로 선택 FROM은 조회할 테이블 명을 사용
# PROJECTION은 열 단위로 선택
# SELECTION과 PROJECTION 동시에 사용하여 행/열 단위로 선택
# JOIN은 테이블 간 결합

# EMP 테이블 전체 열 조회하기

SELECT * FROM EMP;

SELECT EMPNO, ENAME, DEPTNO
    FROM EMP;
# SELECT문은 결과 순서를 보장하지 않음 ==> ORDER BY 사용하여 순서 설정

SELECT EMPNO, DEPTNO
    FROM EMP;
    
# DISTINCT는 중복값을 제거하는 데 사용
SELECT DEPTNO
    FROM EMP;

# 열이 한 개 일 때 중복값 제거
SELECT DISTINCT DEPTNO
    FROM EMP;
    
# 열이 여러 개일때 중복값 제거
SELECT DISTINCT JOB, DEPTNO
    FROM EMP;
==> (JOB, DEPTNO) 결합이 중복인지 판단

# 모두 뽑기
SELECT ALL JOB, DEPTNO
    FROM EMP;
    
# 별칭 사용하기(열의 이름을 임시로 설정) SAL=월급, COMM=추가 수당
SELECT ENAME, SAL, SAL*12+COMM, COMM
    FROM EMP;
# 이때, COMM = NULL이면 아예 출력되지 않음

# 별칭을 지정하는 방법
# 1. SAL*12+COMM ANNSAL
# 2. SAL*12+COMM "ANNSAL"
# 3. SAL*12+COMM AS ANNSAL
# 4. SAL*12+COMM AS "ANNSAL"
# 다른 프로그래밍 언어와의 호환을 위해 3번으로 보통 사용

SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
    FROM EMP;

# 테이블 정렬하기 ORDER BY ==> SELECT절의 가장 마지막 행에 씀
SELECT [열], [열2], ..., [열N]
    FROM [테이블]
    ...[그 밖의 절]
    ORDER BY [정렬하려는 열(여러개 가능)][정렬옵션];
                        # ASC(오름차순), DESC(내림차순)

# 오름차순(ASC) 사용하기(오름차순이 기본)
SELECT *
    FROM EMP
    ORDER BY SAL;

# 사원번호 기준으로 내림차순 정렬하기    
SELECT *
    FROM EMP
    ORDER BY EMPNO DESC;
    
# 각각의 열에 내림차순과 올림차순 동시에 사용하기
# 1순위 정렬 후, 2순위 정렬 방식
SELECT *
    FROM EMP
    ORDER BY DEPTNO ASC, SAL DESC;
    
# ORDER BY는 시간복잡도가 크므로 왠만하면 사용하지 않는 것을 권장

# Q2 92P
SELECT DISTINCT JOB
    FROM EMP;
    
# Q3 92P
SELECT EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME,
    DEPTNO AS DEPARTMENT_NO
    FROM EMP
    ORDER BY DEPTNO DESC, ENAME ASC;
    
# 필요 데이터만 출력하는 WHERE

SELECT *
    FROM EMP
    WHERE DEPTNO = 30;
    
SELECT *
    FROM EMP
    WHERE EMPNO = 7782;
    
# WHERE 이후 조건식을 넣어주면 됨

SELECT *
    FROM EMP
    WHERE DEPTNO = 30 
    AND JOB ='SALESMAN';
    # WHERE 절에서는 비교 데이터가 문자열일 경우 '' 써줘야 함

SELECT *
    FROM EMP
    WHERE DEPTNO = 30 
    OR JOB = 'CLERK';
    
# 곱샘 연산자를 사용한 WHERE문
SELECT *
    FROM EMP
    WHERE SAL * 12 >= 36000;
    
SELECT *
    FROM EMP
    WHERE SAL >= 2500
    AND JOB = 'ANALYST';
    
# 문자열을 비교 연산자로 비교하기

SELECT *
    FROM EMP
    WHERE ENAME >= 'F';
    # 이름 첫 문자가 F거나 뒤쪽인 것만 출력

SELECT *
    FROM EMP
    WHERE ENAME <= 'FORZ';
    
# 등가 비교 연산자 =, !=

SELECT *
    FROM EMP
    WHERE SAL != 3000;
    
SELECT *
    FROM EMP
    WHERE NOT SAL = 3000;
    # NOT의 경우, 조건문 앞에 온다!

# IN 연산자

SELECT *
    FROM EMP
    WHERE JOB = 'MANAGER'
    OR JOB = 'SALESMAN'
    OR JOB = 'CLERK';

# IN 연산자를 써서 간단하게 표현하기
SELECT *
    FROM EMP
    WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');

SELECT *
    FROM EMP
    WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

SELECT *
    FROM EMP
    WHERE DEPTNO IN (10, 20);
    
# BETWEEN A AND B 연산자

SELECT *
    FROM EMP
    WHERE SAL >= 2000
    AND SAL <= 3000;
    
SELECT *
    FROM EMP
    WHERE SAL BETWEEN 2000 AND 3000;
    
SELECT *
    FROM EMP
    WHERE SAL NOT BETWEEN 2000 AND 3000;
    
# LIKE 연산자는 일부 문자열이 포함된 데이터를 조회

SELECT *
    FROM EMP
    WHERE ENAME LIKE 'S%';
    
# _ : 어떤 값이든 상관없이 한 개의 문자 데이터를 의미
# % : 길이와 상관없이(문자 없는 경우도 포함) 모든 문자 데이터를 의미

# 사원 이름의 두 번째 글자가 L인 사원만 출력하기

SELECT *
    FROM EMP
    WHERE ENAME LIKE '_L%';
    # L 앞에 단 하나의 문자가 와야함
    
SELECT *
    FROM EMP
    WHERE ENAME LIKE '__L%';
    # L 앞에 단 두개의 문자가 와야함
    # %는 뒤에 어떤 종류의 문자가 몇 개가 오더라도 상관 없음
    
# 사원 이름에 AM이 포함되어 있는 사원 데이터만 출력하기

SELECT *
    FROM EMP
    WHERE ENAME LIKE '%AM%';
    
SELECT *
    from EMP
    WHERE ENAME NOT LIKE '%AM%';
    
# 와일드 카드 문자가 데이터의 일부인 경우 ==> ESCAPE
# A_A 문자열을 가지고 있는 데이터 찾기

SELECT *
    FROM SOME_TABLE
    WHERE SOME_COLUMN LIKE 'A\_A%' ESCAPE '\';
    
# NULL 값을 가진 행 출력하기

SELECT *
    FROM EMP
    WHERE COMM IS NULL;
    
# 직속 상관이 있는 사원 데이터만 출력하기

SELECT *
    FROM EMP
    WHERE MGR IS NOT NULL;

# AND 연산자와 IS NULL 연산자 사용하기

SELECT *
    FROM EMP
    WHERE SAL > NULL
    AND COMM IS NULL;
    
SELECT *
    FROM EMP
    WHERE SAL > NULL
    OR COMM IS NULL;

# 집합연산자(UNION) 사용하여 출력하기

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
    OR DEPTNO = 20;

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
    UNION
    SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 20;
    
## UNION 사용시 주의점! ==> 출력 열의 개수와 자료형이 같아야 함

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION
SELECT SAL, JOB, DEPTNO, SAL
    FROM EMP
    WHERE DEPTNO = 20;
# ==> 결과는 이상하지만 열 개수와 자료형이 같기 때문에 오류 없이 출력!

# 집합 연산자의 종류 및 기능
# UNION : 합집합 // 중복값은 제거됨
# UNION ALL : 합집합 // 중복값도 중복 표시
# MINUS : 차집합
# INTERSECT : 교집합

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION ALL # UNION을 쓴다면 한번씩만, UNION ALL을 쓰면 두번씩 반복해서 결과 출력
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;
    
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;
    
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;
    
    
# Q1 P125

SELECT *
    FROM EMP
    WHERE ENAME LIKE '%S';

# Q2 P125

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 30
    AND JOB = 'SALESMAN';
    
# Q3 P125

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO IN (20, 30)
    AND SAL >2000;
    
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 20
    AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 30
    AND SAL > 2000;
    
# Q4 P126

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
    FROM EMP
    WHERE SAL >= 2000
    OR SAL <= 3000;
    
# Q5 P126

SELECT ENAME, EMPNO, SAL, DEPTNO
    FROM EMP
    WHERE ENAME LIKE '%E%'
    AND DEPTNO = 30
    AND SAL NOT BETWEEN 1000 AND 2000;
    
# Q6 P126

SELECT *
    FROM EMP
    WHERE COMM IS NULL
    AND MGR IS NOT NULL
    AND JOB IN ('MANAGER', 'CLERK')
    AND ENAME NOT LIKE '_L';


# 데이터 처리와 가공을 위한 오라클 함수 사용하기
# 내장 함수의 종류
# 단일행 함수 : 행별로 함수 처리
# 다중행 함수 : 여러 행에 함수가 동시에 처리되어 단일 행 출력

# 문자 데이터를 가공하는 문자 함수

# 대소문자를 바꾸는 UPPER, LOWER, INITCAP
# UPEER(문자열) : 문자열 모두를 대문자로 변환
# LOWER(문자열) : 문자열 모두를 소문자로 변환
# INITCAP(문자열) : 첫글자는 대문자로, 나머지는 소문자로 변환

SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
    FROM EMP;
    
# 활용 : 문자열 데이터는 대소문자를 구분하기 때문에 문자열 데이터를 찾을 때 이용

SELECT *
    FROM EMP
    WHERE UPPER(ENAME) = UPPER('SCOTT');
    
SELECT *
    FROM EMP
    WHERE UPPER(ENAME) LIKE UPPER('%SCOTT%');

# 사원 이름을 모두 대문자로 출력    
SELECT UPPER(ENAME)
    FROM EMP;
    
# 문자열의 길이를 구하는 LENGTH 함수

SELECT ENAME, LENGTH(ENAME)
    FROM EMP;
    
# WHERE 절에서 LENGTH 함수 사용하기

SELECT ENAME, LENGTH(ENAME)
    FROM EMP
    WHERE LENGTH(ENAME) >= 5;

# LENGTH 함수와 LENGTHB 함수

SELECT LENGTH('한글'), LENGTHB('한글')
    FROM DUAL;
    
# 직책이름이 6글자 이상인 데이터만 출력

SELECT *
    FROM EMP
    WHERE LENGTH(JOB) >= 6;
    
# 문자열 일부를 추출하는 SUBSTR 함수

# SUBSTR(문자열 데이터, 시작 위치, 추출 길이)
# SUBSTR(문자열 데이터, 시작 위치) : 시작위치 ~ 끝까지 출력

SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
    FROM EMP;

SELECT SUBSTR(ENAME, 3)
    FROM EMP;
    
# SUBSTR 함수 안에 다른 함수 함께 사용하기
SELECT JOB,
    SUBSTR(JOB, -LENGTH(JOB)),
    SUBSTR(JOB, -LENGTH(JOB), 2),
    SUBSTR(JOB, -3)
    FROM EMP;
    
# 문자열 데이터 안에서 특정 문자의 위치를 찾는 INSTR함수

SELECT INSTR('HELLO, ORACLE', 'L') AS INSTR_1,
    INSTR('HELLO, ORACLE', 'L', 5) AS INSTR_2, #몇 번째 부터
    INSTR('HELLO, ORACLE', 'L', 2, 2) AS INSTR_3 # 몇 번째 L
    FROM DUAL;

# 특정 문자를 포함하고 있는 행 찾기
# INSTR함수로 사원 이름에 문자 S가 있는 행 구하기

SELECT *
    FROM EMP
    WHERE INSTR(ENAME, 'S') > 0;
    
SELECT *
    FROM EMP
    WHERE ENAME LIKE '%S%';
    
# 특정 문자를 다른 문자열로 바꾸는 REPLACE함수

SELECT '010-1234-5678' AS REPLACE_BEFORE,
    REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
    REPLACE('010-1234-5678', '-') AS REPLACE_2
    FROM DUAL;