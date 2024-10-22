# Notepad Version of Script File for TAL Distributors Database

# This is an example of a 'script' file that contains the necessary MySQL instructions to build and populate the tables you
# need for the TAL Distributors database.
# In order for you to submit the evidence of your completing the homework, you must create what is called a 'logfile'
# that contains the instructions you typed and executed along with the results (output) of executing the script file.


# Open a logfile so that program codes, outputs and any error messages from SQL can be stored as a text file.
# tee is the SQL command that creates a blank file where the instructions and the outputs from executing them will be stored.
# Make sure you replace my name with YOUR last and first name in creating 

#tee /CSIS1550/Shipley_Taylor_Ch4TAL.txt
tee /Users/Tays012/Documents/CSIS1550/Shipley_Taylor_Ch4TAL.txt

#1. PROGRAM DOCUMENTATION

# IMPORTANT: You should use YOUR last and first name instead of mine!

# Taylor Shipley
# Assignment #5: Single-Table Query for the TAL Distributors Database

# The sql statement below checks if TAL database already exists. 
# If yes, it will delete it before creating a new one.

DROP DATABASE IF EXISTS TAL;

# Create the database TAL

CREATE DATABASE TAL;

# Tell SQL that you want to use the database named TAL

USE TAL;

# This is necessary for SQL because it can store more than ONE database and needs to be told which one you want to use.
 
#2. CREATING THE TABLE STRUCTURES

# Defining the REP table structure

CREATE TABLE REP
(REP_NUM CHAR(2) PRIMARY KEY,
LAST_NAME CHAR(15),
FIRST_NAME CHAR(15),
STREET CHAR(15),
CITY CHAR(15),
STATE CHAR(2),
POSTAL_CODE CHAR(5),
COMMISSION DECIMAL(7,2),
RATE DECIMAL(3,2) );

# Defining the CUSTOMER table structure

CREATE TABLE CUSTOMER
(CUSTOMER_NUM CHAR(3) PRIMARY KEY,
CUSTOMER_NAME CHAR(35) NOT NULL,
STREET CHAR(20),
CITY CHAR(15),
STATE CHAR(2),
POSTAL_CODE CHAR(5),
BALANCE DECIMAL(8,2),
CREDIT_LIMIT DECIMAL(8,2),
REP_NUM CHAR(2) );

# Defining the ORDERS table structure

CREATE TABLE ORDERS
(ORDER_NUM CHAR(5) PRIMARY KEY,
ORDER_DATE DATE,
CUSTOMER_NUM CHAR(3) );

# Defining the ITEM table structure

CREATE TABLE ITEM
(ITEM_NUM CHAR(4) PRIMARY KEY,
DESCRIPTION CHAR(30),
ON_HAND DECIMAL(4,0),
CATEGORY CHAR(3),
STOREHOUSE CHAR(1),
PRICE DECIMAL(6,2) );

# Defining the ORDER_LINE table structure

CREATE TABLE ORDER_LINE
(ORDER_NUM CHAR(5),
ITEM_NUM CHAR(4),
NUM_ORDERED DECIMAL(3,0),
QUOTED_PRICE DECIMAL(6,2),
PRIMARY KEY (ORDER_NUM, ITEM_NUM) );

#3. VERIFYING THE TABLE DESIGN ACCURACY

SHOW COLUMNS FROM REP;
SHOW COLUMNS FROM CUSTOMER;
SHOW COLUMNS FROM ORDERS;
SHOW COLUMNS FROM ITEM;
SHOW COLUMNS FROM ORDER_LINE;

#4. POPULATING THE TABLES WITH DATA

# Entering the data into the REP table

INSERT INTO REP
VALUES
('15','Campos','Rafael','724 Vinca Dr.','Grove','CA','90092',23457.50,0.06);
INSERT INTO REP
VALUES
('30','Gradey','Megan','632 Liatris St.','Fullton','CA','90085',41317.00,0.08);
INSERT INTO REP
VALUES
('45','Tian','Hui','1785 Tyler Ave.','Northfield','CA','90098',27789.25,0.06);
INSERT INTO REP
VALUES
('60','Sefton','Janet','267 Oakley St.','Congaree','CA','90097',0.00,0.06);

