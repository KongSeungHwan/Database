-- 4. �̸�(FIRST_NAME)�� M ���� �����ϴ� ����� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE 'M%'; 
SELECT FIRST_NAME,SALARY FROM EMPLOYEES WHERE FIRST_NAME LIKE '_a%';
SELECT CITY FROM LOCATIONS ORDER BY CITY;
-- 5. �̸�(FIRST_NAME)�� �� ��° ���ڰ� 'a'�� ����� �̸�(FIRST_NAME)�� ������ ��ȸ�϶�.

-- 6. ���� ���� �������� �����϶�.

-- 7. �μ� ���� �������� �����϶�.
SELECT DEPARTMENT_NAME FROM DEPARTMENTS ORDER BY DEPARTMENT_NAME DESC;
-- 8. ������ 7000 �̻��� ������� ��� ������ ������(��������)���� �����϶�.
SELECT * FROM EMPLOYEES WHERE SALARY >=7000 ORDER BY SALARY ASC;
-- 9. �μ�Ƽ��(COMMISSION_PCT)�� ���� �ʴ� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NULL;
-- 10. �μ�Ƽ��(COMMISSION_PCT)�� �޴� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL;
-- 11. 2007�� 06�� 21�Ͽ� �Ի��� ����� �����ȣ, �̸�(FIRST_NAME, LAST_NAME) 
--      �׸��� �μ���ȣ�� ��ȸ�϶�.
SELECT EMPLOYEE_ID,FIRST_NAME, LAST_NAME,DEPARTMENT_ID FROM EMPLOYEES WHERE TO_DATE('07/06/21')=HIRE_DATE;
-- 12. 2006�⿡ �Ի��� ����� �����ȣ�� �Ի����� ��ȸ�϶�.**
--SELECT EMPLOYEE_ID,HIRE_DATE FROM EMPLOYEES WHERE 
-- 13. �̸�(FIRST_NAME)�� ���̰� 5���� �̻��� ����� ��ȸ�϶�.
SELECT FIRST_NAME FROM EMPLOYEES WHERE LENGTH(FIRST_NAME)>=5;
-- 14. �μ���ȣ�� ������� ��ȸ�϶�. (�μ���ȣ �������� ����)
SELECT DEPARTMENT_ID,COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID ASC;
-- 15. ���� ���̵� ��� ������ ��ȸ�϶�. (���� ���̵� �������� ����)
SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES GROUP BY JOB_ID ORDER BY JOB_ID DESC;
-- 16. ��簡 �ִ� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE MANAGER_ID IS NOT NULL;
-- 17. ��簡 ���� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE MANAGER_ID IS NULL;
-- 18. ��� ������� �����ȣ, �̸�(FIRST_NAME, LAST_NAME), �μ���ȣ 
--   �׸��� �μ����� ��ȸ�϶�.
SELECT E.EMPLOYEE_ID,E.FIRST_NAME, E.LAST_NAME,E.DEPARTMENT_ID,D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D ON  E.DEPARTMENT_ID = D.DEPARTMENT_ID;
-- 19. ��� �μ��� �μ���� ���ø��� ��ȸ�϶�.
SELECT D.DEPARTMENT_ID,D.DEPARTMENT_NAME,L.CITY FROM DEPARTMENTS D JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID;
-- 20. ��� ������� �����ȣ, �μ���, �������� ��ȸ�϶�.
SELECT E.EMPLOYEE_ID,D.DEPARTMENT_NAME,J.JOB_TITLE FROM EMPLOYEES E JOIN DEPARTMENTS D ON  E.DEPARTMENT_ID = D.DEPARTMENT_ID JOIN JOBS J ON E.JOB_ID=J.JOB_ID;
-- 21. ��� ������� �����ȣ, �μ���, ������, ���ø��� ��ȸ�϶�.
SELECT E.EMPLOYEE_ID,D.DEPARTMENT_NAME,E.JOB_ID,CITY FROM EMPLOYEES E JOIN DEPARTMENTS D ON  E.DEPARTMENT_ID = D.DEPARTMENT_ID JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID;
-- 22. 10��, 20��, 30�� �μ����� �ٹ��ϴ� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IN(10,20,30);
-- 23. 6�� �̸��� ����� �ٹ��ϴ� �μ��� �̸��� ��ȸ�϶�.
SELECT DISTINCT D.DEPARTMENT_NAME FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID WHERE(SELECT COUNT(*)
                                                                                                                FROM EMPLOYEES EM
                                                                                                                WHERE E.DEPARTMENT_ID=EM.DEPARTMENT_ID)<=6;
