
-- DISTINCT

SELECT DISTINCT DEPTNO
    FROM EMP;

SELECT DISTINCT JOB, DEPTNO
    FROM EMP;
-- (JOB, DEPTNO) ������ �ߺ����� �Ǵ�


-- ��Ī ���
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
    FROM EMP;
-- �� �� COMM�� NULL�̸� ANNSAL���� NULL�� ǥ���

-- ���� ����
SELECT *
    FROM EMP
   ORDER BY DEPTNO ASC, SAL DESC;
   
-- WHERE �� : ���ǽ� Ȱ��
SELECT *
    FROM EMP
   WHERE DEPTNO = 30
         AND JOB = 'SALESMAN';
         
-- IN ������
SELECT *
    FROM EMP
   WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');
   
-- BETWEEN ������
SELECT *
    FROM EMP
   WHERE SAL BETWEEN 2000 AND 3000;
   
-- LIKE ������ : �Ϻ� ���ڿ��� ���Ե� �����͸� ��ȸ
-- _ : �Ѱ��� ���� ������, % : ��� ����(���� ����) ������

SELECT *
    FROM EMP
   WHERE ENAME LIKE '_L%'; -- �ι�° ���ڰ� L�� ��� ���� ���

SELECT *
    FROM EMP
   WHERE ENAME LIKE '%AM%'; -- AM�� ���� ��� ���� ���

-- ESCAPE   
SELECT *
    FROM EMP
   WHERE ENAME LIKE 'A\_A%' ESCAPE '\'; -- '_'�� ������ ��� 'A_A'�� ���۵Ǵ� ������

-- NULL���� ���� �� ����ϱ�
SELECT *
    FROM EMP
   WHERE COMM IS NULL;
   
SELECT *
    FROM EMP
   WHERE SAL > NULL -- �۵� �� ��
   AND COMM IS NULL;
   
-- ���տ�����(UNION) ����ϱ� : ��� ���� ������ �ڷ����� ���ƾ� ��
-- ���� �������� ���� �� ���
-- UNION : ������ // �ߺ����� ���ŵ�
-- UNION ALL : ������ // �ߺ����� �ߺ� ǥ��
-- MINUS : ������
-- INTERSECT : ������

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
   WHERE DEPTNO = 10
UNION
SELECT SAL, JOB, DEPTNO, SAL
    FROM EMP
   WHERE DEPTNO = 20; -- ���� �̸��� ù��° ������ ����

-- PRACTICE
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
   WHERE DEPTNO = 30
   AND JOB = 'SALESMAN';
   
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
   WHERE DEPTNO IN (20, 30)
   AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
   WHERE DEPTNO = 30
   AND SAL > 2000;
   
SELECT ENAME, EMPNO, SAL, DEPTNO
    FROM EMP
   WHERE ENAME LIKE '%E%'
   AND DEPTNO = 30
   AND SAL NOT BETWEEN 1000 AND 2000;

SELECT *
    FROM EMP
   WHERE COMM IS NULL
   AND MGR IS NOT NULL
   AND JOB IN ('MANAGER', 'CLERK')
   AND ENAME NOT LIKE '_L';
   
-- ���ڿ� ��ȯ �Լ�
-- UPEER(���ڿ�) : ���ڿ� ��θ� �빮�ڷ� ��ȯ
-- LOWER(���ڿ�) : ���ڿ� ��θ� �ҹ��ڷ� ��ȯ
-- INITCAP(���ڿ�) : ù���ڴ� �빮�ڷ�, �������� �ҹ��ڷ� ��ȯ

SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
    FROM EMP;
-- ���ڿ� �����ʹ� ��ҹ��ڸ� ���������� ���ڿ� ������ �˻��� �̿�

SELECT *
    FROM EMP
   WHERE UPPER(ENAME) = 'SCOTT';
   
-- LENGTH
SELECT ENAME, LENGTH(ENAME)
    FROM EMP
   WHERE LENGTH(ENAME) >= 5;
   
-- SUBSTR(���ڿ� ������, ���� ��ġ, ���� ����)
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3)
    FROM EMP;
    
SELECT JOB, SUBSTR(JOB, -1), SUBSTR(JOB, LENGTH(JOB)-1)
    FROM EMP;
    
-- INSTR : Ư�� ���ڰ� �����ִ� �� ���ϱ�
SELECT *
    FROM EMP
   WHERE INSTR(ENAME, 'S') > 0; -- �� ó�� Ȱ�밡��

SELECT *
    FROM EMP
   WHERE ENAME LIKE '%S%'; -- ���� ���� ���
   
-- REPLACE
SELECT '010-1234-5678' AS REPLACE_BEFORE,
    REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
    REPLACE('010-1234-5678', '-') AS REPLACE_2
    FROM DUAL;
    
-- LPAD, RPAD
SELECT 'Oracle',
    LPAD('Oracle', 10, '#') AS LPAD_1,
    RPAD('Oracle', 10, '*') AS RPAD_1,
    LPAD('Oracle', 10) AS LAPD_2, -- ���ڿ� ���� ���ҽ�, �������� ó����
    RPAD('Oracle', 10) AS RPAD_2
    FROM DUAL;
    
-- CONCAT, || : ���ڿ� ��ġ��
SELECT CONCAT(EMPNO, ENAME)
    FROM EMP
   WHERE ENAME = 'SCOTT';

SELECT EMPNO || ENAME, EMPNO || ':' || ENAME
    FROM EMP
   WHERE ENAME = 'SCOTT';
   
