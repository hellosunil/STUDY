-- ��ҹ��� ���� �� ������, �ٸ� ���α׷��� ������ ������ ���� ���� �빮�� ���
DESC EMP;
DESC DEPT;
DESC SALGRADE;

-- SELECTION�� �� ������ ���� FROM�� ��ȸ�� ���̺� ���� ���
-- PROJECTION�� �� ������ ����
-- SELECTION�� PROJECTION ���ÿ� ����Ͽ� ��/�� ������ ����
-- JOIN�� ���̺� �� ����

-- EMP ���̺� ��ü �� ��ȸ�ϱ�

SELECT * FROM EMP;

SELECT EMPNO, ENAME, DEPTNO
    FROM EMP;

-- SELECT���� ��� ������ �������� ���� ==> ORDER BY ����Ͽ� ���� ����

SELECT EMPNO, DEPTNO
    FROM EMP;
    
-- DISTINCT�� �ߺ����� �����ϴ� �� ���
SELECT DEPTNO
    FROM EMP;

-- ���� �� �� �� �� �ߺ��� ����
SELECT DISTINCT DEPTNO
    FROM EMP;
    
-- ���� ���� ���϶� �ߺ��� ����
SELECT DISTINCT JOB, DEPTNO
    FROM EMP;
-- ==> (JOB, DEPTNO) ������ �ߺ����� �Ǵ�

-- ��� �̱�
SELECT ALL JOB, DEPTNO
    FROM EMP;
    
-- ��Ī ����ϱ�(���� �̸��� �ӽ÷� ����) SAL=����, COMM=�߰� ����
SELECT ENAME, SAL, SAL*12+COMM, COMM
    FROM EMP;
-- �̶�, COMM = NULL�̸� �ƿ� ��µ��� ����

-- ��Ī�� �����ϴ� ���
-- 1. SAL*12+COMM ANNSAL
-- 2. SAL*12+COMM "ANNSAL"
-- 3. SAL*12+COMM AS ANNSAL
-- 4. SAL*12+COMM AS "ANNSAL"
-- �ٸ� ���α׷��� ������ ȣȯ�� ���� 3������ ���� ���

SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
    FROM EMP;

-- ���̺� �����ϱ� ORDER BY ==> SELECT���� ���� ������ �࿡ ��
-- SELECT [��], [��2], ..., [��N]
--    FROM [���̺�]
--    ...[�� ���� ��]
--    ORDER BY [�����Ϸ��� ��(������ ����)][���Ŀɼ�];
--                        # ASC(��������), DESC(��������)

-- ��������(ASC) ����ϱ�(���������� �⺻)
SELECT *
    FROM EMP
    ORDER BY SAL;

-- �����ȣ �������� �������� �����ϱ�    
SELECT *
    FROM EMP
    ORDER BY EMPNO DESC;
    
-- ������ ���� ���������� �ø����� ���ÿ� ����ϱ�
-- 1���� ���� ��, 2���� ���� ���
SELECT *
    FROM EMP
    ORDER BY DEPTNO ASC, SAL DESC;
    
-- ORDER BY�� �ð����⵵�� ũ�Ƿ� �ظ��ϸ� ������� �ʴ� ���� ����

-- Q2 92P
SELECT DISTINCT JOB
    FROM EMP;
    
-- Q3 92P
SELECT EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME,
    DEPTNO AS DEPARTMENT_NO
    FROM EMP
    ORDER BY DEPTNO DESC, ENAME ASC;
    
-- �ʿ� �����͸� ����ϴ� WHERE

SELECT *
    FROM EMP
    WHERE DEPTNO = 30;
    
SELECT *
    FROM EMP
    WHERE EMPNO = 7782;
    
-- WHERE ���� ���ǽ��� �־��ָ� ��

SELECT *
    FROM EMP
    WHERE DEPTNO = 30 
    AND JOB ='SALESMAN';
    -- WHERE �������� �� �����Ͱ� ���ڿ��� ��� '' ����� ��

SELECT *
    FROM EMP
    WHERE DEPTNO = 30 
    OR JOB = 'CLERK';
    
-- ���� �����ڸ� ����� WHERE��
SELECT *
    FROM EMP
    WHERE SAL * 12 >= 36000;
    
SELECT *
    FROM EMP
    WHERE SAL >= 2500
    AND JOB = 'ANALYST';
    
-- ���ڿ��� �� �����ڷ� ���ϱ�

SELECT *
    FROM EMP
    WHERE ENAME >= 'F';
    -- �̸� ù ���ڰ� F�ų� ������ �͸� ���

SELECT *
    FROM EMP
    WHERE ENAME <= 'FORZ';
    
-- � �� ������ =, !=

SELECT *
    FROM EMP
    WHERE SAL != 3000;
    
SELECT *
    FROM EMP
    WHERE NOT SAL = 3000;
    -- NOT�� ���, ���ǹ� �տ� �´�!

-- IN ������

SELECT *
    FROM EMP
    WHERE JOB = 'MANAGER'
    OR JOB = 'SALESMAN'
    OR JOB = 'CLERK';

-- IN �����ڸ� �Ἥ �����ϰ� ǥ���ϱ�
SELECT *
    FROM EMP
    WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');

SELECT *
    FROM EMP
    WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

SELECT *
    FROM EMP
    WHERE DEPTNO IN (10, 20);
    
-- BETWEEN A AND B ������

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
    
-- LIKE �����ڴ� �Ϻ� ���ڿ��� ���Ե� �����͸� ��ȸ

SELECT *
    FROM EMP
    WHERE ENAME LIKE 'S%';
    
-- _ : � ���̵� ������� �� ���� ���� �����͸� �ǹ�
-- % : ���̿� �������(���� ���� ��쵵 ����) ��� ���� �����͸� �ǹ�

-- ��� �̸��� �� ��° ���ڰ� L�� ����� ����ϱ�

SELECT *
    FROM EMP
    WHERE ENAME LIKE '_L%';
    -- L �տ� �� �ϳ��� ���ڰ� �;���
    
SELECT *
    FROM EMP
    WHERE ENAME LIKE '__L%';
    -- L �տ� �� �ΰ��� ���ڰ� �;���
    -- %�� �ڿ� � ������ ���ڰ� �� ���� ������ ��� ����
    