-- 24. 4�� �̸��� ����� �ٹ��ϴ� �μ��� ��� ������ �μ����� ��ȸ�϶�.
SELECT ROUND(AVG(SALARY),2),DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME;
-- 25. IT �μ��� ���� ������ ��ȸ�϶�.
SELECT SUM(SALARY) 
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
WHERE DEPARTMENT_NAME='IT';
-- 26. �����(REGIONS)�� ������ ������ ��ȸ�϶�.
SELECT R.REGION_NAME, COUNT(L.CITY)
FROM LOCATIONS L JOIN COUNTRIES C ON L.COUNTRY_ID =C.COUNTRY_ID JOIN REGIONS R ON C.REGION_ID=R.REGION_ID
GROUP BY R.REGION_NAME;
-- 27. ���ø� �� �μ��� ������ ��ȸ�϶�.
SELECT L.CITY,COUNT(D.DEPARTMENT_ID)
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID
GROUP BY L.CITY;
-- 28. �μ��� �������� �ʴ� ���ø� ��ȸ�϶�.
SELECT L.CITY
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID
GROUP BY L.CITY HAVING COUNT(D.DEPARTMENT_ID)=0;
-- 29. ����� �������� �ʴ� ������ ��ȸ�϶�.
SELECT L.CITY
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID JOIN COUNTRIES C USING(COUNTRY_ID)
GROUP BY L.CITY HAVING COUNT(E.EMPLOYEE_ID)=0;
-- 30. 150�� ������� ���� �Ի��� ��� �� ���� �ֽſ� �Ի��� ����� ��� ������ ��ȸ�϶�.*****
SELECT *
FROM EMPLOYEES A 
WHERE A.EMPLOYEE_ID<>150 AND (A.HIRE_DATE-(SELECT B.HIRE_DATE
                                            FROM EMPLOYEES B
                                            WHERE B.EMPLOYEE_ID=150))>=0 
                                            ORDER BY A.HIRE_DATE ASC;
-- 31. ������ ��ȯ�� �̷��� �ִ� ����� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES E JOIN JOB_HISTORY H USING(EMPLOYEE_ID) WHERE E.JOB_ID<>H.JOB_ID;
-- 32. �μ��� �޴������� �ִ� ����� ��� ������ �μ����� ��ȸ�϶�.
SELECT *
FROM EMPLOYEES E JOIN DEPARTMENTS D USING(DEPARTMENT_ID)
WHERE E.EMPLOYEE_ID IN(SELECT MANAGER_ID
                        FROM DEPARTMENTS);
-- 33. �ٸ� ����� ����� ����� ��� ������ ��ȸ�϶�.
SELECT *
FROM EMPLOYEES E JOIN DEPARTMENTS D USING(DEPARTMENT_ID)
WHERE E.EMPLOYEE_ID IN(SELECT MANAGER_ID
                        FROM EMPLOYEES
                        GROUP BY MANAGER_ID)
                        ORDER BY DEPARTMENT_ID;
-- 34. �̸�(FIRST_NAME)�� C�� �����ϰ� s�� ������ 
--    ����� �μ���, ������, ���ø�, ������, ������� ��ȸ�϶�.
SELECT DEPARTMENT_NAME,JOB_TITLE,COUNTRY_NAME,REGION_NAME
FROM EMPLOYEES JOIN DEPARTMENTS USING(DEPARTMENT_ID) JOIN JOBS USING(JOB_ID) JOIN LOCATIONS USING(LOCATION_ID) JOIN COUNTRIES USING(COUNTRY_ID) JOIN REGIONS USING(REGION_ID)
WHERE FIRST_NAME LIKE 'C%s';

