
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
   
-- NULL ó�� �Լ� (NVL : NULL�Ͻ� �ٲ�, NVL2 : NULL�ƴҽ� AND NULL�Ͻ� �ٲ�)
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,
       NVL(COMM, 0),
       SAL+NVL(COMM, 0)
    FROM EMP;
SELECT EMPNO, ENAME, COMM,
       NVL2(COMM, 'O', 'X'),
       NVL2(COMM, SAL*12+COMM, SAL*12) AS ANNSAL
    FROM EMP;
    -- NVAL2(����, NULL�ƴҶ�, NULL�϶�)!!! ���� ����
    
-- PRACTICE
SELECT EMPNO,
       RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MASKING_EMPNO,
       ENAME,
       RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') AS MASKING_ENAME
    FROM EMP
   WHERE LENGTH(ENAME) >= 5
     AND LENGTH(ENAME) < 6;
     
SELECT EMPNO, ENAME, SAL,
       TRUNC(SAL / 21.5, 2) AS DAY_PAY,
       ROUND(SAL / 21.5 / 8, 1) AS TIME_PAY
    FROM EMP;
    
SELECT EMPNO, ENAME, MGR,
     CASE
        WHEN MGR IS NULL THEN '0000'
        WHEN MGR LIKE '75%' THEN '5555'
        WHEN MGR LIKE '76%' THEN '6666'
        ELSE 'MGR'
        END AS CHG_MGR
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

SELECT SUM(SAL), SUM(COMM) -- NULL���� �����ص� SUM()�� �۵�
    FROM EMP;

SELECT COUNT(*)
    FROM EMP;
    
-- �μ���ȣ�� 30�� ������
SELECT COUNT(*)
    FROM EMP
   WHERE DEPTNO = 30; -- COUNT()�� NULL���� ī��Ʈ���� ����!!!
   
-- MAX, MIN = ��¥�� ���� MAX�� ���� �ֱ�, MIN�� ���� ����
SELECT MAX(HIREDATE)
    FROM EMP
   WHERE DEPTNO = 20;
   
-- GROUP BY ��
SELECT AVG(SAL), DEPTNO
    FROM EMP
   GROUP BY DEPTNO; -- GROUP BY ������ ��Ī ������ �Ұ���!
   
-- ��Ī ������ ���ؼ� �ϳ��� ���� �� UNION����� ��
SELECT AVG(SAL), '10DEPT' AS DEPTNO FROM EMP WHERE DEPTNO = 10
UNION
SELECT AVG(SAL), '20DEPT' AS DEPTNO FROM EMP WHERE DEPTNO = 20
UNION
SELECT AVG(SAL), '30DEPT' AS DEPTNO FROM EMP WHERE DEPTNO = 30;

-- GROUP BY ���� ���� �ֱ�(HAVING ��)
-- ��� �޿��� 2000 �̻��� �׷��� ��å�� ��� �޿� ���ϱ�

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   WHERE AVG(SAL) >= 2000
  GROUP BY DEPTNO, JOB
  ORDER BY DEPTNO, JOB; -- ���� �߻�

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2500
   ORDER BY DEPTNO, JOB;
   
-- WHERE�� ������
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   WHERE SAL >= 2500
  GROUP BY DEPTNO, JOB
  ORDER BY DEPTNO, JOB;
  
-- GROUP BY ��ȭ �Լ� ROLLUP, CUBE �Լ�
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

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
   GROUP BY ROLLUP(DEPTNO, JOB)
   ORDER BY DEPTNO, JOB;
   
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
   GROUP BY CUBE(DEPTNO, JOB)
   ORDER BY DEPTNO, JOB;
   
-- ���� �μ����� �׷�ȭ�� ��, ROLLUP/CUBE ��� ����

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
   GROUP BY DEPTNO, ROLLUP(JOB)
   ORDER BY DEPTNO, JOB;

-- GOUPING SETS : ������ ��� ���� ���� ��׷����� ó���Ͽ� ����ϱ�
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   GROUP BY GROUPING SETS(DEPTNO, JOB) --DEPT�� SAL, JOB�� SAL�� ���
   ORDER BY DEPTNO, JOB;
   
-- LISTAGG �Լ� : �׸��� �����ִ� �����͸� ���η� ����
SELECT ENAME
    FROM EMP
   WHERE DEPTNO = 10;
   
SELECT DEPTNO, 
       LISTAGG(ENAME, ', ')
       WITHIN GROUP(ORDER BY SAL DESC) AS ENAMES -- ���� ���� ����
    FROM EMP
   GROUP BY DEPTNO;
   
-- PIVOT : ���� ���̺� ���� ���� �ٲ�
-- UNPIVOT : ���� ���̺� ���� ������ �ٲ�

-- ��å��, �μ��� �ְ� �޿��� 2���� ǥ ���·� ���
SELECT *
    FROM (SELECT DEPTNO, JOB, SAL
            FROM EMP)
   PIVOT(MAX(SAL) -- ���� ��µ� ������)
        FOR DEPTNO IN (10, 20, 30) -- FOR �����ٷ� ǥ���� ��, IN ����Ϸ��� ��
        )
   ORDER BY JOB; -- ���� �� ���� ����
-- PIVOT�� ���� ������ �����ٿ� �Ҵ�, �ƴ� ������ �ڵ������� �����ٷ� �Ҵ�Ǵ� ����!!!

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
   
-- PIVOT(��µ� ������ FOR ���� IN ����) ������ : ����


-- PRACTICE
SELECT DEPTNO,
       TRUNC(AVG(SAL)) AS AVG_SAL,
       MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL,
       COUNT(*) AS CNT
    FROM EMP
   GROUP BY DEPTNO
   ORDER BY DEPTNO DESC;
   
SELECT JOB, COUNT(*)
    FROM EMP
   GROUP BY JOB
  HAVING COUNT(*) >= 3;

SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
       DEPTNO,
       COUNT(*) AS CNT
    FROM EMP
   GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;
   
SELECT NVL2(COMM, 'O', 'X') AS EXIST_COMM,
       COUNT(*) AS CNT
    FROM EMP
   GROUP BY NVL2(COMM, 'O', 'X');
   
SELECT DEPTNO,
       TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
       COUNT(*) AS CNT,
       MAX(SAL) AS MAX_SAL
    FROM EMP
   GROUP BY ROLLUP(DEPTNO, TO_CHAR(HIREDATE, 'YYYY'));
   
-- JOIN �Լ� (���� ���̺��� �ϳ��� ��ġ��)
-- UNION : �� �� �̻��� SELECT���� ���η� ����
-- JOIN : �� �� �̻��� SELECT���� ���η� ����

SELECT *
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO
  ORDER BY EMPNO;
  
-- WHERE ���� ���ǽ� �߰��Ͽ� ����ϱ�

SELECT E.EMPNO, E.ENAME, 
       D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO
     AND SAL >= 3000
  ORDER BY D.DEPTNO, E.EMPNO;
  
-- �� ����
SELECT *
    FROM EMP E, SALGRADE S
   WHERE E.SAL BETWEEN S.LOSAL AND HISAL;
   
-- ��ü����
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1, EMP E2
   WHERE E1.MGR = E2.EMPNO;

-- � ���� JOIN ~ ON(����) > ���� ���� ������ִ� � ����
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       E.DEPTNO,
       D.DNAME, D.LOC
    FROM EMP E JOIN DEPT D ON(E.DEPTNO = D.DEPTNO) -- JOIN�Լ��� FROM���� ���ٴ� ��!!
   WHERE SAL <= 3000
  ORDER BY DEPTNO, E.EMPNO; -- ���� ����� ������, JOIN ~ ON(����)�� ���� ���� ��
  
-- �ܺ� ���� : �� ���̺��� KING������ ���� : KING�� ����ڰ� �����Ƿ�
-- ������, ����� ���� NULL�̾ ����ؾ� �� ���� ����

-- ���� �ܺ����� ����ϱ� : ���� ���� �������� ������ ���� ������ ���翩�ο� ������� ���
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1 LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
   ORDER BY E1.EMPNO;

-- ������ �ܺ����� ����ϱ� : ������ ���� �������� ���� ���� ������ ���翩�ο� ������� ���
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
   ORDER BY E1.EMPNO;

-- ��, ���������� ���� ����鵵 ��µ�

-- ��ü �ܺ�����
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1 FULL OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
   ORDER BY E1.EMPNO;
   
-- 3�� �̻��� ���̺� �����ϱ�
--FROM TABLE1 JOIN TABLE2 ON (���ǽ�)
--JOIN TABLE3 ON (���ǽ�)
--�׳� ���� �Ǵٸ� ���ǽ��� �������ָ� ��!

-- PRACTICE
SELECT E.DEPTNO, D.DNAME,
       TRUNC(AVG(SAL)) AS AVG_SAL
    FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
   GROUP BY E.DEPTNO, D.DNAME
   ORDER BY E.DEPTNO;
   
SELECT D.DEPTNO, D.DNAME, 
       E.EMPNO, E.ENAME, E.JOB, E.SAL
    FROM EMP E RIGHT OUTER JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
   ORDER BY D.DEPTNO, E.ENAME;
   
SELECT D.DEPTNO, D.DNAME,
       E.EMPNO, E.ENAME, E.MGR, E.SAL, E.DEPTNO, -- �ߺ��Ǹ� �ڵ����� _1�� �ٲ�
       S.LOSAL, S.HISAL, S.GRADE,
       E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
    FROM EMP E RIGHT OUTER JOIN DEPT D
                  ON (E.DEPTNO = D.DEPTNO)
                LEFT OUTER JOIN SALGRADE S
                  ON (E.SAL BETWEEN S.LOSAL AND S.HISAL)
                LEFT OUTER JOIN EMP E2
                  ON (E.MGR = E2. EMPNO)
   ORDER BY D.DEPTNO, E.EMPNO;
   
