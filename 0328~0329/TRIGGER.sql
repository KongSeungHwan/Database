/*CREATE OR REPLACE TRIGGER TRIG1
BEFORE INSERT OR UPDATE OR DELETE ON EMP_TRIG
BEGIN
    IF TO_CHAR(SYSDATE,'DY') IN ('��','��','��') THEN
        IF INSERTING THEN
            RAISE_APPLICATION_ERROR(-20000,'��� ���� �߰� �Ұ�');
        ELSIF UPDATING THEN
            RAISE_APPLICATION_ERROR(-20001,'��� ���� �߰� �Ұ�');
        ELSIF UPDATING THEN
            RAISE_APPLICATION_ERROR(-20002,'��� ���� �߰� �Ұ�');
        ELSE
            RAISE_APPLICATION_ERROR(-20003,'��� ���� �߰� �Ұ�');
        END IF;
    END IF;
END;
*/

INSERT INTO EMP_TRIG(EMPNO) VALUES(7777);
UPDATE EMP_TRIG SET ENAME='MIKE' WHERE EMPNO=7703;
DELETE FROM EMP_TRIG WHERE EMPNO=7703;

CREATE TABLE EMP_LOG(
    TABLENAME VARCHAR2(10),
    DML_TYPE VARCHAR2(10),
    EMPNO NUMBER(10),
    USER_NAME VARCHAR(10),
    CHANGE_DATE DATE
);

DELETE FROM EMP_TRIG WHERE DEPTNO=20;
INSERT INTO EMP_LOG(EMPNO) VALUES(7782);