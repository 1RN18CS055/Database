CREATE TABLE LV_DEPARTMENT
(
DEPARTMENT_ID INT PRIMARY KEY,
DEPARTMENT_NAME VARCHAR(30) UNIQUE
);
INSERT INTO LV_DEPARTMENT VALUES(30,'DATABASE')
INSERT INTO LV_DEPARTMENT VALUES(40,'FULL STACK')
INSERT INTO LV_DEPARTMENT VALUES(60,'IT')
SELECT * FROM LV_DEPARTMENT

CREATE TABLE LV_EMPLOYEE
(
EMPLOYEE_ID INT PRIMARY KEY,
EMPLOYEE_NAME VARCHAR(30),
DEPARTMENT_ID INT FOREIGN KEY REFERENCES LV_DEPARTMENT(DEPARTMENT_ID)
);
INSERT INTO LV_EMPLOYEE VALUES(22,'SITA',30)

SELECT * FROM LV_EMPLOYEE

CREATE TABLE LV_LOCATION
(
HOUSE_NUMBER INT PRIMARY KEY NOT NULL,
LOCATION_NAME VARCHAR(30) UNIQUE,
LANDMARK VARCHAR(30) NOT NULL
);
INSERT INTO LV_LOCATION VALUES(78,'BANGALORE','XYZ')
SELECT * FROM LV_LOCATION


SELECT COUNT(1),DEPARTMENT_ID
FROM dlithe.dbo.S_HREMPLOYEES
GROUP BY DEPARTMENT_ID 

SELECT * FROM (
SELECT DENSE_RANK () OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY  DESC) AS DRNK,SALARY,DEPARTMENT_ID
FROM DBO.S_HREMPLOYEES sh
WHERE DEPARTMENT_ID=90
)X
WHERE DRNK=1

SELECT
* FROM
	DBO.S_HREMPLOYEES sh ,
	DBO.S_HRDEPARTMENTS sh2,
	DBO.S_HRLOCATIONS sh3 
WHERE
	SH.DEPARTMENT_ID = SH2.DEPARTMENT_ID
AND SH2.LOCATION_ID=SH3.lOCATION_ID;

--INNER QUERY 

SELECT
	SH.EMPLOYEE_ID,
	SH2.DEPARTMENT_NAME,
	FIRST_NAME ,
	LAST_NAME
FROM
	DBO.S_HREMPLOYEES sh ,
	DBO.S_HRDEPARTMENTS sh2
WHERE
	SH.DEPARTMENT_ID = SH2.DEPARTMENT_ID;
-- INNER JOIN WITH INNER KEY WORD 

SELECT
	SH.EMPLOYEE_ID,
	SH2.DEPARTMENT_NAME,
	FIRST_NAME ,
	LAST_NAME
FROM
	DBO.S_HREMPLOYEES sh
INNER JOIN DBO.S_HRDEPARTMENTS sh2 
ON
	SH.DEPARTMENT_ID = SH2.DEPARTMENT_ID;

--left join

SELECT
	SH.EMPLOYEE_ID,
	SH2.DEPARTMENT_NAME,
	FIRST_NAME ,
	LAST_NAME
FROM
	DBO.S_HREMPLOYEES sh
LEFT JOIN DBO.S_HRDEPARTMENTS sh2 
ON
	SH.DEPARTMENT_ID = SH2.DEPARTMENT_ID;

--RIGHT JOIN

SELECT
	SH.EMPLOYEE_ID,
	SH2.DEPARTMENT_NAME,
	FIRST_NAME ,
	LAST_NAME
FROM
	DBO.S_HREMPLOYEES sh
RIGHT JOIN DBO.S_HRDEPARTMENTS sh2 
ON
	SH.DEPARTMENT_ID = SH2.DEPARTMENT_ID;


--FULL JOIN

SELECT
	SH.EMPLOYEE_ID,
	SH2.DEPARTMENT_NAME,
	FIRST_NAME ,
	LAST_NAME
