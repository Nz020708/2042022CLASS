CREATE DATABASE COMPANY
USE COMPANY
CREATE TABLE VEZIFE(
ID INT PRIMARY KEY IDENTITY,
NAME NVARCHAR(255)
)
INSERT INTO VEZIFE
VALUES('DEVELOPER')

SELECT* FROM VEZIFE

CREATE TABLE EMPLOYEE(
ID INT PRIMARY KEY IDENTITY,
SAA NVARCHAR(50),
VEZIFEID INT REFERENCES VEZIFE(ID),
SALARY INT ,
)
INSERT INTO EMPLOYEE
VALUES('A B C',1,500)
INSERT INTO EMPLOYEE
VALUES('X Y K',2,800)
SELECT* FROM EMPLOYEE


CREATE TABLE FILIAL(
ID INT PRIMARY KEY IDENTITY,
NAME NVARCHAR(255)
)
INSERT INTO FILIAL
VALUES('BAKU')
SELECT* FROM FILIAL


CREATE TABLE MEHSUL(
ID INT PRIMARY KEY IDENTITY,
NAME NVARCHAR(255),
ALISHQIYMET FLOAT,
SATISHQIYMET FLOAT
)
INSERT INTO MEHSUL
VALUES('COMPUTER',1500,2600)
INSERT INTO MEHSUL
VALUES('PHONE',1100,2300)
SELECT* FROM MEHSUL
INSERT INTO MEHSUL
VALUES('TV',2500,3900)


CREATE TABLE SATISH(
ID INT PRIMARY KEY IDENTITY,
MEHSULID INT REFERENCES MEHSUL(ID),
EMPLOYEEID INT REFERENCES EMPLOYEE(ID),
FILIALID INT REFERENCES FILIAL(ID),
SATISHTIME DATE DEFAULT GETDATE()
)
INSERT INTO SATISH
VALUES(1,1,1,'2022.12.02')
INSERT INTO SATISH
VALUES(2,2,1,'2022.12.03')
INSERT INTO SATISH
VALUES(3,1,1,'2023.01.04')

SELECT* FROM SATISH

--QUERY1
SELECT EMPLOYEE.SAA 'EMPLOYEE' ,MEHSUL.NAME 'MEHSUL' ,FILIAL.NAME 'FILIAL',MEHSUL.ALISHQIYMET 'ALQIY',MEHSUL.SATISHQIYMET 'SATQIY'
FROM SATISH 
JOIN EMPLOYEE
ON 
EMPLOYEE.ID=SATISH.EMPLOYEEID
JOIN MEHSUL
ON
MEHSUL.ID=SATISH.MEHSULID
JOIN FILIAL
ON
FILIAL.ID=SATISH.FILIALID

--QUERY2
SELECT SUM(SATISHQIYMET) AS 'SATISHCEM'
FROM MEHSUL
JOIN SATISH
ON 
MEHSUL.ID=SATISH.MEHSULID

--QUERY3
SELECT SUM(SATISHQIYMET) AS 'CARIAYDASQ'
FROM SATISH
JOIN MEHSUL
ON 
MEHSUL.ID=SATISH.MEHSULID
WHERE MONTH(SATISH.SATISHTIME)='12' --MONTH(getdate())

--QUERY4
SELECT COUNT(MEHSUL.ID) 'SAY',EMPLOYEE.SAA 'SATANLAR'
FROM SATISH
JOIN MEHSUL
ON 
MEHSUL.ID=SATISH.MEHSULID