-- 35. ������ ��ȯ�� �̷��� ���� ����� ��� ������ ��ȸ�϶�.
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID NOT IN(SELECT EMPLOYEE_ID
                        FROM JOB_HISTORY);
-- 36. �ڽ��� ��簡 �ڽ� ���� �ʰ� �Ի��� ����� ��� ������ ��ȸ�϶�.
SELECT *
FROM EMPLOYEES A
WHERE HIRE_DATE <(SELECT HIRE_DATE
                FROM EMPLOYEES B
                WHERE A.MANAGER_ID=B.EMPLOYEE_ID);
-- 37. 100�� ����� ���� ���� �ΰ� �ִ� ������� ��� ������ ��ȸ�϶�.
SELECT *
FROM EMPLOYEES
WHERE MANAGER_ID = 100;
-- 38. 100�� ����� ���� �ΰ� �ִ� ��� ������� ��� ������ ��ȸ�϶�. ������ ���� �̿�!
SELECT *
FROM EMPLOYEES
START WITH MANAGER_ID =100
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID
ORDER BY SALARY;

SELECT *
FROM EMPLOYEES e1, EMPLOYEES e2
WHERE e1.EMPLOYEE_ID = e2.MANAGER_ID AND e2.MANAGER_ID = 100
ORDER BY e1.SALARY;


-- 38-1. 112�� ����� ������ ��� ��ȸ�ض�
SELECT  *
FROM    EMPLOYEES 
START   WITH EMPLOYEE_ID = 112
CONNECT BY PRIOR MANAGER_ID = EMPLOYEE_ID;
-- 38-2. 150�� ����� ��� ������ �̸��� �μ����� ��ȸ�϶�
SELECT  E.FIRST_NAME,E.LAST_NAME,D.DEPARTMENT_NAME
FROM    EMPLOYEES E JOIN DEPARTMENTS D USING(DEPARTMENT_ID) 
START   WITH E.EMPLOYEE_ID = 150
CONNECT BY PRIOR E.MANAGER_ID = E.EMPLOYEE_ID;
-- 39. ������� ���� ���� ������ �̸��� ��ȸ�϶�.
SELECT CITY
FROM (SELECT L.CITY
FROM EMPLOYEES E JOIN DEPARTMENTS E USING(DEPARTMENT_ID)JOIN LOCATIONS L USING(LOCATION_ID) JOIN COUNTRIES C USING(COUNTRY_ID)
GROUP BY L.CITY
ORDER BY COUNT(*) DESC)
WHERE ROWNUM=1;
-- 40. ������ ������ ���� ���� �μ��� �̸��� ��ȸ�϶�.
SELECT DEPARTMENT_NAME
FROM(SELECT DEPARTMENT_NAME
FROM EMPLOYEES JOIN DEPARTMENTS USING(DEPARTMENT_ID)
GROUP BY DEPARTMENT_NAME
ORDER BY COUNT(JOB_ID) DESC
)
WHERE ROWNUM=1;
-- 41. ��� ������ �ִ� ������ �ް� �ִ� ������� ��� ������ ��ȸ�϶�.
SELECT *
FROM EMPLOYEES E JOIN JOBS J USING(JOB_ID)
WHERE E.SALARY=J.MAX_SALARY;

SELECT EA.*
FROM(
SELECT J.JOB_ID A, MAX(E.SALARY) B
FROM EMPLOYEES E JOIN JOBS J ON E.JOB_ID=J.JOB_ID
GROUP BY J.JOB_ID
),EMPLOYEES EA
WHERE EA.SALARY=B AND EA.JOB_ID=A;