FROM
	DBO.S_HREMPLOYEES sh
FULL JOIN DBO.S_HRDEPARTMENTS sh2 
ON
	SH.DEPARTMENT_ID = SH2.DEPARTMENT_ID;

CREATE TABLE LV_CUSTOMER
(
C_ID INT PRIMARY KEY,
NAME VARCHAR(25) NOT NULL,
CITY VARCHAR(20)
);
INSERT INTO LV_CUSTOMER VALUES(1,'ANANYA','BANGALORE')
INSERT INTO LV_CUSTOMER VALUES(2,'ANAGHA','MYSORE')
INSERT INTO LV_CUSTOMER VALUES(3,'BHAVANA','BANGALORE')

SELECT * FROM LV_CUSTOMER

CREATE TABLE LV_ORDER
(
O_ID INT PRIMARY KEY,
O_NO INT UNIQUE,
C_ID INT,
FOREIGN KEY(C_ID) REFERENCES LV_CUSTOMER(C_ID)
);
INSERT INTO LV_ORDER VALUES(1,222,1)
INSERT INTO LV_ORDER VALUES(2,223,2)
INSERT INTO LV_ORDER VALUES(3,224,3)
INSERT INTO LV_ORDER VALUES(4,225,3)
INSERT INTO LV_ORDER VALUES(5,2212,3)
INSERT INTO LV_ORDER VALUES(6,20145,1)
INSERT INTO LV_ORDER VALUES(7,1983,2)
INSERT INTO LV_ORDER VALUES(8,1502,1)

SELECT * FROM LV_ORDER


CREATE TABLE LV_VOTING
(
ID INT PRIMARY KEY,
NAME VARCHAR(50) NOT NULL,
AGE INT NOT NULL CHECK(AGE>=18)
);
INSERT INTO LV_VOTING VALUES(1,'ANANYA',22)
INSERT INTO LV_VOTING VALUES(2,'ANAGHA',21)
INSERT INTO LV_VOTING VALUES(3,'BHAVANA',16)
INSERT INTO LV_VOTING VALUES(4,'KEERTHANA',19)

SELECT * FROM LV_VOTING

CREATE TABLE LV_VOTE
(
ID INT PRIMARY KEY,
NAME VARCHAR(50) NOT NULL,
AGE INT NOT NULL DEFAULT 18
);
INSERT INTO LV_VOTE VALUES(1,'ANANYA',22)
INSERT INTO LV_VOTE VALUES(2,'ANAGHA',21)
INSERT INTO LV_VOTE VALUES(3,'BHAVANA',16)
INSERT INTO LV_VOTE(ID,NAME) VALUES(4,'KEERTHANA')

SELECT * FROM LV_VOTE



DROP TABLE LV_VOTE;


TRUNCATE TABLE LV_VOTING;

DELETE FROM LV_CUSTOMER
WHERE NAME='ANAGHA'

UPDATE LV_CUSTOMER
SET NAME='ANANYA'
WHERE C_ID=1

ALTER TABLE LV_CUSTOMER AS LVV_CUSTOMER

DELETE LV_DEPARTMENT
WHERE DEPARTMENT_NAME='IT'

SELECT EMPLOYEE_ID
FROM DBO.S_HREMPLOYEES
WHERE DEPARTMENT_ID=20

SELECT CASE 
WHEN DEPARTMENT_ID=20 THEN 'IT'
WHEN DEPARTMENT_ID=10 THEN 'HR'
WHEN DEPARTMENT_ID=30 AND SALARY>10000 AND FIRST_NAME<>'DAVID' THEN 'FINANCE'
ELSE 'OTHERS'
END AS DNAME,DEPARTMENT_ID FROM dlithe.dbo.S_HREMPLOYEES;



CREATE TABLE LV_EMP_DETAILS 
( 
ID INT,
NAME VARCHAR(50),
GENDER VARCHAR(6),
AGE INT,
DEPT VARCHAR(40)
)

SELECT * FROM LV_EMP_DETAILS