# Entering the data into the CUSTOMER table
# Note how 2 single quotation marks ('') has to be entered for a name such as Johnson's Department Store and Kline's when you define the data.

INSERT INTO CUSTOMER
VALUES
('126','Toys Galore','28 Laketon St.','Fullton','CA','90085',1210.25,7500.00,'15');
INSERT INTO CUSTOMER
VALUES
('260','Brookings Direct','452 Columbus Dr.','Grove','CA','90092',575.00,10000.00,'30');
INSERT INTO CUSTOMER
VALUES
('334','The Everything Shop','342 Magee St.','Congaree','CA','90097',2345.75,7500.00,'45');
INSERT INTO CUSTOMER
VALUES
('386','Johnson''s Department Store','124 Main St.','Northfield','CA','90098',879.25,7500.00,'30');
INSERT INTO CUSTOMER
VALUES
('440','Grove Historical Museum Store','3456 Central Ave.','Fullton','CA','90085',345.00,5000.00,'45');
INSERT INTO CUSTOMER
VALUES
('502','Cards and More','167 Hale St.','Mesa','CA','90104',5025.75,5000.00,'15');
INSERT INTO CUSTOMER
VALUES
('586','Almondton General Store','3345 Devon Ave.','Almondton','CA','90125',3456.75,15000.00,'45');
INSERT INTO CUSTOMER
VALUES
('665','Cricket Gift Shop','372 Oxford St.','Grove','CA','90092',678.90,7500.00,'30');
INSERT INTO CUSTOMER
VALUES
('713','Cress Store','12 Rising Sun Ave.','Congaree','CA','90097',4234.60,10000.00,'15');
INSERT INTO CUSTOMER
VALUES
('796','Unique Gifts','786 Passmore St.','Northfield','CA','90098',124.75,7500.00,'45');
INSERT INTO CUSTOMER
VALUES
('824','Kline''s','945 Gilham St.','Mesa','CA','90104',2475.99,15000.00,'30');
INSERT INTO CUSTOMER
VALUES
('893','All Season Gifts','382 Wildwood Ave.','Fullton','CA','90085',935.75,7500.00,'15');

# Entering the data into the ORDERS table

INSERT INTO ORDERS
VALUES
('51608','2015-10-12','126');
INSERT INTO ORDERS
VALUES
('51610','2015-10-12','334');
INSERT INTO ORDERS
VALUES
('51613','2015-10-13','386');
INSERT INTO ORDERS
VALUES
('51614','2015-10-13','260');
INSERT INTO ORDERS
VALUES
('51617','2015-10-15','586');
INSERT INTO ORDERS
VALUES
('51619','2015-10-15','126');
INSERT INTO ORDERS
VALUES
('51623','2015-10-15','586');
INSERT INTO ORDERS
VALUES
('51625','2015-10-16','796');

# Entering the data into the ITEM table

INSERT INTO ITEM
VALUES
('AH74','Patience',9.00,'GME','3',22.99);
INSERT INTO ITEM
VALUES
('BR23','Skittles',21.00,'GME','2',29.99);
INSERT INTO ITEM
VALUES
('CD33','Wood Block Set (48 piece)',36.00,'TOY','1',89.49);
INSERT INTO ITEM
VALUES
('DL51','Classic Railway Set',12.00,'TOY','3',107.95);
INSERT INTO ITEM
VALUES
('DR67','Giant Star Brain Teaser',24.00,'PZL','2',31.95);
INSERT INTO ITEM
VALUES
('DW23','Mancala',40.00,'GME','3',50.00);
INSERT INTO ITEM
VALUES
('FD11','Rocking Horse',8.00,'TOY','3',124.95);
INSERT INTO ITEM
VALUES
('FH24','Puzzle Gift Set',65.00,'PZL','1',38.95);
INSERT INTO ITEM
VALUES
('KA12','Cribbage Set',56.00,'GME','3',75.00);
INSERT INTO ITEM
VALUES
('KD34','Pentominoes Brain Teaser',60.00,'PZL','2',14.95);
INSERT INTO ITEM
VALUES
('KL78','Pick Up Sticks',110.00,'GME','1',10.95);
INSERT INTO ITEM
VALUES
('MT03','Zauberkasten Brain Teaser',45.00,'PZL','1',45.79);
INSERT INTO ITEM
VALUES
('NL89','Wood Block Set (62 piece)',32.00,'TOY','3',119.75);
INSERT INTO ITEM
VALUES
('TR40','Tic Tac Toe',75.00,'GME','2',13.99);
INSERT INTO ITEM
VALUES
('TW35','Fire Engine',30.00,'TOY','2',118.95);