-- 42. ��� ������ �ּ� ������ �ް� �ִ� ������� ��� ������ ��ȸ�϶�.
SELECT EA.*
FROM(
SELECT J.JOB_ID A,MIN(E.SALARY) B
FROM EMPLOYEES E JOIN JOBS J ON E.JOB_ID=J.JOB_ID
GROUP BY J.JOB_ID
),EMPLOYEES EA
WHERE EA.SALARY=B AND EA.JOB_ID=A;
-- 43. �μ��� ������ �ִ뿬��, �ּҿ���, ������� ��ȸ�϶�.
SELECT D.DEPARTMENT_NAME,J.JOB_ID A,MAX(SALARY), MIN(E.SALARY),COUNT(*) COUN
FROM EMPLOYEES E JOIN JOBS J ON E.JOB_ID=J.JOB_ID JOIN DEPARTMENTS D ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME,J.JOB_ID
ORDER BY D.DEPARTMENT_NAME;

-- 44. ������� ���� ���� ���ÿ��� �ٹ��ϴ� ��� ������� ���� ������ ��ȸ�϶�.
    SELECT CITY,SU
    FROM(SELECT L.CITY,SUM(E.SALARY) SU
    FROM EMPLOYEES E JOIN DEPARTMENTS D USING(DEPARTMENT_ID) JOIN LOCATIONS L USING(LOCATION_ID)
    GROUP BY L.CITY
    ORDER BY COUNT(*) DESC
    )
    WHERE ROWNUM=1;
    
-- 45. ������� ���� ���� ���ÿ��� �ٹ��ϴ� ��� ������� �μ��� �� ������ ��� ������ ��ȸ�϶�.
SELECT CITY,SU
    FROM(SELECT L.CITY,D.DEPARTMENT_NAME,JOB_ID
    FROM EMPLOYEES E JOIN DEPARTMENTS D USING(DEPARTMENT_ID) JOIN LOCATIONS L USING(LOCATION_ID)
    GROUP BY L.CITY,D.DEPARTMENT_NAME,JOB_ID
    ORDER BY COUNT(*) DESC
    )
    WHERE ROWNUM=1;
-- 46. �Ի����� ���� ������ ����� ��ȸ�϶�.

-- 47. �Ի����� ���� �ֱ��� ����� ��ȸ�϶�.

-- 48. ���� �ֱٿ� �Ի��� ����� ���� �������� �Ի��� ����� ������ ����� ��ȸ�϶�.

-- 49. ���� �ֱٿ� �Ի��� ����� ���� �������� �Ի��� ����� �ð����� ����� ��ȸ�϶�.

-- 50. ������ 12000 �̻�Ǵ� �������� LAST_NAME �� ������ ��ȸ�Ѵ�.

-- 51. �����ȣ�� 176 �� ����� LAST_NAME �� �μ� ��ȣ�� ��ȸ�Ѵ�.

-- 52. ������ 5000 ���� 12000�� ���� �̿��� ������� LAST_NAME �� ������ ��ȸ����.

-- 53. 2000/02/20 �Ϻ��� 2010/05/01 ���̿� ���� ������� LAST_NAME ���, ������ڸ� ��ȸ�Ѵ�.

-- 54. 20 �� �� 50 �� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� 
--   �μ� ��ȣ�� ���ĺ������� ��ȸ�Ѵ�.

-- 55. 20 �� �� 50 �� �μ��� �ٹ��ϸ�, ������ 5000 ~ 12,000 ������ 
--   ������� LAST_NAME �� ������ ��ȸ�Ѵ�.

-- 56. 2005�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ѵ�.

-- 57. �Ŵ����� ���� ������� LAST_NAME �� JOB_ID �� ��ȸ�Ѵ�.

-- 58. �Ŵ����� �ִ� ������� LAST_NAME �� JOB_ID �� ��ȸ�Ѵ�.

-- 59. Ŀ�̼��� ���� ��� ������� LAST_ANME, ���� �� Ŀ�̼��� ��ȸ�Ѵ�.
--    ���� ����, Ŀ�̼� �������� �����Ѵ�.

-- 60. LAST_NAME �� �׹�° ���ڰ� a �� ������� LAST_NAME �� ��ȸ�Ѵ�.

-- 61. LAST_NAME �� a ��(OR) e ���ڰ� �ִ� ������� LAST_NAME �� ��ȸ�Ѵ�.