-- TRIM(���� �ɼ�(����)'������ ���ڿ�' FROM '���� ���ڿ� ������') : �ϳ��� ���ڿ��� ���밡��
SELECT TRIM('O' FROM 'ORACLE') AS TRIM,
       TRIM(LEADING 'O' FROM 'ORACLE') AS TRIM_LEADING,
       TRIM(TRAILING 'E' FROM 'ORACLE') AS TRIM_TRAILING,
       TRIM(BOTH 'O' FROM 'ORACLEO') AS TRIM_BOTH
    FROM DUAL;
    
-- LTRIM, RTRIM -> ���� ���ڿ��� ���� �� �ִ� ��� ������ ����
SELECT LTRIM('ORACLE', 'RO') AS LTRIM,
       RTRIM('ORACLE', 'ELCROA') AS RTRIM
    FROM DUAL;
-- TRIM�� LTRIM/RTRIM�� ��� ������ �޶� ���� ���!!!

-- ���� �Լ�

-- ROUND : �ݿø�
-- TRUNC : ����
-- CEIL : ������ ���ں��� ū ���� �� ���� ���� ������ ��ȯ
-- FLOOR : ������ ���ں��� ���� ���� �� ���� ū ���� ��ȯ
-- MOD : ������ ���� ��ȯ

SELECT ROUND(1234.5678) AS ROUND,   --������ȯ
    ROUND(1234.5678, 0) AS ROUND_0, --������ȯ
    ROUND(1234.5678, 2) AS ROUND_2, --��° �ڸ����� ǥ��
    ROUND(1234.5678, -2) AS ROUND_MINUS2    --�ڿ��� ��° �ڸ����� �ݿø�
    FROM DUAL;
    
SELECT TRUNC(1234.5678) AS TRUNC,
    TRUNC(1234.5678, 0) AS TRUNC_0,
    TRUNC(1234.5678, 2) AS TRUNC_2, -- ��°¥������ ǥ��
    TRUNC(1234.5678, -1) AS TRUNC_MINUS1, -- �ڿ��� ù°¥������ ����
    TRUNC(1234.5678, -2) AS TRUNC_MINUS2 -- �ڿ��� ��°�ڸ����� ����
    FROM DUAL;
    
SELECT CEIL(3.14),
       FLOOR(3.14),
       CEIL(-3.14),
       FLOOR(-3.14)
    FROM DUAL;
    
SELECT MOD(15, 6),
       MOD(10, 2),
       MOD(11, 2)
    FROM DUAL;    

-- DATE��
--DATE +- NUMBER : ���� �ϼ� ����/������ DATE
--DATE - DATE : �� DATE ���� �ϼ� ����
--DATE + DATE : ���� �Ұ�!!

SELECT SYSDATE AS NOW,
       SYSDATE - 1 AS YESTERDAY,
       SYSDATE + 1 AS TOMORROW
    FROM DUAL;
    
-- ADD_MONTHS
SELECT SYSDATE,
       ADD_MONTHS(SYSDATE, 3)
    FROM DUAL;

SELECT EMPNO, ENAME, HIREDATE,
       ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
    FROM EMP;

-- �Ի� 32�� �̻��� ��� ���� ����
SELECT EMPNO, ENAME, HIREDATE
    FROM EMP
   WHERE ADD_MONTHS(HIREDATE, 384) <= SYSDATE;
   
-- MONTHS_BETWEEN
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
       MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS_BETWEEN1
    FROM EMP;
    
-- NEXT_DAY(���ƿ��� ����), LAST_DAY(���� ������ ��¥)

SELECT SYSDATE,
       TO_CHAR(NEXT_DAY(SYSDATE, '������'), 'YYYY-MM-DD'),
       LAST_DAY(SYSDATE)
    FROM DUAL;
    
-- TO_CHAR : ������ ��ȯ
-- TO_NUMBER : ������ ��ȯ
-- TO_DATE : ��¥�� ��ȯ

SELECT SYSDATE,
       TO_CHAR(SYSDATE, 'MM') AS MM,
       TO_CHAR(SYSDATE, 'MON') AS MON,
       TO_CHAR(SYSDATE, 'MONTH') AS MONTH,
       TO_CHAR(SYSDATE, 'DD') AS DD, -- ��¥!!
       TO_CHAR(SYSDATE, 'DY') AS DY, -- ����!!
       TO_CHAR(SYSDATE, 'DAY') AS DAY -- DAY�� ���ڰ� �ƴ϶� ����!!!!
    FROM DUAL;
    
--Ư�� ���� ����ϱ�
-- 'NLS_DATE_LANGUAGE = KOREAN'
SELECT SYSDATE,
       TO_CHAR(SYSDATE, 'MM') AS MM,
       TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR,
       TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
       TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG
    FROM DUAL;

--���� �����Ϳ� ���� �����ϱ�
SELECT SAL,
       TO_CHAR(SAL, '$999,999') AS SAL_$,
       TO_CHAR(SAL, 'L999,999') AS SAL_L, -- LOCAL : ��ȭ ǥ��
       TO_CHAR(SAL, '999,999.00') AS SAL_1, -- �Ҽ��� ���ڸ����� ǥ��
       TO_CHAR(SAL, '000,999,999.00') AS SAL_2, -- 9�� ������ ����, 0�� 0���� ä��!
    FROM EMP;
    
-- ���� �����͸� ��¥ �����ͷ� ��ȯ�ϱ�
SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE1,
       TO_DATE('20180714', 'YYYY-MM-DD') AS TODATE2 -- PANDAS�� �ٸ�!!
    FROM DUAL; -- ���� FORMAT������ �ƴ϶�, �ٲ� FORMAT�� ����!!!!
    
-- 1981�� 6�� 1�� ���� �Ի��� ������� ����
SELECT *
    FROM EMP
   WHERE HIREDATE > TO_DATE('19810601');