CREATE TABLE LV_STUDENTS
(
STD_ID INT,
STD_NAME VARCHAR(100),
STD_AGE INT,
STD_CITY VARCHAR(50),
STD_MOB VARCHAR(12)
)

SELECT * FROM LV_STUDENTS

INSERT INTO LV_STUDENTS VALUES(100,'ANAGHA',22,'BANGALORE','1324536572')
(101,'ANANYA',21,'MANGALORE','1324538792')
(102,'BHAVANA',20,'BANGALORE','9024536572')

UPDATE LV_STUDENTS
SET STD_NAME='KEERTHANA'
WHERE STD_ID=100

DELETE FROM LV_STUDENTS 
WHERE STD_ID=100

TRUNCATE TABLE LV_STUDENTS

DROP TABLE LV_STUDENTS

CREATE TABLE LV_HREMPLOYEE1
(
EMPLOYEE_ID INT,
FIRST_NAME VARCHAR(100),
LAST_NAME VARCHAR(100),
EMAIL VARCHAR(50),
PHONE_NUMBER VARCHAR(20),
HIRE_DATE VARCHAR(50),
JOB_ID VARCHAR(50),
SALARY FLOAT,
COMMISSION_PCT FLOAT,
MANAGER_ID INT,
DEPARTMENT_ID INT
);

SELECT * FROM LV_HREMPLOYEE1


CREATE TABLE LV_HEALTH
(
YEAR INT,
STATE VARCHAR(100),
HAI VARCHAR(100),
OPERATIVE_PROCEDURE VARCHAR(50),
FACILITY_1 VARCHAR(20),
FACILITY_NAME VARCHAR(50),
HOSPITAL_CATEGORY VARCHAR(50),
HOSPITAL_TYPE VARCHAR(50),
COUNTRY VARCHAR(50),
PROCEDURE_COUNT INT,
INFECTION_COUNT INT,
PREDICTED_INFECTION_COUNT INT,
SIR INT,
SIR_LOWER INT,
SIR_UPPER INT,
COMPARISION VARCHAR(50),
SIR_20 INT,
ON_TRACK VARCHAR(50),
NOTES VARCHAR(50)
)
INSERT INTO LV_HEALTH VALUES(2021,'CALIFORNIA','HEALTHCARE ASSOCIATION INFECTION','APPENDIX SURGERY','060000','ADVENTIST HEALTH','ACUTE','COMMUNITY','KERN',222,2,4,1,2,3,'SAME',7,'YES','SEE DATA DIC')
INSERT INTO LV_HEALTH VALUES(2022,'CALIFORNIA','HEALTHCARE ASSOCIATION INFECTION','CARDIAC SURGERY','060001','AHMC HEALTH','CRITICAL','COMMUNITY','LAKE',221,1,3,2,6,6,'SAME',8,'YES','SEE DATA DIC')

SELECT * FROM LV_HEALTH

CREATE TABLE LV_HEALTH_CARE
(
YEAR INT,
STATE VARCHAR(100),
HAI VARCHAR(100),
OPERATIVE_PROCEDURE VARCHAR(50),
FACILITY_1 VARCHAR(20),
FACILITY_NAME VARCHAR(50),
HOSPITAL_CATEGORY VARCHAR(50),
HOSPITAL_TYPE VARCHAR(50),
COUNTRY VARCHAR(50),
PROCEDURE_COUNT INT,
INFECTION_COUNT INT,
PREDICTED_INFECTION_COUNT INT,
SIR INT,
SIR_LOWER INT,
SIR_UPPER INT,
COMPARISION VARCHAR(50),
SIR_20 INT,
ON_TRACK VARCHAR(50),
NOTES VARCHAR(50)
)

SELECT * FROM LV_HEALTH_CARE

SELECT * FROM S_HREMPLOYEES