-- 62. ������ 2,500, 3,500, 7000 �� �ƴϸ� 
-- ������ SA_REP �̳� ST_CLERK �� ������� ��ȸ�Ѵ�.

-- 63.  ������ AD_PRESS �� ����� A �����, 
--  ST_MAN �� ����� B �����, IT_PROG �� ����� C �����,
--  SA_REP �� ����� D �����, ST_CLERK �� ����� E ����� 
--  ��Ÿ�� 0 �� �ο��Ͽ� ��ȸ�Ѵ�.

-- 64. ��� ������� LAST_NAME, �μ� �̸� �� �μ� ��ȣ�� ��ȸ�Ѵ�.

-- 65. �μ���ȣ 30 ���� ��� �������� ������ �������� ��ȸ�Ѵ�. 90 �μ� ���� �����Ѵ�.

-- 66. Ŀ�̼��� ���� ��� ������� LAST_NAME, �μ� ��, ���� ID �� ���� ���� ��ȸ�Ѵ�.

-- 66-1. �þ�Ʋ�� ��� ��� �� Ŀ�̼��� ���� ��� ������� LAST_NAME, �μ� ��, ���� ID �� ���� ���� ��ȸ�Ѵ�.

-- 67. LAST_NAME �� DAVIES �� ������� �Ŀ� ���� ������� LAST_NAME �� HIRE_DATE �� ��ȸ�Ѵ�.

-- 68. �ڽ��� �Ŵ������� ���� ���� ������� LAST_NAME �� ������� ��ȸ�Ѵ�.

-- 69. ȸ�� ��ü�� �ִ� ����, �ּ� ����, ���� �� �� �� ��� ������ �ڿ����� �����Ͽ� ��ȸ�Ѵ�.

-- 70. �� JOB_ID ��, �ִ� ����, �ּ� ����, ���� �� �� �� ��� ������ �ڿ����� �����Ͽ� ��ȸ�Ѵ�.

-- 71. ������ ������ ���� ������� �� ���� ��ȸ�Ѵ�.

-- 72. �Ŵ����� �ٹ��ϴ� ������� �� ���� ��ȸ�Ѵ�.

-- 73. �系�� �ִ� ���� �� �ּ� ������ ���̸� ��ȸ�Ѵ�.

-- 74. �Ŵ����� ��� �� �� �Ŵ��� �� ����� �� �ּ� ������ �޴� ����� ������ ��ȸ�Ѵ�.
--     �Ŵ����� ���� ������� �����Ѵ�.
--     �ּ� ������ 6000 �̸��� ���� �����Ѵ�.
--     ���� ���� �������� ��ȸ�Ѵ�.

-- 75. �μ� ��, ��ġ ID, �� �μ� �� ��� �� ��, �� �μ� �� ��� ������ ��ȸ�Ѵ�.
--     ��� ������ �Ҽ��� 2 �ڸ������� ǥ���Ѵ�.

-- 76. �� ��� �� �� 1995, 1996, 1997, 1998 �⵵ �� ���� ������� �� ���� ������ ���� ��ȸ�Ѵ�.

-- 77.  �� �μ��� �� ���� �� ���� �� �� �� �� �μ��� ���� �� ���� ��ȸ�Ѵ�. 

-- 78. LAST_NAME �� Zlotkey �� ������ �μ��� �ٹ��ϴ� ��� ������� ��� �� ��볯¥�� ��ȸ�Ѵ�.
--     ��������� Zlotkey �� �����Ѵ�.

-- 79. ȸ�� ��ü ��� �������� �� �޴� ������� ��� �� LAST_NAME �� ��ȸ�Ѵ�.

-- 80. LAST_NAME �� u �� ���ԵǴ� ������ ���� �μ��� �ٹ��ϴ� ������� ��� �� LAST_NAME �� ��ȸ�Ѵ�.

-- 81. (VIEW �̿�) LAST_NAME �� u �� ���ԵǴ� ������ ���� �μ��� �ٹ��ϴ� ������� ��� �� LAST_NAME �� ��ȸ�Ѵ�.

