# ��ҹ��� ���� �� ������, �ٸ� ���α׷��� ������ ������ ���� ���� �빮�� ���
DESC EMP;
DESC DEPT;
DESC SALGRADE;

# SELECTION�� �� ������ ���� FROM�� ��ȸ�� ���̺� ���� ���
# PROJECTION�� �� ������ ����
# SELECTION�� PROJECTION ���ÿ� ����Ͽ� ��/�� ������ ����
# JOIN�� ���̺� �� ����

# EMP ���̺� ��ü �� ��ȸ�ϱ�

SELECT * FROM EMP;

SELECT EMPNO, ENAME, DEPTNO
    FROM EMP;
# SELECT���� ��� ������ �������� ���� ==> ORDER BY ����Ͽ� ���� ����

SELECT EMPNO, DEPTNO
    FROM EMP;
    
# DISTINCT�� �ߺ����� �����ϴ� �� ���
SELECT DEPTNO
    FROM EMP;

# ���� �� �� �� �� �ߺ��� ����
SELECT DISTINCT DEPTNO
    FROM EMP;
    
# ���� ���� ���϶� �ߺ��� ����
SELECT DISTINCT JOB, DEPTNO
    FROM EMP;
==> (JOB, DEPTNO) ������ �ߺ����� �Ǵ�

# ��� �̱�
SELECT ALL JOB, DEPTNO
    FROM EMP;
    
# ��Ī ����ϱ�(���� �̸��� �ӽ÷� ����) SAL=����, COMM=�߰� ����
SELECT ENAME, SAL, SAL*12+COMM, COMM
    FROM EMP;
# �̶�, COMM = NULL�̸� �ƿ� ��µ��� ����

# ��Ī�� �����ϴ� ���
# 1. SAL*12+COMM ANNSAL
# 2. SAL*12+COMM "ANNSAL"
# 3. SAL*12+COMM AS ANNSAL
# 4. SAL*12+COMM AS "ANNSAL"
# �ٸ� ���α׷��� ������ ȣȯ�� ���� 3������ ���� ���

SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
    FROM EMP;

# ���̺� �����ϱ� ORDER BY ==> SELECT���� ���� ������ �࿡ ��
SELECT [��], [��2], ..., [��N]
    FROM [���̺�]
    ...[�� ���� ��]
    ORDER BY [�����Ϸ��� ��(������ ����)][���Ŀɼ�];
                        # ASC(��������), DESC(��������)

# ��������(ASC) ����ϱ�(���������� �⺻)
SELECT *
    FROM EMP
    ORDER BY SAL;

# �����ȣ �������� �������� �����ϱ�    
SELECT *
    FROM EMP
    ORDER BY EMPNO DESC;
    
# ������ ���� ���������� �ø����� ���ÿ� ����ϱ�
# 1���� ���� ��, 2���� ���� ���
SELECT *
    FROM EMP
    ORDER BY DEPTNO ASC, SAL DESC;
    
# ORDER BY�� �ð����⵵�� ũ�Ƿ� �ظ��ϸ� ������� �ʴ� ���� ����

# Q2 92P
SELECT DISTINCT JOB
    FROM EMP;
    
# Q3 92P
SELECT EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME,
    DEPTNO AS DEPARTMENT_NO
    FROM EMP
    ORDER BY DEPTNO DESC, ENAME ASC;
    
# �ʿ� �����͸� ����ϴ� WHERE

SELECT *
    FROM EMP
    WHERE DEPTNO = 30;
    
SELECT *
    FROM EMP
    WHERE EMPNO = 7782;
    
# WHERE ���� ���ǽ��� �־��ָ� ��

SELECT *
    FROM EMP
    WHERE DEPTNO = 30 
    AND JOB ='SALESMAN';
    # WHERE �������� �� �����Ͱ� ���ڿ��� ��� '' ����� ��

SELECT *
    FROM EMP
    WHERE DEPTNO = 30 
    OR JOB = 'CLERK';
    