# Entering the data into the ORDER_LINE table

INSERT INTO ORDER_LINE
VALUES
('51608','CD33',5.00,86.99);
INSERT INTO ORDER_LINE
VALUES
('51610','KL78',25.00,10.95);
INSERT INTO ORDER_LINE
VALUES
('51610','TR40',10.00,13.99);
INSERT INTO ORDER_LINE
VALUES
('51613','DL51',5.00,104.95);
INSERT INTO ORDER_LINE
VALUES
('51614','FD11',1.00,124.95);
INSERT INTO ORDER_LINE
VALUES
('51617','NL89',4.00,115.99);
INSERT INTO ORDER_LINE
VALUES
('51617','TW35',3.00,116.95);
INSERT INTO ORDER_LINE
VALUES
('51619','FD11',2.00,121.95);
INSERT INTO ORDER_LINE
VALUES
('51623','DR67',5.00,29.95);
INSERT INTO ORDER_LINE
VALUES
('51623','FH24',12.00,36.95);
INSERT INTO ORDER_LINE
VALUES
('51623','KD34',10.00,13.10);
INSERT INTO ORDER_LINE
VALUES
('51625','MT03',8.00,45.79);

#5. DISPLAY THE TABLE CONTENTS TO VERIFY DATA ACCURACY

SELECT * FROM REP;
SELECT * FROM CUSTOMER;
SELECT * FROM ORDERS;
SELECT * FROM ITEM;
SELECT * FROM ORDER_LINE;

# Close the logfile before logging out

# 1. List the item number, description, and price for all items.
SELECT ITEM_NUM, DESCRIPTION, PRICE FROM ITEM;

# 2. List all rows and columns for the complete ORDERS table.
SELECT * FROM ORDERS;

# 3. List the names of customers with credit limits of $10,000 or more.
SELECT * FROM CUSTOMER WHERE CREDIT_LIMIT >= 10000;

# 4. List the order number for each order placed by customer number 126 on 10/15/2015. (Hint: If you need help, use the discussion of the DATE data type in Figure 3-16 in Chapter 3.)

SELECT ORDER_NUM FROM ORDERS WHERE CUSTOMER_NUM = 126 AND ORDER_DATE = '2015-10-15';

# 5. List the number and name of each customer represented by sales rep 30 or sales rep 45.
SELECT CUSTOMER_NUM, CUSTOMER_NAME FROM CUSTOMER WHERE REP_NUM IN (30, 45);

# 6. List the item number and description of each item that is not in category PZL.
SELECT ITEM_NUM, DESCRIPTION FROM ITEM WHERE NOT CATEGORY = 'PZL';

# 7. List the item number, description, and number of units on hand for each item that has between 20 and 40 units on hand, including both 20 and 40. Do this two ways.
SELECT ITEM_NUM, DESCRIPTION, ON_HAND FROM ITEM WHERE ON_HAND >= 20 AND ON_HAND <= 40;
SELECT ITEM_NUM, DESCRIPTION, ON_HAND FROM ITEM WHERE ON_HAND BETWEEN 20 AND 40;