-- 82. ��ġ ID �� 1700 �� �μ����� �ٹ��ϴ� ������� LAST_NAME, �μ� ��ȣ �� JOB_ID �� ��ȸ�Ѵ�.

-- 83. (VIEW �̿�)��ġ ID �� 1700 �� �μ����� �ٹ��ϴ� ������� LAST_NAME, �μ� ��ȣ �� JOB_ID �� ��ȸ�Ѵ�.

-- 84. King �� �Ŵ����� �ΰ� �ִ� ��� ������� LAST_NAME �� ������ ��ȸ�Ѵ�.

-- 85. EXECUTIVE �μ��� �ٹ��ϴ� ��� ������� �μ� ��ȣ, LAST_NAME, JOB_ID �� ��ȸ�Ѵ�.

-- 86. ȸ�� ��ü ��� ���� ���� �� ���� ����� �� LAST_NAME �� u �� �ִ� �������
--       �ٹ��ϴ� �μ����� �ٹ��ϴ� ������� ���, LAST_NAME �� ������ ��ȸ�Ѵ�.

-- 87. (VIEW �̿�)ȸ�� ��ü ��� ���� ���� �� ���� ����� �� LAST_NAME �� u �� �ִ� �������
--       �ٹ��ϴ� �μ����� �ٹ��ϴ� ������� ���, LAST_NAME �� ������ ��ȸ�Ѵ�.

-- 88. ST_CLERK �� ���� ID �� ���� ����� ���� �μ� ID �� ��ȸ�Ѵ�.
--       NULL ���� �����Ѵ�. (NOT EXISTS ���)

-- 89. ST_CLERK �� ���� ID �� ���� ����� �ִ� �μ� ID �� ��ȸ�Ѵ�.
--       NULL ���� �����Ѵ�. (NOT EXISTS ���)

-- 90. ��ġ�� �μ��� ���� ���� ID �� ���� �̸��� ��ȸ����.(NOT EXISTS ���)

-- 91. ��ġ�� �μ��� �ִ� ���� ID �� ���� �̸��� ��ȸ����.(EXISTS ���)

-- 92. ������ ������ ������ ������ �ִ� ������� ��� �� JOB_ID �� ��ȸ�Ѵ�.

-- 93. Ŀ�̼��� ���� ������� �μ��� ������ ������ ������� LAST_NAME, �μ� ��ȣ �� ������ ��ȸ�Ѵ�.

-- 94. ��ġ ID �� 1700 �� ������� ������ Ŀ�̼��� ������ ������� LAST_NAME, �μ� ��ȣ �� ������ ��ȸ�Ѵ�.

-- 95. LAST_NAME �� 'Kochhar' �� ����� ������ ���� �� Ŀ�̼��� ���� ������� LAST_NAME, �μ� ��ȣ �� ������ ��ȸ�Ѵ�.

-- 96. ���� ID �� SA_MAN �� ������� ���� �� �ִ� �ִ� ���� ���� ���� �޴� ������� LAST_NAME, JOB_ID �� ������ ��ȸ�Ѵ�.

-- 97. ���� �̸��� T �� �����ϴ� ������ ��� ������� ���, LAST_NAME �� �μ� ��ȣ�� ��ȸ�Ѵ�.

-- 98.  �� �μ��� ��� �������� �� �޴� ���Ϻμ� �ٹ��������
--      LAST_NAME, ����, �μ���ȣ �� �ش� �μ��� ��� ������ ��ȸ�Ѵ�.
--      ����� �μ��� ������ �������� �����Ѵ�.

-- 99. �ҼӺμ��� ��� �������� ���� ���� ������� last_name �� ��ȸ�Ѵ�.

-- 100. �� ��� �� �ҼӺμ����� �ڽź��� �ʰ� ���Ǿ����� ���� ���� ������ �޴� ����� �����ϴ� ��� ������� last_name �� ��ȸ�Ѵ�.