# ���� �����ڸ� ����� WHERE��
SELECT *
    FROM EMP
    WHERE SAL * 12 >= 36000;
    
SELECT *
    FROM EMP
    WHERE SAL >= 2500
    AND JOB = 'ANALYST';
    
# ���ڿ��� �� �����ڷ� ���ϱ�

SELECT *
    FROM EMP
    WHERE ENAME >= 'F';
    # �̸� ù ���ڰ� F�ų� ������ �͸� ���

SELECT *
    FROM EMP
    WHERE ENAME <= 'FORZ';
    
# � �� ������ =, !=

SELECT *
    FROM EMP
    WHERE SAL != 3000;
    
SELECT *
    FROM EMP
    WHERE NOT SAL = 3000;
    # NOT�� ���, ���ǹ� �տ� �´�!

# IN ������

SELECT *
    FROM EMP
    WHERE JOB = 'MANAGER'
    OR JOB = 'SALESMAN'
    OR JOB = 'CLERK';

# IN �����ڸ� �Ἥ �����ϰ� ǥ���ϱ�
SELECT *
    FROM EMP
    WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');

SELECT *
    FROM EMP
    WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

SELECT *
    FROM EMP
    WHERE DEPTNO IN (10, 20);
    
# BETWEEN A AND B ������

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
    
# LIKE �����ڴ� �Ϻ� ���ڿ��� ���Ե� �����͸� ��ȸ

SELECT *
    FROM EMP
    WHERE ENAME LIKE 'S%';
    
# _ : � ���̵� ������� �� ���� ���� �����͸� �ǹ�
# % : ���̿� �������(���� ���� ��쵵 ����) ��� ���� �����͸� �ǹ�

# ��� �̸��� �� ��° ���ڰ� L�� ����� ����ϱ�

SELECT *
    FROM EMP
    WHERE ENAME LIKE '_L%';
    # L �տ� �� �ϳ��� ���ڰ� �;���
    
SELECT *
    FROM EMP
    WHERE ENAME LIKE '__L%';
    # L �տ� �� �ΰ��� ���ڰ� �;���
    # %�� �ڿ� � ������ ���ڰ� �� ���� ������ ��� ����
    
# ��� �̸��� AM�� ���ԵǾ� �ִ� ��� �����͸� ����ϱ�

SELECT *
    FROM EMP
    WHERE ENAME LIKE '%AM%';
    
SELECT *
    from EMP
    WHERE ENAME NOT LIKE '%AM%';
    
# ���ϵ� ī�� ���ڰ� �������� �Ϻ��� ��� ==> ESCAPE
# A_A ���ڿ��� ������ �ִ� ������ ã��

SELECT *
    FROM SOME_TABLE
    WHERE SOME_COLUMN LIKE 'A\_A%' ESCAPE '\';
    
# NULL ���� ���� �� ����ϱ�

SELECT *
    FROM EMP
    WHERE COMM IS NULL;
    
# ���� ����� �ִ� ��� �����͸� ����ϱ�

SELECT *
    FROM EMP
    WHERE MGR IS NOT NULL;

# AND �����ڿ� IS NULL ������ ����ϱ�

SELECT *
    FROM EMP
    WHERE SAL > NULL
    AND COMM IS NULL;
    
SELECT *
    FROM EMP
    WHERE SAL > NULL
    OR COMM IS NULL;

# ���տ�����(UNION) ����Ͽ� ����ϱ�

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
    
## UNION ���� ������! ==> ��� ���� ������ �ڷ����� ���ƾ� ��

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION
SELECT SAL, JOB, DEPTNO, SAL
    FROM EMP
    WHERE DEPTNO = 20;
# ==> ����� �̻������� �� ������ �ڷ����� ���� ������ ���� ���� ���!

# ���� �������� ���� �� ���
# UNION : ������ // �ߺ����� ���ŵ�
# UNION ALL : ������ // �ߺ����� �ߺ� ǥ��
# MINUS : ������
# INTERSECT : ������

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION ALL # UNION�� ���ٸ� �ѹ�����, UNION ALL�� ���� �ι��� �ݺ��ؼ� ��� ���
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