CREATE TABLE LV_HEALTH1
(
YEAR INT,
STATE VARCHAR(100),
HAI VARCHAR(100),
OPERATIVE_PROCEDURE VARCHAR(100),
FACILITY_ID VARCHAR(20),
FACILITY_NAME VARCHAR(50),
HOSPITAL_CATEGORY VARCHAR(50),
HOSPITAL_TYPE VARCHAR(50),
COUNTRY VARCHAR(50),
PROCEDURE_COUNT FLOAT,
INFECTION_COUNT FLOAT,
PREDICTED_INFECTION_COUNT FLOAT,
SIR FLOAT,
SIR_LOWER FLOAT,
SIR_UPPER FLOAT,
COMPARISION VARCHAR(50),
SIR_20 FLOAT,
ON_TRACK VARCHAR(50),
NOTES VARCHAR(50)
)

INSERT INTO LV_HEALTH1 VALUES(2017,'California','Healthcare Associated Infection Surgical Site Infections','STATE OF CALIFORNIA POOLED DATA Abdominal aortic aneurysm repair',NULL,NULL,NULL,NULL,NULL,515,2,3.502,0.57,0.1,1.89,'Same',1.07,'Yes',NULL)	
INSERT INTO LV_HEALTH1 VALUES(2017,'California','Healthcare Associated Infection Surgical Site Infections','STATE OF CALIFORNIA POOLED DATA Appendix surgery',NULL,NULL,NULL,NULL,NULL,29595,116,113.323,1.02,0.85,1.22,'Same',0.98,'No',NULL)	

SELECT * FROM LV_HEALTH1

CREATE TABLE LV_HEALTH2
(
YEAR INT,
STATE VARCHAR(100),
HAI VARCHAR(100),
OPERATIVE_PROCEDURE VARCHAR(100),
FACILITY_ID VARCHAR(20),
FACILITY_NAME VARCHAR(50),
HOSPITAL_CATEGORY VARCHAR(50),
HOSPITAL_TYPE VARCHAR(50),
COUNTRY VARCHAR(50),
PROCEDURE_COUNT FLOAT,
INFECTION_COUNT FLOAT,
PREDICTED_INFECTION_COUNT FLOAT,
SIR FLOAT,
SIR_LOWER FLOAT,
SIR_UPPER FLOAT,
COMPARISION VARCHAR(50),
SIR_20 FLOAT,
ON_TRACK VARCHAR(50),
NOTES VARCHAR(50)
)

SELECT * FROM LV_HEALTH2

CREATE TABLE LV_HEALTH4
(
Year INT,	
State VARCHAR(100),
HAI	VARCHAR(100),
Operative_Procedure	VARCHar(100),
Facility_ID	VARCHAR(50),
Facility_Name VARCHAR(50),
Hospital_Category_RiskAdjustment VARCHAR(50),
Hospital_Type VARCHAR(50),
County VARCHAR(50),
Procedure_Count FLOAT,
Infection_Count FLOAT,
Predicted_Infection_Count FLOAT,
SIR	FLOAT,
SIR_CI_95_Lower_Limit FLOAT,
SIR_CI_95_Upper_Limit FLOAT,
Comparison VARCHAR(50),
SIR_2015 FLOAT,	
On_Track VARCHAR(50),
Notes VARCHAR(50)
)
SELECT * FROM LV_HEALTH4

CREATE TABLE LV_STORE1
(
Row_ID INT,
Order_ID VARCHAR(255),
Order_Date VARCHAR(255),
Ship_Date VARCHAR(255),
Ship_Mode VARCHAR(255),
Customer_ID	VARCHAR(255),
Customer_Name VARCHAR(255),
Segment VARCHAR(255),
Country VARCHAR(255),
City VARCHAR(255),
State VARCHAR(255),
Postal_Code VARCHAR(255),
Region VARCHAR(255),
Product_ID VARCHAR(255),
Category VARCHAR(255),
Sub_Category VARCHAR(255),
Product_Name VARCHAR(255),
Sales FLOAT,
Quantity INT,
Discount FLOAT,
Profit FLOAT
)
SELECT * FROM LV_STORE1