-- ��� �̸��� AM�� ���ԵǾ� �ִ� ��� �����͸� ����ϱ�

SELECT *
    FROM EMP
    WHERE ENAME LIKE '%AM%';
    
SELECT *
    from EMP
    WHERE ENAME NOT LIKE '%AM%';
    
-- ���ϵ� ī�� ���ڰ� �������� �Ϻ��� ��� ==> ESCAPE
-- A_A ���ڿ��� ������ �ִ� ������ ã��

SELECT *
    FROM SOME_TABLE
    WHERE SOME_COLUMN LIKE 'A\_A%' ESCAPE '\';
    
-- NULL ���� ���� �� ����ϱ�

SELECT *
    FROM EMP
    WHERE COMM IS NULL;
    
-- ���� ����� �ִ� ��� �����͸� ����ϱ�

SELECT *
    FROM EMP
    WHERE MGR IS NOT NULL;

-- AND �����ڿ� IS NULL ������ ����ϱ�

SELECT *
    FROM EMP
    WHERE SAL > NULL
    AND COMM IS NULL;
    
SELECT *
    FROM EMP
    WHERE SAL > NULL
    OR COMM IS NULL;

-- ���տ�����(UNION) ����Ͽ� ����ϱ�

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
    
-- UNION ���� ������! ==> ��� ���� ������ �ڷ����� ���ƾ� ��

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION
SELECT SAL, JOB, DEPTNO, SAL
    FROM EMP
    WHERE DEPTNO = 20;
-- ==> ����� �̻������� �� ������ �ڷ����� ���� ������ ���� ���� ���!

-- ���� �������� ���� �� ���
-- UNION : ������ // �ߺ����� ���ŵ�
-- UNION ALL : ������ // �ߺ����� �ߺ� ǥ��
-- MINUS : ������
-- INTERSECT : ������

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION ALL -- UNION�� ���ٸ� �ѹ�����, UNION ALL�� ���� �ι��� �ݺ��ؼ� ��� ���
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
    
    
-- Q1 P125

SELECT *
    FROM EMP
    WHERE ENAME LIKE '%S';

-- Q2 P125

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 30
    AND JOB = 'SALESMAN';
    
-- Q3 P125

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
    
-- Q4 P126

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
    FROM EMP
    WHERE SAL >= 2000
    OR SAL <= 3000;
    
-- Q5 P126

SELECT ENAME, EMPNO, SAL, DEPTNO
    FROM EMP
    WHERE ENAME LIKE '%E%'
    AND DEPTNO = 30
    AND SAL NOT BETWEEN 1000 AND 2000;
    
-- Q6 P126

SELECT *
    FROM EMP
    WHERE COMM IS NULL
    AND MGR IS NOT NULL
    AND JOB IN ('MANAGER', 'CLERK')
    AND ENAME NOT LIKE '_L';


-- ������ ó���� ������ ���� ����Ŭ �Լ� ����ϱ�
-- ���� �Լ��� ����
-- ������ �Լ� : �ະ�� �Լ� ó��
-- ������ �Լ� : ���� �࿡ �Լ��� ���ÿ� ó���Ǿ� ���� �� ���

-- ���� �����͸� �����ϴ� ���� �Լ�

-- ��ҹ��ڸ� �ٲٴ� UPPER, LOWER, INITCAP
-- UPEER(���ڿ�) : ���ڿ� ��θ� �빮�ڷ� ��ȯ
-- LOWER(���ڿ�) : ���ڿ� ��θ� �ҹ��ڷ� ��ȯ
-- INITCAP(���ڿ�) : ù���ڴ� �빮�ڷ�, �������� �ҹ��ڷ� ��ȯ

SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
    FROM EMP;
    
-- Ȱ�� : ���ڿ� �����ʹ� ��ҹ��ڸ� �����ϱ� ������ ���ڿ� �����͸� ã�� �� �̿�

SELECT *
    FROM EMP
    WHERE UPPER(ENAME) = UPPER('SCOTT');
    
SELECT *
    FROM EMP
    WHERE UPPER(ENAME) LIKE UPPER('%SCOTT%');

-- ��� �̸��� ��� �빮�ڷ� ���    
SELECT UPPER(ENAME)
    FROM EMP;
    
-- ���ڿ��� ���̸� ���ϴ� LENGTH �Լ�

SELECT ENAME, LENGTH(ENAME)
    FROM EMP;
    
-- WHERE ������ LENGTH �Լ� ����ϱ�

SELECT ENAME, LENGTH(ENAME)
    FROM EMP
    WHERE LENGTH(ENAME) >= 5;

-- LENGTH �Լ��� LENGTHB �Լ�

SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�')
    FROM DUAL;
    
-- ��å�̸��� 6���� �̻��� �����͸� ���

SELECT *
    FROM EMP
    WHERE LENGTH(JOB) >= 6;
    
-- ���ڿ� �Ϻθ� �����ϴ� SUBSTR �Լ�

-- SUBSTR(���ڿ� ������, ���� ��ġ, ���� ����)
-- SUBSTR(���ڿ� ������, ���� ��ġ) : ������ġ ~ ������ ���

SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
    FROM EMP;

SELECT SUBSTR(ENAME, 3)
    FROM EMP;
    
-- SUBSTR �Լ� �ȿ� �ٸ� �Լ� �Բ� ����ϱ�
SELECT JOB,
    SUBSTR(JOB, -LENGTH(JOB)),
    SUBSTR(JOB, -LENGTH(JOB), 2),
    SUBSTR(JOB, -3)
    FROM EMP;
    
-- ���ڿ� ������ �ȿ��� Ư�� ������ ��ġ�� ã�� INSTR�Լ�

SELECT INSTR('HELLO, ORACLE', 'L') AS INSTR_1,
    INSTR('HELLO, ORACLE', 'L', 5) AS INSTR_2, #�� ��° ����
    INSTR('HELLO, ORACLE', 'L', 2, 2) AS INSTR_3 # �� ��° L
    FROM DUAL;

