-- continue from last week 4, 5, 6 and 7

-- TASK 04
SELECT EMPNO, LASTNAME, SALARY, WORKDEPT
FROM EMPLOYEE 
WHERE SALARY > ANY(SELECT SALARY FROM EMPLOYEE WHERE WORKDEPT = 'D11')
	AND WORKDEPT <> 'D11'
ORDER BY EMPNO;

-- TASK 05
SELECT EMPNO, LASTNAME, SALARY, WORKDEPT
FROM EMPLOYEE
WHERE SALARY > ALL(SELECT SALARY FROM EMPLOYEE WHERE WORKDEPT = 'D21')
	AND WORKDEPT <> 'D21'
ORDER BY EMPNO;

-- TASK 06
SELECT E.EMPNO, E.LASTNAME, COUNT(*) AS COUNT_ACTIVITY
FROM EMPLOYEE E, EMP_ACT EA
WHERE E.EMPNO = EA.EMPNO 
GROUP BY E.EMPNO, E.LASTNAME
HAVING COUNT(*) >= ALL(SELECT COUNT(*) FROM EMP_ACT GROUP BY EMPNO); 

-- TASK 07
SELECT E.EMPNO, E.LASTNAME, EA.ACTNO
FROM EMPLOYEE E, EMP_ACT EA
WHERE E.EMPNO = EA.ACTNO
	AND EXISTS(SELECT * FROM EMP_ACT WHERE YEAR(EMSTDATE) = 1982);

-- TASK 01
SELECT WORKDEPT, EMPNO, LASTNAME
FROM VEMPLOYEE, VDEPARTMENT
WHERE WORKDEPT = DEPTNO 
	AND DEPTNAME = 'INFORMATION CENTER'
ORDER BY EMPNO;
	

-- TASK 02
SELECT WORKDEPT, EMPNO, LASTNAME
FROM VEMPLOYEE 
	INNER JOIN VDEPARTMENT
	ON WORKDEPT = DEPTNO
WHERE DEPTNAME = 'INFORMATION CENTER'
ORDER BY EMPNO;

-- TASK 03
SELECT WORKDEPT, EMPNO, LASTNAME, PROJNAME
FROM VEMPLOYEE
	INNER JOIN VPROJECT
	ON WORKDEPT = DEPTNO
ORDER BY EMPNO, PROJNAME;

-- TASK 04
SELECT WORKDEPT, EMPNO, LASTNAME, PROJNAME
FROM VEMPLOYEE
	LEFT JOIN VPROJECT
	ON WORKDEPT = DEPTNO
ORDER BY EMPNO, PROJNAME;

-- TASK 05
SELECT WORKDEPT, EMPNO, LASTNAME, PROJNAME
FROM VEMPLOYEE
	RIGHT JOIN VPROJECT
	ON WORKDEPT = DEPTNO
ORDER BY EMPNO, PROJNAME;

-- TASK 06
SELECT WORKDEPT, EMPNO, LASTNAME, PROJNAME
FROM VEMPLOYEE
	FULL JOIN VPROJECT
	ON WORKDEPT = DEPTNO
ORDER BY LASTNAME, PROJNAME;

-- TASK 01
SELECT LASTNAME, FIRSTNME, 'BEFORE A RAISE' AS WHEN, SALARY
FROM EMPLOYEE
WHERE WORKDEPT = 'D21' AND  JOB <> 'MANAGER'

UNION ALL
SELECT LASTNAME, FIRSTNME, 'AFTER A RAISE' AS WHEN, SALARY*1.1
FROM EMPLOYEE
WHERE WORKDEPT = 'D21' AND  JOB <> 'MANAGER'
ORDER BY LASTNAME, WHEN DESC;

-- TASK 02
SELECT WORKDEPT, EMPNO, SALARY
FROM EMPLOYEE
WHERE WORKDEPT = 'A00'

UNION ALL

SELECT WORKDEPT, 'SUM OF ALL SALARIES', SUM(SALARY)
FROM EMPLOYEE
WHERE WORKDEPT = 'A00'
GROUP BY WORKDEPT
ORDER BY SALARY

-- 23.11.2017
-- TASK	03
SELECT DEPTNO, 'DEPARTMENT' AS INFO, DEPTNAME
FROM DEPARTMENT
WHERE DEPTNO IN ('A00', 'B01', 'C01')

UNION ALL

SELECT DEPTNO, 'PROJNO:' || PROJNO, PROJNAME
FROM PROJECT
WHERE DEPTNO IN ('A00', 'B01', 'C01')

UNION ALL

SELECT WORKDEPT, 'EMPNO' ||  EMPNO, LASTNAME
FROM EMPLOYEE
WHERE WORKDEPT IN ('A00', 'B01', 'C01')
ORDER BY DEPTNO;

-- TASK 04
SELECT 'PROJECT', PROJNO, RESPEMP AS EMPNO, PRSTDATE, PRENDATE
FROM PROJECT
WHERE PROJNO LIKE 'IF%'

UNION ALL

SELECT 'ACTIVITY', PROJNO, EMPNO, EMSTDATE, EMENDATE
FROM EMP_ACT
WHERE PROJNO LIKE 'IF%'
ORDER BY PROJNO, EMPNO, PRSTDATE;