-- �������� JONES���� �޿��� ���� ����� ��ȸ
SELECT *
    FROM EMP
   WHERE SAL > (SELECT SAL
                    FROM EMP
                   WHERE ENAME = 'JONES')
   ORDER BY SAL;
   
-- �������������� ��� ��츦 �����ϰ�� ORDER BY���� ����� �� ����!
-- ���������� SELECT�������� ���������� SELECT���� ���� �ڷ����� ���� ������ �����ؾ� ��

-- ������ �������� : ������������ ��µǴ� �ܷΰ��� �ϳ��� ���
-- JONES�� ���� ���̶�� ������ ���������� ���� ����
-- ������ ���������� ����ؾ���
-- ������ ���������� �ַ� �񱳿����ڰ� ����

-- �������� �ȿ��� �Լ� ���
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL,
       D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
   WHERE E.DEPTNO = 20
     AND E.SAL > (SELECT AVG(SAL)
                    FROM EMP);
                    
-- IN �����ڿ� �Բ� �������� ����ϱ� : �� �μ��� �ְ� �޿��� �޴� ��� ����
SELECT *
    FROM EMP
   WHERE SAL IN (SELECT MAX(SAL)
                    FROM EMP
                   GROUP BY DEPTNO);
                   
-- ANY, ALL ������
-- ANY �ϳ��� �����ϸ� ���
-- ALL ��ΰ� �����ؾ� ���

SELECT *
    FROM EMP
   WHERE SAL > ANY (SELECT SAL
                        FROM EMP
                       WHERE DEPTNO =30);
-- 30�� �μ��� SAL �� ��� �� ������ ũ�� ���
-- 30�� �μ��� �ּ� �޿����� ���� �޿��� �޴� ��� ���� ���

SELECT *
    FROM EMP
   WHERE SAL > ALL (SELECT SAL
                        FROM EMP
                       WHERE DEPTNO = 30);
-- 30�� �μ��� SAL ��κ��� ũ�� ���
-- 30�� �μ��� �ִ� �޿����� ���� �޿��� �޴� ��� ���� ���

-- EXISTS ������ : �������� ������� �ϳ� �̻� �����ϸ� ���ǽ� ��� TRUE, ������ FALSE
SELECT *
    FROM EMP
   WHERE EXISTS (SELECT DNAME
                    FROM DEPT
                   WHERE DEPTNO = 10);
-- 10���μ��� �����ϹǷ� ��� �� ��� ==> ���� ������ ����

-- ���߿� �������� : �� ���� ���� �� �� ��
SELECT *
    FROM EMP
   WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL)
                            FROM EMP
                           GROUP BY DEPTNO);
-- DEPTNO�� ����, MAX(SAL)���� ���� ������� ����

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
    FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
         (SELECT * FROM DEPT) D
   WHERE E10.DEPTNO = D.DEPTNO;
-- ���� Ư�� ���̺��� ������ �� SELECT�ϴ� ���
-- ���̺� �� ������ �Ը� �ʹ� ũ�ų�, ���� �۾��� ���ʿ��� ���� �ʹ� ���� �� ���
-- �������� ������ ������ ���� �� WITH���� ��� (�ζ��� ��)

WITH
E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
D   AS (SELECT * FROM DEPT)

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO,
       D.DNAME, D.LOC
    FROM E10, D
   WHERE E10.DEPTNO = D.DEPTNO;
   
-- SELECT ������ ����ϴ� ��������(��Į�� ��������)
-- ��Į�� �������� = �ϳ��� ���ο� ���� �߰��Ǵ� ����
-- �ϳ��� ����� ��ȯ�ǵ��� �ۼ��ؾ� ��!(���� �߰��ǹǷ�)

SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL,
       (SELECT GRADE
            FROM SALGRADE
           WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
       DEPTNO,
       (SELECT DNAME
            FROM DEPT
           WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
    FROM EMP E;
    
-- PRACTICE
SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL,
       D.DEPTNO, D.DNAME
    FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
   WHERE E.JOB = (SELECT JOB
                    FROM EMP
                   WHERE ENAME = 'ALLEN');

SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
    FROM EMP E JOIN DEPT D
               ON (E.DEPTNO = D.DEPTNO)
               JOIN SALGRADE S
               ON (E.SAL BETWEEN S.LOSAL AND S.HISAL)
   WHERE SAL > (SELECT AVG(SAL)
                    FROM EMP)
  ORDER BY SAL DESC, EMPNO;
  
SELECT E.EMPNO, E.ENAME, E.JOB,
       D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
   WHERE E.DEPTNO = 10
   AND E.JOB NOT IN (SELECT JOB
                        FROM EMP
                       WHERE DEPTNO = 30);
                       
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
    FROM EMP E JOIN SALGRADE S 
                 ON (E.SAL BETWEEN S.LOSAL AND S.HISAL)
   WHERE SAL > (SELECT MAX(SAL)
                    FROM EMP
                   WHERE JOB = 'SALESMAN')
  ORDER BY EMPNO;
  
  