CREATE TABLE LV_HREMPLOYEE2
(
EMPLOYEE_ID INT,
FIRST_NAME VARCHAR(100),
LAST_NAME VARCHAR(100),
EMAIL VARCHAR(50),
PHONE_NUMBER VARCHAR(20),
HIRE_DATE VARCHAR(50),
JOB_ID VARCHAR(50),
SALARY FLOAT,
COMMISSION_PCT FLOAT,
MANAGER_ID INT,
DEPARTMENT_ID INT
);

SELECT * FROM LV_HREMPLOYEE2

SELECT CASE WHEN DEPARTMENT_ID=10 THEN 'HR'
ELSE 'OTHERS'
END AS DNAME,DEPARTMENT_ID
FROM S_HREMPLOYEES

CREATE TABLE LV_DEPARTMENT1
(
EMP_ID INT,
EMP_NAME VARCHAR(20),
DEPT_ID INT,
EMAIL VARCHAR(50),
ACCOUNT_NO VARCHAR(50)
)

INSERT INTO LV_DEPARTMENT1 VALUES(1,'ANAGHA',20,'ANAGHA@GMAIL.COM','12345%6754')
INSERT INTO LV_DEPARTMENT1 VALUES(2,'ANANYA',30,'ANANYA@GMAIL.COM','12765-4554')
INSERT INTO LV_DEPARTMENT1 VALUES(3,'BHAVANA',40,'BHAVANA@GMAIL.COM','17645$9854')

SELECT * FROM LV_DEPARTMENT1

TRUNCATE TABLE LV_DEPARTMENT1

SELECT CASE WHEN DEPT_ID=10 THEN 'HR'
ELSE 'OTHERS'
END AS DNAME,DEPT_ID
FROM LV_DEPARTMENT1
	
SELECT SUBSTRING (EMAIL,CHARINDEX('@',EMAIL)+1,LEN(EMAIL)) FROM LV_DEPARTMENT1

SELECT REPLACE(REPLACE(ACCOUNT_NO,'%','-'),'$','-') FROM LV_DEPARTMENT1

SELECT * FROM S_HREMPLOYEES

SELECT SUM(SALARY)
FROM S_HREMPLOYEES

SELECT AVG(SALARY)
FROM S_HREMPLOYEES

SELECT MIN(SALARY)
FROM S_HREMPLOYEES

SELECT MAX(SALARY)
FROM S_HREMPLOYEES

SELECT COUNT(*)
FROM S_HREMPLOYEES




CREATE TABLE LV_PRODUCT1
(
PRODUCT VARCHAR(50),
COMPANY VARCHAR(50),
QTY INT,
RATE INT,
COST INT
)
INSERT INTO LV_PRODUCT1 VALUES('ITEM1','COMP1',2,10,20)
INSERT INTO LV_PRODUCT1 VALUES('ITEM2','COMP2',3,25,75)
INSERT INTO LV_PRODUCT1 VALUES('ITEM3','COMP1',2,30,60)
INSERT INTO LV_PRODUCT1 VALUES('ITEM4','COMP3',5,10,50)
INSERT INTO LV_PRODUCT1 VALUES('ITEM5','COMP2',2,20,40)
INSERT INTO LV_PRODUCT1 VALUES('ITEM6','COMP1',3,25,75)
INSERT INTO LV_PRODUCT1 VALUES('ITEM7','COMP1',5,30,150)
INSERT INTO LV_PRODUCT1 VALUES('ITEM8','COMP1',3,10,30)
INSERT INTO LV_PRODUCT1 VALUES('ITEM9','COMP2',2,25,50)
INSERT INTO LV_PRODUCT1 VALUES('ITEM10','COMP3',4,30,120)

SELECT * FROM LV_PRODUCT1

SELECT COUNT(*)
FROM LV_PRODUCT1

SELECT SUM(COST)
FROM LV_PRODUCT1

SELECT AVG(COST)
FROM LV_PRODUCT1