# ������ ó���� ������ ���� ����Ŭ �Լ� ����ϱ�
# ���� �Լ��� ����
# ������ �Լ� : �ະ�� �Լ� ó��
# ������ �Լ� : ���� �࿡ �Լ��� ���ÿ� ó���Ǿ� ���� �� ���

# ���� �����͸� �����ϴ� ���� �Լ�

# ��ҹ��ڸ� �ٲٴ� UPPER, LOWER, INITCAP
# UPEER(���ڿ�) : ���ڿ� ��θ� �빮�ڷ� ��ȯ
# LOWER(���ڿ�) : ���ڿ� ��θ� �ҹ��ڷ� ��ȯ
# INITCAP(���ڿ�) : ù���ڴ� �빮�ڷ�, �������� �ҹ��ڷ� ��ȯ

SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
    FROM EMP;
    
# Ȱ�� : ���ڿ� �����ʹ� ��ҹ��ڸ� �����ϱ� ������ ���ڿ� �����͸� ã�� �� �̿�

SELECT *
    FROM EMP
    WHERE UPPER(ENAME) = UPPER('SCOTT');
    
SELECT *
    FROM EMP
    WHERE UPPER(ENAME) LIKE UPPER('%SCOTT%');

# ��� �̸��� ��� �빮�ڷ� ���    
SELECT UPPER(ENAME)
    FROM EMP;
    
# ���ڿ��� ���̸� ���ϴ� LENGTH �Լ�

SELECT ENAME, LENGTH(ENAME)
    FROM EMP;
    
# WHERE ������ LENGTH �Լ� ����ϱ�

SELECT ENAME, LENGTH(ENAME)
    FROM EMP
    WHERE LENGTH(ENAME) >= 5;

# LENGTH �Լ��� LENGTHB �Լ�

SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�')
    FROM DUAL;
    
# ��å�̸��� 6���� �̻��� �����͸� ���

SELECT *
    FROM EMP
    WHERE LENGTH(JOB) >= 6;
    
# ���ڿ� �Ϻθ� �����ϴ� SUBSTR �Լ�

# SUBSTR(���ڿ� ������, ���� ��ġ, ���� ����)
# SUBSTR(���ڿ� ������, ���� ��ġ) : ������ġ ~ ������ ���

SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
    FROM EMP;

SELECT SUBSTR(ENAME, 3)
    FROM EMP;
    
# SUBSTR �Լ� �ȿ� �ٸ� �Լ� �Բ� ����ϱ�
SELECT JOB,
    SUBSTR(JOB, -LENGTH(JOB)),
    SUBSTR(JOB, -LENGTH(JOB), 2),
    SUBSTR(JOB, -3)
    FROM EMP;
    
# ���ڿ� ������ �ȿ��� Ư�� ������ ��ġ�� ã�� INSTR�Լ�

SELECT INSTR('HELLO, ORACLE', 'L') AS INSTR_1,
    INSTR('HELLO, ORACLE', 'L', 5) AS INSTR_2, #�� ��° ����
    INSTR('HELLO, ORACLE', 'L', 2, 2) AS INSTR_3 # �� ��° L
    FROM DUAL;

# Ư�� ���ڸ� �����ϰ� �ִ� �� ã��
# INSTR�Լ��� ��� �̸��� ���� S�� �ִ� �� ���ϱ�

SELECT *
    FROM EMP
    WHERE INSTR(ENAME, 'S') > 0;
    
SELECT *
    FROM EMP
    WHERE ENAME LIKE '%S%';
    
# Ư�� ���ڸ� �ٸ� ���ڿ��� �ٲٴ� REPLACE�Լ�

SELECT '010-1234-5678' AS REPLACE_BEFORE,
    REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
    REPLACE('010-1234-5678', '-') AS REPLACE_2
    FROM DUAL;