-- Ư�� ���ڸ� �����ϰ� �ִ� �� ã��
-- INSTR�Լ��� ��� �̸��� ���� S�� �ִ� �� ���ϱ�

SELECT *
    FROM EMP
    WHERE INSTR(ENAME, 'S') > 0;
    
SELECT *
    FROM EMP
    WHERE ENAME LIKE '%S%';
    
-- Ư�� ���ڸ� �ٸ� ���ڿ��� �ٲٴ� REPLACE�Լ�

SELECT '010-1234-5678' AS REPLACE_BEFORE,
    REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
    REPLACE('010-1234-5678', '-') AS REPLACE_2
    FROM DUAL;
    
-- �������� �� ������ Ư�� ���ڷ� ä��� LPAD, RPAD �Լ�

SELECT 'Oracle',
    LPAD('Oracle', 10, '#') AS LPAD_1,
    RPAD('Oracle', 10, '*') AS RPAD_1,
    LPAD('Oracle', 10) AS LAPD_2,
    RPAD('Oracle', 10) AS RPAD_2
    FROM DUAL;
    
SELECT
    RPAD('971125-', 14, '*') AS RPAD_JMNO,
    RPAD('010-1234-', 13, '*') AS RPAD_PHONE
    FROM DUAL;
    
-- �� ���ڿ� �����͸� ��ġ�� CONCAT �Լ�

SELECT CONCAT(EMPNO, ENAME),
    CONCAT(EMPNO, CONCAT(':', ENAME))
    FROM EMP
    WHERE ENAME = 'SCOTT';
    
-- ���ڿ� �����͸� �����ϴ� ||������

SELECT EMPNO || ENAME,
    EMPNO || ':' || ENAME
    FROM EMP;
    
-- Ư�� ���ڸ� ����� TRIM, LTRIM, RTRIM �Լ�
-- TRIM([���� �ɼ�(����)/������ ���� ����][�����ҹ���(����)] FROM [���� ���ڿ� ������(�ʼ�)])

SELECT '[' || TRIM(' _ _ Oracle_ _ ') || ']' AS TRIM,
    '[' || TRIM(LEADING FROM ' _ _ Oracle_ _ ') || ']' AS TRIM_LEADING,
    '[' || TRIM(TRAILING FROM ' _ _ Oracle_ _ ') || ']' AS TRIM_TRAILING,
    '[' || TRIM(BOTH FROM ' _ _ Oracle_ _ ') || ']' AS TRIM_BOTH
    FROM DUAL;
    
SELECT '[' || TRIM('_' FROM '_ _ Oracle_ _ ') || ']' AS TRIM,
    '[' || TRIM(LEADING '_' FROM '_ _ Oracle_ _ ') || ']' AS TRIM_LEADING,
    '[' || TRIM(TRAILING '_' FROM '_ _ Oracle_ _ ') || ']' AS TRIM_TRAILING,
    '[' || TRIM(BOTH '_' FROM '_ _ Oracle_ _ ') || ']' AS TRIM_BOTH
    FROM DUAL;
    
-- LTRIM�� RTRIM ����ϱ�
-- LTRIM([���� ���ڿ� ������(�ʼ�)], [������ ���� ����(����)])
-- RTRIM([���� ���ڿ� ������(�ʼ�)], [������ ���� ����(����)])

SELECT '[' || TRIM(' _Oracle_ ') || ']' AS TRIM,
    '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,
    '[' || LTRIM(' <_Oracle_> ', '_<') || ']' AS LTRIM_2,
    '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
    '[' || RTRIM(' <_Oracle_> ', '>_ ') || ']' AS RTRIM_2
    FROM DUAL;
    
-- LTRIM�� RTRIM ==> �ش� ���ڿ��� ���� �� �ִ� ��� ������ ����/������ ���� ������� ����

-- ���� �Լ�

-- ROUND : �ݿø�
-- TRUNC : ����
-- CEIL : ������ ���ں��� ū ���� �� ���� ���� ������ ��ȯ
-- FLOOR : ������ ���ں��� ���� ���� �� ���� ū ���� ��ȯ
-- MOD : ������ ���� ��ȯ


--SELECT ROUND(1234.5678) AS ROUND,   ������ȯ
--    ROUND(1234.5678, 0) AS ROUND_0, ������ȯ
--    ROUND(1234.5678, 2) AS ROUND_2, �Ҽ� ��° �ڸ�����
--    ROUND(1234.5678, -2) AS ROUND_MINUS2    �ڿ��� ��° �ڸ����� �ݿø�
--    FROM DUAL;

SELECT TRUNC(1234.5678) AS TRUNC,
    TRUNC(1234.5678, 0) AS TRUNC_0,
    TRUNC(1234.5678, 2) AS TRUNC_2,
    TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
    TRUNC(1234.5678, -2) AS TRUNC_MINUS2
    FROM DUAL;
    
--������ ���ڿ� ����� ���� ã�� CEIL, FLOOR

SELECT CEIL(3.14),
       FLOOR(3.14),
       CEIL(-3.14),
       FLOOR(-3.14)
    FROM DUAL;
    
SELECT MOD(15, 6),
       MOD(10, 2),
       MOD(11, 2)
    FROM DUAL;
    


--��¥�� �ٷ�� �Լ�(DATE���� �ٷ�� �Լ�)

--DATE +- NUMBER : ���� �ϼ� ����/������ DATE
--DATE - DATE : �� DATE ���� �ϼ� ����
--DATE + DATE : ���� �Ұ�!!

SELECT SYSDATE AS NOW,
       SYSDATE-1 AS YESTERDAY,
       SYSDATE+1 AS TOMORROW
    FROM DUAL;
    
--�� ���� ������ ��¥�� ���ϴ� ADD_MONTHS �Լ�

SELECT SYSDATE,
       ADD_MONTHS(SYSDATE, 3)
    FROM DUAL;
    
DESC EMP;

--�Ի� 10�ֳ��� �Ǵ� ����� ������ ����ϱ�

SELECT EMPNO, ENAME, HIREDATE,
       ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
    FROM EMP;
    
--�Ի� 32�� �̻��� ��� ������ ����ϱ�

SELECT EMPNO,
       ENAME, HIREDATE
    FROM EMP
  WHERE ADD_MONTHS(HIREDATE, 384) <= SYSDATE;
  

--���� ��¥�� 6���� ���� ��¥ ����ϱ�

SELECT SYSDATE,
       ADD_MONTHS(SYSDATE, 6)
    FROM DUAL;
    
    
--�� ���� �� ���� ���̸� ���ϴ� MONTHS_BETWEEN �Լ�

SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
       MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1,
       MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2,
       TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3
    FROM EMP;
    
    
--NEXT_DAY : ���ƿ��� ����
--LAST_DAY : ���� ������ ��¥

SELECT SYSDATE,
       NEXT_DAY(SYSDATE, '������'),
       LAST_DAY(SYSDATE)
    FROM DUAL;
    
    
--�ڷ��� ��ȯ �Լ�

SELECT EMPNO, ENAME, EMPNO+'500'
    FROM EMP
  WHERE ENAME = 'SCOTT';

--==> '500'�� ������������, �ڵ����� ���������� ��ȯ�Ǿ� ����

SELECT 'ABCD' + EMPNO, EMPNO
    FROM EMP
  WHERE ENAME = 'SCOTT';
  
--==> ��� �Ұ���!!
--==> ����ó�� ���� �������� ���ڷ� �ڵ� ��ȯ, ����ó�� ���� ���ڿ��� ��ȯx

--TO_CHAR     : ���������� ��ȯ
--TO_NUMBER   : ���������� ��ȯ
--TO_DATE     : ��¥������ ��ȯ

--��¥ ���� �����Ͽ�(TO_CHAR) ����ϱ�

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS ���糯¥�ð�
    FROM DUAL;
    
SELECT SYSDATE,
       TO_CHAR(SYSDATE, 'MM') AS MM,
       TO_CHAR(SYSDATE, 'MON') AS MON,
       TO_CHAR(SYSDATE, 'MONTH') AS MONTH,
       TO_CHAR(SYSDATE, 'DD') AS DD,
       TO_CHAR(SYSDATE, 'DY') AS DY,
       TO_CHAR(SYSDATE, 'DAY') AS DAY
    FROM DUAL;
    
--Ư�� ���� ����ϱ�

SELECT SYSDATE,
       TO_CHAR(SYSDATE, 'MM') AS MM,
       TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR,
       TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
       TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG
    FROM DUAL;
    
    
--���� �����Ϳ� ������ �����Ͽ� ����ϱ�

SELECT SAL,
       TO_CHAR(SAL, '$999,999') AS SAL_$,
       TO_CHAR(SAL, 'L999,999') AS SAL_L,
       TO_CHAR(SAL, '999,999.00') AS SAL_1,
       TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
       TO_CHAR(SAL, '000999999.99') AS SAL_3,
       TO_CHAR(SAL, '999,999,00') AS SAL_4
    FROM EMP;
    
    
SELECT 1300 - '1500',
       '1300' + 1500
    FROM DUAL;
--==> ���� ����


SELECT '1,300' - '1,500'
    FROM DUAL;
--==> ����Ұ� ,������ ���������� �ν����� ����

SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
    FROM DUAL;
    
--���� �����͸� ��¥ �����ͷ� ��ȯ�ϱ�

SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE1,
       TO_DATE('20180714', 'YYYY-MM-DD') AS TODATE2
    FROM DUAL;
    
    
--1981�� 6�� 1�� ���� �Ի��� ��� ���� �����ϱ�

SELECT *
    FROM EMP
   WHERE HIREDATE > TO_DATE('19810601', 'YYYY-MM-DD');
   
--YY : �� ������ ����� �⵵(2059)
--RR : �� ������ �⵵ �� �� �ڸ� ���� ~49, 50~ �Էµ� ��ġ ~49, 50~�� ��� ����� �⵵�� ǥ�� (1959)


--NULL ó�� �Լ�

SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,
       NVL(COMM, 0),
       SAL+NVL(COMM, 0)
    FROM EMP;

--NVL(NULLȮ�� ����, �ٲ� ��)

SELECT EMPNO, ENAME, COMM,
       NVL2(COMM, '0', 'X'),
       NVL2(COMM, SAL*12+COMM, SAL*12) AS ANNSAL
    FROM EMP;

--NVL2(NULLȮ�� ����, NULL�� �ƴ� �� ��ȯ ��, NULL�� �� ��ȯ ��)

--��Ȳ�� ���� �ٸ� �����͸� ��ȯ�ϴ� DECODE�Լ��� CASE��


SELECT EMPNO, ENAME, JOB, SAL,
       DECODE(JOB,
              'MANAGER', SAL*1.1,
              'SALSESMAN', SAL*1.05,
              'ANALYST', SAL,
              SAL*1.03) AS UPSAL
    FROM EMP;
    

SELECT EMPNO, ENAME, JOB, SAL,
    CASE JOB
         WHEN 'MANAGER' THEN SAL*1.1
         WHEN 'SALESMAN' THEN SAL*1.05
         WHEN 'ANALYST' THEN SAL
         ELSE SAL*1.03
    END AS UPSAL
    FROM EMP;
    
--���� ���� ���� ��, CASE ����ϱ�

SELECT EMPNO, ENAME, COMM,
    CASE
     WHEN COMM IS NULL THEN '�ش���׾���'
     WHEN COMM = 0 THEN '�������'
     WHEN COMM >0 THEN '���� : ' || COMM
    END AS COMM_TEXT
   FROM EMP;
   
-- Q1 P174

SELECT EMPNO,
       SUBSTR(EMPNO, -LENGTH(EMPNO), 2) || '**' AS MASKING_EMPNO,
       ENAME,
       SUBSTR(ENAME, -LENGTH(ENAME), 1) || '****' AS MASKING_ENAME
    FROM EMP 
    WHERE LENGTH(ENAME) >= 5 AND LENGTH(ENAME) < 6;
    
-- 6-1
SELECT EMPNO,
       RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MASKING_EMPNO,
       ENAME,
       RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') AS MASKING_ENAME
 FROM  EMP
 WHERE LENGTH(ENAME) >= 5
   AND LENGTH(ENAME) < 6;
   
-- 6-2

