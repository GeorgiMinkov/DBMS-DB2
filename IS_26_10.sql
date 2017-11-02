set schema db2admin;

-- TASK 1
SELECT LASTNAME, SALARY, SALARY * 1.05 AS "INC-Y-SALARY", DECIMAL(
(SALARY / 12) * 1.05, 9, 2) AS "INC-M-SALARY"
FROM EMPLOYEE
WHERE SALARY * 1.05 <= 20000
ORDER BY SALARY;

-- TASK 2
SELECT LASTNAME, EDLEVEL, SALARY + 1200 AS "NEW-SALARY", 
DECIMAL(BONUS * 0.5, 9, 2) AS "NEW-BONUS" 
FROM EMPLOYEE
WHERE EDLEVEL IN (18, 20)
ORDER BY EDLEVEL DESC, SALARY;

-- TASK 3
SELECT WORKDEPT, LASTNAME, SALARY, (SALARY - 1000) AS "DECR-SALARY"
FROM EMPLOYEE
WHERE WORKDEPT = 'D11'
AND SALARY >= (20000 * 0.8)
AND SALARY <= (20000 * 1.2);

-- TASK 4
SELECT WORKDEPT, LASTNAME, (SALARY + COMM + BONUS) AS INCOME
FROM EMPLOYEE
WHERE WORKDEPT = 'D11'
AND (SALARY + COMM + BONUS) > SALARY * 1.1
ORDER BY INCOME;

-- TASK 5
SELECT DEPTNO, DEPTNAME, COALESCE(MGRNO, 'UNKNOWN') AS MGRNO
FROM DEPARTMENT
WHERE MGRNO IS NULL;


-- TASK 6
SELECT PROJNO, COALESCE(MAJPROJ, 'MAIN PROJECT') AS "MAJOR PROJECT"
FROM PROJECT
WHERE PROJNO LIKE 'MA%'
ORDER BY PROJNO;

-- TASK 7
SELECT EMPNO, LASTNAME, YEAR(HIREDATE - BIRTHDATE) AS AGE , HIREDATE
FROM EMPLOYEE
WHERE YEAR(HIREDATE - BIRTHDATE) < 25
ORDER BY AGE, EMPNO;

-- TASK 8
SELECT YEAR(PRSTDATE) AS YEAR, MONTH(PRSTDATE) AS MONTH, PROJNO
FROM PROJECT
WHERE PRENDATE = '1982-12-01'
ORDER BY PROJNO;

-- TASK 9
SELECT PROJNO, DECIMAL(ROUND((DAYS(PRENDATE) - DAYS(PRSTDATE))/7.0, 1), 9, 1) AS DURATION
FROM PROJECT
WHERE PROJNO LIKE 'MA%'
ORDER BY PROJNO;

-- TASK 10
SELECT PROJNO, PRENDATE, PRSTDATE + ((DAYS(PRENDATE) - DAYS(PRSTDATE)) * 1.1)DAYS AS EXPECTED
FROM PROJECT
WHERE PROJNO LIKE 'MA%';


--TASK 11
SELECT DAYS(DATE('2000-01-01')) - DAYS(DATE('1969-07-20')) AS INDAYS
FROM SYSIBM.SYSDUMMY1;