SELECT MIN(COST)
FROM LV_PRODUCT1

SELECT MAX(COST)
FROM LV_PRODUCT1


CREATE TABLE LV_STORE2
(
Row_ID INT,
Order_ID VARCHAR(255),
Order_Date VARCHAR(255),
Ship_Date VARCHAR(255),
Ship_Mode VARCHAR(255),
Customer_ID	VARCHAR(255),
Customer_Name VARCHAR(255),
Segment VARCHAR(255),
Country VARCHAR(255),
City VARCHAR(255),
State VARCHAR(255),
Postal_Code VARCHAR(255),
Region VARCHAR(255),
Product_ID VARCHAR(255),
Category VARCHAR(255),
Sub_Category VARCHAR(255),
Product_Name VARCHAR(255),
Sales FLOAT,
Quantity INT,
Discount FLOAT,
Profit FLOAT
)
SELECT * FROM LV_STORE2

ALTER TABLE LV_STORE2
ALTER COLUMN Row_ID FLOAT

CREATE TABLE LV_STORE3
(
Row_ID FLOAT,
Order_ID VARCHAR(255),
Order_Date VARCHAR(255),
Ship_Date DATETIME,
Ship_Mode VARCHAR(255),
Customer_ID	VARCHAR(255),
Customer_Name VARCHAR(255),
Segment VARCHAR(255),
Country VARCHAR(255),
City VARCHAR(255),
State VARCHAR(255),
Postal_Code FLOAT,
Region VARCHAR(255),
Product_ID VARCHAR(255),
Category VARCHAR(255),
Sub_Category VARCHAR(255),
Product_Name VARCHAR(255),
Sales FLOAT,
Quantity INT,
Discount FLOAT,
Profit FLOAT
)
SELECT * FROM LV_STORE3
DROP TABLE LV_store3


CREATE TABLE LV_EMP1 
(
Emp_Id INT,
Name VARCHAR(100),
Mobile VARCHAR(50),
Salary FLOAT,
Dept VARCHAR(50),
Joining_Year INT
)
SELECT * FROM LV_EMP1

ALTER TABLE LV_EMP1
ALTER COLUMN Emp_Id VARCHAR(50)

CREATE TABLE LV_LOOK1 
(
id INT,
name VARCHAR(50),
gender VARCHAR(50),
age INT,
salary FLOAT,
dept VARCHAR(50)
)
SELECT * FROM LV_LOOK1

UPDATE LV_LOOK1
SET age=?,salary=?
WHERE name=?


CREATE TABLE LV_CONTAINER 
(
id INT,
name VARCHAR(50),
gender VARCHAR(50),
age INT,
salary FLOAT,
dept VARCHAR(50)
)
SELECT * FROM LV_CONTAINER

CREATE TABLE LV_CONT 
(
name VARCHAR(50),
gender VARCHAR(50),
dept VARCHAR(50)
)
SELECT * FROM LV_CONT

TRUNCATE TABLE LV_CONT

CREATE TABLE LV_SEQ_EMP 
(
ID INT,
NAME VARCHAR(50),
GENDER VARCHAR(50),
DEPT VARCHAR(50)
)
INSERT INTO LV_SEQ_EMP VALUES(201,'RAM','MALE','HR')
INSERT INTO LV_SEQ_EMP VALUES(202,'SHYAM','MALE','IT')
INSERT INTO LV_SEQ_EMP VALUES(203,'GITA','FEMALE','HR')
INSERT INTO LV_SEQ_EMP VALUES(204,'SITA','FEMALE','ACC')

SELECT * FROM LV_SEQ_EMP

CREATE TABLE LV_SEQ_EMP1 
(
ID INT,
NAME VARCHAR(50),
GENDER VARCHAR(50),
DEPT VARCHAR(50)
)
SELECT * FROM LV_SEQ_EMP1

CREATE TABLE LV_FILETASK 
(
name VARCHAR(50),
gender VARCHAR(50),
dept VARCHAR(50)
)
SELECT * FROM LV_FILETASK

