# ��ҹ��� ���� ���� ����(�� ��й�ȣ�� ������)
# CREATE : ���� / ALTER : ���� / DROP : ����/ DELETE : ����

# ����Ŭ ������ ����Ǹ鼭 ����� ���� �� C## ���ڸ� �־ ���鵵�� ���� ��
# JAVADB => C##JAVADB �̷� ����� C##�� ������� �ʰ���
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

# User ������ sys, system �� ����
# User ���� ( ���� �Ҵ� )
# CREATE USER ������̸� IDENTIFIED BY ��й�ȣ
CREATE USER JAVADB IDENTIFIED BY 12345
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

# GRANT : ���� �ο� (����� ������ �ؼ��� �ƹ��͵� �� �� ����)
GRANT CONNECT, RESOURCE TO JAVADB;


CREATE USER JAVADB IDENTIFIED BY TIGER
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;
-- SCOTT ���� �ο��� ����
GRANT CONNECT, RESOURCE TO SCOTT;
-- �� ���� ���� �ο�
GRANT CREATE VIEW TO SCOTT;
-- SYNONYM ���� ���� �ο�
GRANT CREATE SYNONYM TO SCOTT;
GRANT CREATE PUBLIC SYNONYM TO SCOTT;



SELECT * FROM ALL_USERS;

GRANT 