SELECT EMPNO, ENAME, SAL,
       TRUNC(SAL / 21.5, 2) AS DAY_PAY,
       ROUND(SAL / 21.5 / 8, 1) AS TIME_PAY
    FROM EMP;
    
-- 6-3

SELECT EMPNO, ENAME, HIREDATE,
       TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '������'), 'YYYY-MM-DD') AS R_JOB,
       NVL(TO_CHAR(COMM), 'N/A') AS COMM
    FROM EMP;
    
-- 6-4

SELECT EMPNO, ENAME, MGR,
     CASE
      WHEN MGR IS NULL THEN '0000'
      WHEN MGR LIKE '75%' THEN '5555'
      WHEN MGR LIKE '76%' THEN '6666'
      WHEN MGR LIKE '77%' THEN '7777'
      WHEN MGR LIKE '78%' THEN '8888'
      ELSE 'MGR'
      END AS CHG_MGR
    FROM EMP;
    
SELECT EMPNO, ENAME, MGR,
       CASE
          WHEN MGR IS NULL THEN '0000'
          WHEN SUBSTR(MGR, 1, 2) = '78' THEN '8888'
          WHEN SUBSTR(MGR, 1, 2) = '77' THEN '7777'
          WHEN SUBSTR(MGR, 1, 2) = '76' THEN '6666'
          WHEN SUBSTR(MGR, 1, 2) = '75' THEN '5555'
          ELSE TO_CHAR(MGR)
       END AS CHG_MGR
  FROM EMP;


-- ������ �Լ�

SELECT SUM(SAL)
    FROM EMP;
    
-- SUM : �հ�
-- COUNT : ����
-- MAX : �ִ�
-- MIN : �ּ�
-- AVG : ���

SELECT SUM(DISTINCT SAL),
       SUM(ALL SAL),
       SUM(SAL)
    FROM EMP;
    
SELECT SUM(SAL), SUM(COMM)
    FROM EMP;
    

SELECT COUNT(*)
    FROM EMP;
    
-- �μ� ��ȣ�� 30�� ���� �� ���ϱ�

SELECT COUNT(*)
    FROM EMP
   WHERE DEPTNO = 30;
   
SELECT COUNT(COMM)
    FROM EMP;
    
SELECT COUNT(COMM)
    FROM EMP
   WHERE COMM IS NOT NULL;
-- ������� ���� �⺻������ NULL���� COUNT���� ���ܵ�


SELECT MAX(SAL)
    FROM EMP
   WHERE DEPTNO = 10;
   
SELECT MIN(SAL)
    FROM EMP
   WHERE DEPTNO = 10;
   
-- ��¥ �����Ϳ� MIN, MAX �̿��ϱ�

SELECT MAX(HIREDATE)
    FROM EMP
   WHERE DEPTNO = 20;
-- MAX���� ���� �ֱ�, MIN���� ���� ����

SELECT AVG(SAL)
    FROM EMP
   WHERE DEPTNO = 30;

-- 1�� ���� P185
SELECT AVG(COMM)
    FROM EMP
   WHERE DEPTNO = 30;
   

-- GROUP BY��

SELECT AVG(SAL), DEPTNO
    FROM EMP
   GROUP BY DEPTNO;
-- GROUP BY ������ ��Ī�� ������ �� ����

SELECT AVG(SAL), '10�μ�' AS DEPTNO FROM EMP WHERE DEPTNO = 10
UNION ALL
SELECT AVG(SAL), '20�μ�' AS DEPTNO FROM EMP WHERE DEPTNO = 20
UNION ALL
SELECT AVG(SAL), '30�μ�' AS DEPTNO FROM EMP WHERE DEPTNO = 30;


--�μ���ȣ �� ��å�� ��� �޿��� �����ϱ�

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   GROUP BY DEPTNO, JOB
   ORDER BY DEPTNO, JOB;
   
-- 1�к��� P188

SELECT AVG(COMM), DEPTNO
    FROM EMP
   GROUP BY DEPTNO;
   
-- GROUP BY �� ���� ������

SELECT ENAME, DEPTNO, AVG(SAL)
    FROM EMP
   GROUP BY DEPTNO;
-- �����ڵ� �߻�! ENAME�� �������̾(DEPTNO, AVG(SAL)�� ����)

-- GROUP BY���� ���� �ֱ� (HAVING ��)
-- ��ձ޿��� 2000�̻��� �׷��� ��å�� ��� �޿� ���ϱ�
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000
   ORDER BY DEPTNO, JOB;
   
-- WHERE�� : ��� ��� ���� ����
-- HAVING�� : �׷�ȭ�� ����� ��¿��� ����

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   WHERE AVG(SAL) >= 2000 -- �׳� SAL�� �ϸ� ��� ����
  GROUP BY DEPTNO, JOB
  ORDER BY DEPTNO, JOB;
-- �����ڵ�!!

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000
   ORDER BY DEPTNO, JOB;
   
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   WHERE SAL <= 3000
  GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000
  ORDER BY DEPTNO, JOB;
  
-- 1�� ���� P194

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 500
   ORDER BY DEPTNO, JOB;
   
-- GROUP BY�� ���õ� ��ȭ �Լ�
-- ROLLUP, CUBE, GROUPING SETS �Լ�

-- ROLLUP, CUBE > �׷�ȭ �������� �հ踦 �Բ� ���

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
   GROUP BY ROLLUP(DEPTNO, JOB)
   ORDER BY DEPTNO, JOB;
   
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
   GROUP BY CUBE(DEPTNO, JOB)
   ORDER BY DEPTNO, JOB;

-- ROLLUP(A, B, C) => N+1���� ���
-- 1. A �׷캰 B �׷캰, C �׷쿡 �ش��ϴ� ���
-- 2. A �׷캰 B �׷쿡 �ش��ϴ� ���
-- 3. A �׷쿡 �ش��ϴ� ���
-- 4. ��ü ���

-- CUBE(A, B, C) => 2^N ���� ���
-- 1. A �׷캰 B �׷캰, C �׷쿡 �ش��ϴ� ���
-- 2. A �׷캰 B �׷쿡 �ش��ϴ� ���
-- 3. B �׷캰 C �׷쿡 �ش��ϴ� ���
-- 4. A �׷캰 C �׷쿡 �ش��ϴ� ���
-- 5. A �׷���
-- 6. B �׷���
-- 7. C �׷���
-- 8. ��ü ���

-- PARTIAL ROLLUP/ CUBE
-- DEPTNO�� �׷�ȭ �Ŀ� ROLLUP�Լ� ����
SELECT DEPTNO, JOB, COUNT(*)
    FROM EMP
   GROUP BY DEPTNO, ROLLUP(JOB);
   
SELECT DEPTNO, JOB, COUNT(*)
    FROM EMP
   GROUP BY ROLLUP(DEPTNO, JOB);


-- JOB���� �׷�ȭ �Ŀ� ROLLUP�Լ� ����
SELECT DEPTNO, JOB, COUNT(*)
    FROM EMP
   GROUP BY JOB, ROLLUP(DEPTNO);
   
   
-- ������ ��� ���� ���� ��׷����� ó���Ͽ� ����ϱ� GROUPING SETS �Լ�
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   GROUP BY GROUPING SETS(DEPTNO, JOB)
   ORDER BY DEPTNO, JOB;
   
-- GROUPING �Լ� > GROUP BY ������ ������ ���� �׷�ȭ�Ǿ����� Ȯ��

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL),
       GROUPING(DEPTNO),
       GROUPING(JOB)
    FROM EMP
   GROUP BY CUBE(DEPTNO, JOB)
   ORDER BY DEPTNO, JOB;
-- 0 : �׷�ȭ �Ǿ����� �ǹ�, 1 : �׷�ȭ ���� �ʾ����� �ǹ�

-- DECODE ������ GROUPING �Լ��� �����Ͽ� ��� ǥ���ϱ�

SELECT DECODE(GROUPING(DEPTNO), 1, 'ALL_DEPT', DEPTNO) AS DEPTNO,
       DECODE(GROUPING(JOB), 1, 'ALL_JOB', JOB) AS JOB,
       COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
   GROUP BY CUBE(DEPTNO, JOB)
   ORDER BY DEPTNO, JOB;
   
-- GROUPING_ID : �� ���� ���� ���� ������ �� ���� GROUPING�� ����������,
-- 0, 1�� ���е��� ����
-- A, B = 0, 0 = 0 || �׷�ȭ X = 0
-- A, B = 0, 1 = 1 || A�� �׷�ȭ = 1
-- A, B = 1, 0 = 2 || B�� �׷�ȭ = 2
-- A, B = 1, 1 = 3 || A, B�� �׷�ȭ = 3

SELECT DEPTNO, JOB, COUNT(*), SUM(SAL),
       GROUPING(DEPTNO),
       GROUPING(JOB),
       GROUPING_ID(DEPTNO, JOB)
    FROM EMP
   GROUP BY CUBE(DEPTNO, JOB)
   ORDER BY DEPTNO, JOB;

-- LISTAGG �Լ� > �׷쿡 �����ִ� �����͸� ���η� ����
SELECT ENAME
    FROM EMP
   WHERE DEPTNO = 10;

-- ���⼭ 20, 30 �μ��� ����̸��� ����ϰ� ���� ��,
-- DEPTNO�� �׷�ȭ�ϸ� ��� �̸��� ��� �Ұ���

SELECT DEPTNO, ENAME
    FROM EMP
   GROUP BY DEPTNO, ENAME;
-- �� ���� ����� �� ���� ������, ���� �ʹ� ������
-- �׷� �� LISTAGG�Լ��� �����

SELECT DEPTNO,
       LISTAGG(ENAME, ', ')
       WITHIN GROUP(ORDER BY SAL DESC) AS ENAMES -- ���ı���
    FROM EMP
   GROUP BY DEPTNO;
   
-- PIVOT, UNPIVOT�Լ�
-- PIVOT : ���� ���̺� ���� ���� �ٲ�
-- UNPIVOT : ���� ���̺� ���� ������ �ٲ�

SELECT DEPTNO, JOB, MAX(SAL)
    FROM EMP
   GROUP BY DEPTNO, JOB
   ORDER BY DEPTNO, JOB;
   
-- PIVOT �Լ��� �̿��Ͽ� ��å��, �μ��� �ְ� �޿��� 2���� ǥ ���·� ����ϱ�
SELECT *
    FROM(SELECT DEPTNO, JOB, SAL -- ���������� ���� �ٷ� ����
         FROM EMP)
   PIVOT(MAX(SAL) -- ���� ��µ� ������
        FOR DEPTNO IN (10, 20, 30) -- FOR �����ٷ� ǥ���� ��, IN ����Ϸ��� ��
        )
   ORDER BY JOB; -- ���� �� ���� ����
   
SELECT *
    FROM(SELECT JOB, DEPTNO, SAL
         FROM EMP)
   PIVOT(MAX(SAL)
        FOR JOB IN ('CLERK' AS CLERK,
                    'SALESMAN' AS SALESMAN,
                    'PRESIDENT' AS PRESIDENT,
                    'MANAGER' AS MANAGER,
                    'ANALYST' AS ANALYST)
        )
   ORDER BY DEPTNO;
   
-- DECODE���� �̿��Ͽ� PIVOT�Լ��� ���� ��� �����ϱ�
SELECT DEPTNO,
       MAX(DECODE(JOB, 'CLERK', SAL)) AS CLERK,
       MAX(DECODE(JOB, 'SALESMAN', SAL)) AS SALESMAN,
       MAX(DECODE(JOB, 'PRESIDENT', SAL)) AS PRESIDENT,
       MAX(DECODE(JOB, 'MANAGER', SAL)) AS MANAGER,
       MAX(DECODE(JOB, 'ANALYST', SAL)) AS ANALYST
    FROM EMP
   GROUP BY DEPTNO
   ORDER BY DEPTNO;
   
-- UNPIVOT �Լ��� ����Ͽ� ���� ���е� �׷��� ������ ����ϱ�

SELECT *
    FROM(SELECT DEPTNO,
                MAX(DECODE(JOB, 'CLERK', SAL)) AS CLERK,
                MAX(DECODE(JOB, 'SALESMAN', SAL)) AS SALESMAN,
                MAX(DECODE(JOB, 'PRESIDENT', SAL)) AS PRESIDENT,
                MAX(DECODE(JOB, 'MANAGER', SAL)) AS MANAGER,
                MAX(DECODE(JOB, 'ANALYST', SAL)) AS ANALYST
            FROM EMP
           GROUP BY DEPTNO
           ORDER BY DEPTNO)
       UNPIVOT(SAL
        FOR JOB IN (CLERK, SALESMAN, PRESIDENT, MANAGER, ANALYST))
    ORDER BY DEPTNO, JOB;
    
-- 7-1
DESC EMP;
SELECT DEPTNO,
       TRUNC(AVG(SAL)) AS AVG_SAL,
       MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL,
       COUNT(*) AS CNT
    FROM EMP
   GROUP BY DEPTNO
   ORDER BY DEPTNO DESC;
   
SELECT DEPTNO,
       TRUNC(AVG(SAL)) AS AVG_SAL,
       MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL,
       COUNT(*) AS CNT
  FROM EMP
GROUP BY DEPTNO; 

-- 7-2

SELECT JOB, COUNT(*)
    FROM EMP
   GROUP BY JOB
  HAVING COUNT(*) >= 3;
  
-- 7-3

SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
       DEPTNO,
       COUNT(*) AS CNT
    FROM EMP
   GROUP BY HIRE_YEAR, DEPTNO;
-- ��Ī�� GROUP BY�� ������ �� ����!!
   
SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
       DEPTNO,
       COUNT(*) AS CNT
  FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO; 

-- 7-4

SELECT CASE
        WHEN COMM IS NULL THEN 'X'
        ELSE 'O'
       END AS EXIST_COMM,
       COUNT(*) AS CNT
    FROM EMP
   GROUP BY CASE
        WHEN COMM IS NULL THEN 'X'
        ELSE 'O'
       END AS EXIST_COMM
-- ���� �߻�!! CASE���� GROUP BY �׿� ���� �� ����! ==> NVL2�� ���!

SELECT NVL2(COMM, 'O', 'X') AS EXIST_COMM,
       COUNT(*) AS CNT
  FROM EMP
GROUP BY NVL2(COMM, 'O', 'X'); 

-- 7-4

SELECT DEPTNO,
       TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
       COUNT(*),
       MAX(SAL) AS MAX_SAL,
       SUM(SAL) AS SUM_SAL,
       AVG(SAL) AS AVG_SAL
   FROM EMP
GROUP BY ROLLUP(DEPTNO, TO_CHAR(HIREDATE, 'YYYY'));
   
SELECT DEPTNO,
       TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
       COUNT(*) AS CNT,
       MAX(SAL) AS MAX_SAL,
       SUM(SAL) AS SUM_SAL,
       AVG(SAL) AS AVG_SAL
  FROM EMP
GROUP BY ROLLUP(DEPTNO, TO_CHAR(HIREDATE, 'YYYY')); 


-- JOIN �Լ� (���� ���̺��� �ϳ��� ��ġ��)
-- UNION : �� �� �̻��� SELECT���� ���η� ����
-- JOIN : �� �� �̻��� SELECT���� ���η� ����

DESC DEPT;

SELECT *
    FROM EMP, DEPT
   ORDER BY EMPNO;
   
-- �� �̸��� ���ϴ� ���ǽ����� �����ϱ�
SELECT *
    FROM EMP, DEPT
   WHERE EMP.DEPTNO = DEPT.DEPTNO
  ORDER BY EMPNO;
  
-- ���̺� �̸��� ��Ī���� �����ϱ�
SELECT *
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO
  ORDER BY EMPNO;
-- FROM �� ��Ī�� WHERE ���� ��ٷ� �� �� ����!
-- ������ ��� *�� ������� ����! (���� ����, ��ȭ ����(���ο� �� ���� ��)�� ����)

SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO,
       D.DNAME, D.LOC
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO
  ORDER BY EMPNO;
  
-- 1�� ����
SELECT E.EMPNO, D.DNAME
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO
  ORDER BY EMPNO;
  
-- JOIN�� ���� 1) � ����(EQUI JOIN) : Ư �� ���� ��ġ�� �����͸� �������� ����
-- ���� ���̺��� �� �̸��� ���� �� ������

SELECT EMPNO, ENAME, DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO;
-- ���� �߻�!
SELECT EMPNO, ENAME, E.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO;

-- ������ ��� ��Ī�� ����� ��!
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO
  ORDER BY D.DEPTNO, E.EMPNO;
  
-- WHERE ���� ���ǽ� �߰��Ͽ� ����ϱ�

SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO
    AND SAL >= 3000
  ORDER BY D.DEPTNO, E.EMPNO;

-- �� ���� : ��ġ�ϴ� ���� �������� �ϴ� ���� �ƴ� ��� ����

SELECT *
    FROM EMP E, SALGRADE S
   WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;
   
-- ��ü ���� : ���� ���̺��� ������ �����ؾ� �� �� ���
-- ���̺��� �����ؼ� ����� �� ������, �뷮/�ӵ� �鿡�� �ſ� �Ҹ�

-- ������ ���� ���̺�(COPY_EMP)�� ������ �� (����, �ÿ� �� ��)
SELECT *
    FROM EMP E, COPY_EMP C
   WHERE E.MGR = C.EMPNO;
   
-- ���̺��� �� �� �̿��Ͽ� ��ü ����

SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1, EMP E2
   WHERE E1.MGR = E2.EMPNO;
   
-- �ܺ� ���� : �� ���̺��� KING������ ���� : KING�� ����ڰ� �����Ƿ�
-- ������, ����� ���� NULL�̾ ����ؾ� �� ���� ����
-- 1) ���� �ܺ� ���� : WHERE TABLE1.COL1 = TABLE2.COL1(+)
-- 2) ������ �ܺ� ���� : WHERE TABLE1.COL1(+) = TABLE2.COL1

-- ���� �ܺ����� ����ϱ� : ���� ���� �������� ������ ���� ������ ���翩�ο� ������� ���
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1, EMP E2
   WHERE E1.MGR = E2.EMPNO(+)
  ORDER BY E1.EMPNO;
  