TRUNCATE TABLE LV_FILETASK

-----JOINS
CREATE TABLE LV_CUSTOMER1
(
CUST_ID INT,
CUST_NAME VARCHAR(100),
CUST_MOB VARCHAR(15),
CUST_COUNTRY VARCHAR(50)
)

CREATE TABLE LV_ORDER1
(
ORDER_ID INT,
CUST_ID INT,
ORDER_DATE DATE
)

SELECT * FROM LV_CUSTOMER1
SELECT * FROM LV_ORDER1

INSERT INTO LV_CUSTOMER1 VALUES(1,'ANA','5432145674','INDIA')
INSERT INTO LV_CUSTOMER1 VALUES(2,'JOHN','7632145674','US')
INSERT INTO LV_CUSTOMER1 VALUES(3,'SITA','8732145674','LONDON')
INSERT INTO LV_CUSTOMER1 VALUES(4,'GITA','9832145674','UK')
INSERT INTO LV_CUSTOMER1 VALUES(5,'RAM','1232145674','INDIA')

INSERT INTO LV_ORDER1 VALUES(101,1,'02-03-2022')
INSERT INTO LV_ORDER1 VALUES(102,1,'03-03-2022')
INSERT INTO LV_ORDER1 VALUES(103,2,'03-04-2022')
INSERT INTO LV_ORDER1 VALUES(104,2,'02-03-2022')
INSERT INTO LV_ORDER1 VALUES(105,3,'03-05-2022')
INSERT INTO LV_ORDER1 VALUES(106,4,'02-03-2022')
INSERT INTO LV_ORDER1 VALUES(107,4,'02-03-2022')

SELECT CUST.CUST_ID,CUST.CUST_NAME,CUST.CUST_MOB,CUST.CUST_COUNTRY
FROM LV_CUSTOMER1 AS CUST
INNER JOIN LV_ORDER1 AS OD 
ON CUST.CUST_ID=OD.CUST_ID

SELECT CUST.CUST_ID,CUST.CUST_NAME,CUST.CUST_MOB,CUST.CUST_COUNTRY
FROM LV_CUSTOMER1 AS CUST
LEFT JOIN LV_ORDER1 AS OD 
ON CUST.CUST_ID=OD.CUST_ID


SELECT CUST.CUST_ID,CUST.CUST_NAME,CUST.CUST_MOB,CUST.CUST_COUNTRY,OD.ORDER_ID,OD.ORDER_DATE
FROM LV_CUSTOMER1 AS CUST
RIGHT JOIN LV_ORDER1 AS OD 
ON CUST.CUST_ID=OD.CUST_ID

SELECT CUST.CUST_ID,CUST.CUST_NAME,CUST.CUST_MOB,CUST.CUST_COUNTRY,OD.ORDER_ID,OD.ORDER_DATE
FROM LV_CUSTOMER1 AS CUST
FULL JOIN LV_ORDER1 AS OD 
ON CUST.CUST_ID=OD.CUST_ID

SELECT CUST.CUST_ID,CUST.CUST_NAME,CUST.CUST_MOB,CUST.CUST_COUNTRY,OD.ORDER_ID,OD.ORDER_DATE
FROM LV_CUSTOMER1 AS CUST,LV_ORDER1 AS OD

-----------

CREATE TABLE LV_EMP2
(
EMP_ID INT,
EMP_NAME VARCHAR(100),
ZIP_CODE VARCHAR(15),
)

CREATE TABLE LV_ADDRESS
(
ZIP_CODE VARCHAR(15),
CITY VARCHAR(50),
COUNTRY VARCHAR(50)
)

SELECT * FROM LV_EMP2
SELECT * FROM LV_ADDRESS

INSERT INTO LV_EMP2 VALUES(1,'ANA','543214')
INSERT INTO LV_EMP2 VALUES(2,'JOHN','763214')
INSERT INTO LV_EMP2 VALUES(3,'SITA','873214')
INSERT INTO LV_EMP2 VALUES(4,'GITA','983214')
INSERT INTO LV_EMP2 VALUES(5,'RAM','123214')