# 8. List the item number, description, and on-hand value (units on hand * unit price) of each item in category TOY. (On-hand value is really units on hand * cost, but there is no COST column in the ITEM table.) Assign the name ON_HAND_VALUE to the computed column.
SELECT ITEM_NUM, DESCRIPTION, (ON_HAND * PRICE) AS ON_HAND_VALUE FROM ITEM WHERE CATEGORY = 'TOY';

# 9. List the item number, description, and on-hand value for each item whose on-hand value is at least $1,500. Assign the name ON_HAND_VALUE to the computed column.
SELECT ITEM_NUM, DESCRIPTION, (ON_HAND * PRICE) AS ON_HAND_VALUE FROM ITEM WHERE (ON_HAND * PRICE) >= 1500;

# 10. Use the IN operator to list the item number and description of each item in category GME or PZL.
SELECT ITEM_NUM, DESCRIPTION FROM ITEM WHERE CATEGORY IN ('GME', 'PZL');

# 11. Find the number and name of each customer whose name begins with the letter “C.”
SELECT CUSTOMER_NUM, CUSTOMER_NAME FROM CUSTOMER WHERE CUSTOMER_NAME LIKE 'C%';

# 12. List all details about all items. Order the output by description.
SELECT * FROM ITEM ORDER BY DESCRIPTION;

# 13. List all details about all items. Order the output by item number within storehouse. (That is, order the output by storehouse and then by item number.)
SELECT * FROM ITEM ORDER BY STOREHOUSE, ITEM_NUM;

# 14. How many customers have balances that are more than their credit limits?
SELECT COUNT(CUSTOMER_NAME) FROM CUSTOMER WHERE BALANCE > CREDIT_LIMIT;

# 15. Find the total of the balances for all customers represented by sales rep 15 with balances that are less than their credit limits.
SELECT SUM(BALANCE) FROM CUSTOMER WHERE REP_NUM = 15 AND BALANCE < CREDIT_LIMIT;

# 16. List the item number, description, and on-hand value of each item whose number of units on hand is more than the average number of units on hand for all items. (Hint: Use a subquery.)
SELECT ITEM_NUM, DESCRIPTION, (ON_HAND * PRICE) AS ON_HAND_VALUE FROM ITEM WHERE ITEM_NUM > (SELECT AVG(ITEM_NUM) FROM ITEM);

# 17. What is the price of the least expensive item in the database?
SELECT MIN(PRICE) FROM ITEM;

# 18. What is the item number, description, and price of the least expensive item in the database? (Hint: Use a subquery.)
SELECT ITEM_NUM, DESCRIPTION, PRICE FROM ITEM WHERE (SELECT MIN(PRICE) FROM ITEM);

# 19. List the sum of the balances of all customers for each sales rep. Order and group the results by sales rep number.
SELECT REP_NUM, SUM(BALANCE) FROM CUSTOMER GROUP BY REP_NUM ORDER BY REP_NUM ASC;

# 20. List the sum of the balances of all customers for each sales rep, but restrict the output to those sales reps for which the sum is more than $5,000. Order the results by sales rep number.
SELECT REP_NUM, SUM(BALANCE) FROM CUSTOMER GROUP BY REP_NUM HAVING SUM(BALANCE) > 5000 ORDER BY REP_NUM ASC;


# 21. List the item number of any item with an unknown description.
SELECT ITEM_NUM FROM ITEM WHERE DESCRIPTION IS NULL;

# 22. List the item number and description of all items that are in the PZL or TOY category and contain the word “Set” in the description.
SELECT ITEM_NUM, DESCRIPTION FROM ITEM WHERE CATEGORY IN ('PZL', 'TOY') AND DESCRIPTION LIKE '%Set%'; 

# 23. TAL Distributors is considering discounting the price of all items by 10 percent. List the item number, description, and discounted price for all items. Use DISCOUNTED_PRICE as the name for the computed column.
SELECT ITEM_NUM, DESCRIPTION, (ROUND((PRICE * 0.9), 2)) AS DISCOUNTED_PRICE FROM ITEM;


notee


