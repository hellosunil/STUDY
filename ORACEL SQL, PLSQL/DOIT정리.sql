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