INSERT INTO LV_ADDRESS VALUES('543214','BANGALORE','INDIA')
INSERT INTO LV_ADDRESS VALUES('543214','MUMBAI','INDIA')
INSERT INTO LV_ADDRESS VALUES('763214','MANGALORE','INDIA')
INSERT INTO LV_ADDRESS VALUES('873214','BANGALORE','INDIA')
INSERT INTO LV_ADDRESS VALUES('983214','CHENNAI','INDIA')
INSERT INTO LV_ADDRESS VALUES('123214','MANGALORE','INDIA')

SELECT EMP.EMP_ID,EMP.EMP_NAME,EMP.ZIP_CODE,AD.CITY,AD.COUNTRY
FROM LV_EMP2 AS EMP
INNER JOIN LV_ADDRESS AS AD 
ON EMP.ZIP_CODE=AD.ZIP_CODE


SELECT EMP.EMP_ID,EMP.EMP_NAME,EMP.ZIP_CODE,AD.CITY,AD.COUNTRY
FROM LV_EMP2 AS EMP
LEFT JOIN LV_ADDRESS AS AD 
ON EMP.ZIP_CODE=AD.ZIP_CODE

SELECT EMP.EMP_ID,EMP.EMP_NAME,EMP.ZIP_CODE,AD.CITY,AD.COUNTRY
FROM LV_EMP2 AS EMP
RIGHT JOIN LV_ADDRESS AS AD 
ON EMP.ZIP_CODE=AD.ZIP_CODE

SELECT EMP.EMP_ID,EMP.EMP_NAME,EMP.ZIP_CODE,AD.CITY,AD.COUNTRY
FROM LV_EMP2 AS EMP
FULL JOIN LV_ADDRESS AS AD 
ON EMP.ZIP_CODE=AD.ZIP_CODE

SELECT EMP.EMP_ID,EMP.EMP_NAME,EMP.ZIP_CODE,AD.CITY,AD.COUNTRY
FROM LV_EMP2 AS EMP,LV_ADDRESS AS AD 

--------

--Constraints

CREATE TABLE LV_DEPT1
(
DEP_ID INT PRIMARY KEY,
DEP_NAME VARCHAR(30) UNIQUE
)
INSERT INTO LV_DEPT1 VALUES(10,'DATABASE')
INSERT INTO LV_DEPT1 VALUES(20,'IT')
INSERT INTO LV_DEPT1 VALUES(30,'FULL STACK')

SELECT * FROM LV_DEPT1


CREATE TABLE LV_EMP3
(
EMP_ID INT PRIMARY KEY,
EMP_NAME VARCHAR(30),
DEP_ID INT FOREIGN KEY REFERENCES LV_DEPT1(DEP_ID)
)
INSERT INTO LV_EMP3 VALUES(1,'ANANYA',10)
INSERT INTO LV_EMP3 VALUES(2,'ANAGHA',20) 
INSERT INTO LV_EMP3 VALUES(3,'BHAVANA',30)

SELECT * FROM LV_EMP3

CREATE TABLE LV_EMP4
(
EMP_ID INT PRIMARY KEY,
EMP_NAME VARCHAR(30),
AGE INT CHECK (AGE>=18)
)
INSERT INTO LV_EMP4 VALUES(1,'SITA',18)
INSERT INTO LV_EMP4 VALUES(2,'GITA',19)
INSERT INTO LV_EMP4 VALUES(3,'RITA',20)
SELECT * FROM LV_EMP4

CREATE TABLE LV_EMP6
(
EMP_ID INT PRIMARY KEY,
EMP_NAME VARCHAR(30),
AGE INT DEFAULT 18
)
SELECT * FROM LV_EMP6

INSERT INTO LV_EMP6(EMP_ID,EMP_NAME,AGE) VALUES(5,'SITA') 

DROP TABLE LV_EMP6