-- ������ �ܺ����� ����ϱ� : ������ ���� �������� ���� ���� ������ ���翩�ο� ������� ���
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1, EMP E2
   WHERE E1.MGR(+) = E2.EMPNO
  ORDER BY E1.EMPNO;
-- ��, ���������� ���� ����鵵 ��µ�
-- ������ : ��ü �ܺ� ������ ����� �Ұ�����!


-- SQL-99 ǥ�� �������� ����ϴ� ����

-- � ���� : NATURAL JOIN
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       DEPTNO, D.DNAME, D.LOC
    FROM EMP E NATURAL JOIN DEPT D
   ORDER BY DEPTNO, E.EMPNO;
-- ������ �޸� WHERE���� �ƴ� FROM���� ���
-- �� ���̺� ���� ��(DEPTNO)�� �ڵ����� ã�Ƽ� ��������
-- ���, ������ �޸� SELECT���� DEPTNO�� E.DEPTNO, D.DEPTNO�� ���ָ� �� ��!

-- � ���� : JOIN ~ USING > ���� ���� ������ִ� � ����
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       DEPTNO, D.DNAME, D.LOC
    FROM EMP E JOIN DEPT D USING(DEPTNO)
   ORDER BY DEPTNO, E.EMPNO;
-- ����, ���� ���� ��õ� ���� SELECT���� ���̺� ���� �Է��ϸ� �� ��!

-- � ���� : JOIN ~ ON > ���� �������� ���
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       E.DEPTNO, D.DNAME, D.LOC
    FROM EMP E JOIN DEPT D ON(E.DEPTNO = D.DEPTNO)
   WHERE SAL <= 3000
  ORDER BY DEPTNO, E.EMPNO;
-- �� ���� SELECT���� ���̺� ���� �������� ��!


-- �ܺ� ���� : 1)����, 2)������, 3)��ü(SQL-99������ ����, ���� : UNION Ȱ��)
-- 1) ���� : FROM TABLE1 LEFT OUTER JOIN TABLE 2 ON ~
-- 2) ������ : FROM TABLE1 RIGHT OUTER JOIN TABLE2 ON ~
-- 3) ��ü : FROM TABLE1 FULL OUTER JOIN TABLE2 ON ~

-- ���� �ܺ� ����
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1 LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
   ORDER BY E1.EMPNO;
   
-- ������ �ܺ� ����
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
   ORDER BY E1.EMPNO, MGR_EMPNO;
   
-- ��ü �ܺ� ����
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1 FULL OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
   ORDER BY E1.EMPNO;
   
-- SQL-99�� ORACLE ���� �� ���� ������ ����ϸ� ��!
-- �������� SQL-99 ���� Ź��

-- 3�� �̻��� ���̺��� �����ϱ�
-- ����
--FROM TABLE1, TABLE2, TABLE3
--WHERE TABLE1.COL = TABLE2.COL
--AND TABLE2.COL = TABLE3.COL

-- SQL-99
--FROM TABLE1 JOIN TABLE2 ON (���ǽ�)
--JOIN TABLE3 ON (���ǽ�)
--�׳� ���� �Ǵٸ� ���ǽ��� �������ָ� ��!

-- 8-1
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
    FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
   WHERE SAL > 2000
  ORDER BY DEPTNO;
  
-- 8-2
SELECT E.DEPTNO, D.DNAME,
       TRUNC(AVG(SAL)) AS AVG_SAL,
       MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL,
       COUNT(*) AS CNT
    FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
   GROUP BY E.DEPTNO, D.DNAME
   ORDER BY E.DEPTNO;
   
SELECT DEPTNO,
       D.DNAME,
       TRUNC(AVG(SAL)) AS AVG_SAL,
       MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL,
       COUNT(*) AS CNT
  FROM EMP E JOIN DEPT D USING (DEPTNO)
GROUP BY DEPTNO, D.DNAME;

-- 8-3 (Ʋ��!! �����ľ� �����)
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
    FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
   ORDER BY DEPTNO, ENAME;
   
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
  FROM EMP E RIGHT OUTER JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
ORDER BY D.DEPTNO, E.ENAME;

-- 8-4
SELECT D.DEPTNO, D.DNAME,
       E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL,
       D.DEPTNO AS DEPTNO_1,
       S.LOSAL, S.HISAL, S.GRADE,
       E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
    FROM EMP E1 FULL OUTER JOIN DEPT D ON (E1.DEPTNO = D.DEPTNO) 
    FULL OUTER JOIN SALGRADE S ON (E1.SAL BETWEEN S.LOSAL AND S.HISAL)
    LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
   ORDER BY D.DEPTNO, E1.EMPNO;
   
SELECT D.DEPTNO, D.DNAME,
       E.EMPNO, E.ENAME, E.MGR, E.SAL, E.DEPTNO, -- �ߺ��Ǹ� �ڵ����� _1�� �ٲ�
       S.LOSAL, S.HISAL, S.GRADE,
       E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
  FROM EMP E RIGHT OUTER JOIN DEPT D
                ON (E.DEPTNO = D.DEPTNO)
              LEFT OUTER JOIN SALGRADE S
                ON (E.SAL BETWEEN S.LOSAL AND S.HISAL)
              LEFT OUTER JOIN EMP E2
                ON (E.MGR = E2.EMPNO)
ORDER BY D.DEPTNO, E.EMPNO; 

-- ���� ���� : �ַ� WHERE �� �ȿ� �� �ٸ� SQL���� ��

-- JONES���� �޿��� ���� ����� ��ȸ�ϰ� ���� ��
-- 1. JONES�� �޿��� ã�´�
SELECT SAL
    FROM EMP
   WHERE ENAME = 'JONES';
-- 2. ���� JONES�� �޿��� ����
SELECT *
    FROM EMP
   WHERE SAL > 2975;
   
-- �� ������ �� ����

SELECT *
    FROM EMP
   WHERE SAL > (SELECT SAL
                   FROM EMP
                  WHERE ENAME = 'JONES')
   ORDER BY SAL;

-- �������������� ��� ��츦 �����ϰ�� ORDER BY���� ����� �� ����!