--101. ��å(Job Title)�� Sales Manager�� ������� �Ի�⵵�� �Ի�⵵(hire_date)�� ��� �޿��� ����Ͻÿ�. 
--   ��� �� �⵵�� �������� �������� �����Ͻÿ�. 

--102. �� ����(city)�� �ִ� ��� �μ� �������� ��ձ޿��� ��ȸ�ϰ��� �Ѵ�. 
--   ��ձ޿��� ���� ���� ���ú��� ���ø�(city)�� ��տ���, �ش� ������ �������� ����Ͻÿ�. 
--   ��, ���ÿ� �� ���ϴ� ������ 10�� �̻��� ���� �����ϰ� ��ȸ�Ͻÿ�.

--103. ��Public  Accountant���� ��å(job_title)���� ���ſ� �ٹ��� ���� �ִ� ��� ����� ����� �̸��� ����Ͻÿ�. 
--   (���� ��Public Accountant���� ��å(job_title)���� �ٹ��ϴ� ����� ��� ���� �ʴ´�.)      
--   �̸��� first_name, last_name�� �Ʒ��� �������� ���� ����Ѵ�.

--104. �ڽ��� �Ŵ������� ����(salary)�� ���� �޴� �������� ��(last_name)�� ����(salary)�� �� ���Ͻÿ�. 

--105. 2007�⿡ �Ի�(hire_date)�� �������� ���(employee_id), �̸�(first_name), ��(last_name), 
--   �μ���(department_name)�� ��ȸ�մϴ�.  
--   �̶�, �μ��� ��ġ���� ���� ������ ���, ��<Not Assigned>���� ����Ͻÿ�. 

--106. ������(job_title)�� ��Sales Representative���� ���� �߿��� ����(salary)�� 9,000�̻�, 10,000 ������ 
--   �������� �̸�(first_name), ��(last_name)�� ����(salary)�� ����Ͻÿ�

--107. �μ����� ���� ���� �޿��� �ް� �ִ� ������ �̸�, �μ��̸�, �޿��� ����Ͻÿ�. 
--   �̸��� last_name�� ����ϸ�, �μ��̸����� �������� �����ϰ�, 
--   �μ��� ���� ��� �̸��� ���� ���� �������� �����Ͽ� ����մϴ�. 

--108. EMPLOYEES ���̺��� �޿��� ���� �޴� ������� ��ȸ���� �� ���ó�� 6��°���� 10 ��°���� 
--   5���� last_name, first_name, salary�� ��ȸ�ϴ� sql������ �ۼ��Ͻÿ�.

--109. ����� �μ��� ���� ����(city)�� ��Seattle���� ����� �̸�, �ش� ����� �Ŵ��� �̸�, ��� �� �μ��̸��� ����Ͻÿ�. 
--   �̶� ����� �Ŵ����� ���� ��� ��<����>���̶�� ����Ͻÿ�. �̸��� last_name�� ����ϸ�, 
--   ����� �̸��� ������������ �����Ͻÿ�. 

--110. �� ����(job) ���� ����(salary)�� ������ ���ϰ��� �Ѵ�. ���� ������ ���� ���� �������� 
--    ������(job_title)�� ���� ������ ��ȸ�Ͻÿ�. �� ���������� 30,000���� ū ������ ����Ͻÿ�. 

--111. �� ���(employee)�� ���ؼ� ���(employee_id), �̸�(first_name), ������(job_title), 
--    �μ� ��(department_name)�� ��ȸ�Ͻÿ�. 
--    �� ���ø�(city)�� ��Seattle���� ����(location)�� �μ� (department)�� �ٹ��ϴ� ������ �����ȣ �������������� ����Ͻÿ�.

--112. 2001~20003����̿� �Ի��� ������ �̸�(first_name), �Ի���(hire_date), �����ڻ�� (employee_id), 
--    ������ �̸�(fist_name)�� ��ȸ�մϴ�. ��, �����ڰ� ���� ��������� ��� ����� ���Խ��� ����Ѵ�.

--113. ��Sales�� �μ��� ���� ������ �̸�(first_name), �޿�(salary), �μ��̸�(department_name)�� ��ȸ�Ͻÿ�. 
--    ��, �޿��� 100�� �μ��� ��պ��� ���� �޴� ���� ������ ��µǾ�� �Ѵ�. 

--114. Employees ���̺��� �Ի��Ѵ�(hire_date)���� �ο����� ��ȸ�Ͻÿ�.

--115. �μ��� �������� �ִ�, �ּ�, ��ձ޿��� ��ȸ�ϵ�, 
--    ��ձ޿��� ��IT�� �μ��� ��ձ޿����� ����, ��Sales�� �μ��� ��պ��� ���� �μ� ������ ����Ͻÿ�. 

--116. �� �μ����� ������ �Ѹ� �ִ� �μ��� ��ȸ�Ͻÿ�. 
--    ��, ������ ���� �μ��� ���ؼ��� ��<�Ż��μ�>����� ���ڿ��� ��µǵ��� �ϰ�,
--    ��°���� ������ ���� �μ����� �������� ���� ���ĵǾ���Ѵ�. 

--117. �μ��� �Ի���� �������� ����Ͻÿ�. 
--    ��, �������� 5�� �̻��� �μ��� ��µǾ�� �ϸ� ��°���� �μ��̸� ������ �Ѵ�.

--118. ����(country_name) �� ����(city)�� �������� ��ȸ�Ͻÿ�. 
--    ��, �μ��� �������� ���� ���� �� �ֱ� ������ 106���� ������ ����� �ȴ�. 
--    �μ������� ���� ������ ������� ���ø� ��ſ� ��<�μ�����>���� ��µǵ��� �Ͽ� 107�� ��� ��µǰ� �Ѵ�.

--119. �� �μ��� �ִ� �޿����� ���̵�(employee_id), �̸�(first_name), �޿�(salary)�� ����Ͻÿ�. 
--    ��, �ִ� �޿��ڰ� ���� �μ��� ��ձ޿��� ���������� ����Ͽ� ��ձ޿��� ���� �� �ְ� �� ��.

--120. Ŀ�̼�(commission_pct)�� �������� ��ȸ�Ͻÿ�. 
--    Ŀ�̼��� �Ʒ�������ó�� 0.2, 0.25�� ��� .2��, 0.3, 0.35�� .3 ���·� ��µǾ�� �Ѵ�. 
--    ��, Ŀ�̼� ������ ���� �����鵵 �ִ� �� Ŀ�̼��� ���� ���� �׷��� ��<Ŀ�̼� ����>���� ��µǰ� �Ѵ�.

--121. Ŀ�̼�(commission_pct)�� ���� ���� ���� ���� 4���� �μ���(department_name), 
--    ������ (first_name), �޿�(salary), Ŀ�̼�(commission_pct) ������ ��ȸ�Ͻÿ�. 
--    ��°���� Ŀ�̼� �� ���� �޴� ������ ����ϵ� ������ Ŀ�̼ǿ� ���ؼ��� �޿��� ���� ������ ���� ��� �ǰ� �Ѵ�.

--Q1 �μ���, ������(first_name),�޿�,Ŀ�̼� �÷��� ���� �並 �ۼ��Ͻÿ�.
--�� Ŀ�̼� ����Ʈ�� ���� ��� 0���� ��ȯ

--Q2 �μ���, ��å, ������, �Ի����� ���� �並 �ۼ��Ͻÿ�.

--Q3 �μ����̺��� �����Ͽ� �� ���̺��� ����� �� ���̺� ������ �÷��� �߰��ϰ� �ʱⰪ�� ������ �� 
--������ �Ի� �� ���� ������ �÷��� �����ϴ� Ʈ���Ÿ� �ۼ��Ͻÿ�

--Q4 �μ�ID�� �Է��ϸ� �μ����� ��ȯ�ϴ� �Լ��� �ۼ��Ͻÿ�.

--Q5 �μ�ID�� �Է��ϸ� �ش� �μ��� ���� ����� ����ϴ� ���ν����� �ۼ��Ͻÿ�.