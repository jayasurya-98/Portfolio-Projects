
-- Objective: Analyze and clean customer data to gain insights for better marketing strategies -- 

-- Create Database Customer data-- 

CREATE DATABASE Customer_data;

USE customer_data;

-- Create Table -- 

CREATE TABLE customer_data 
(customer_id INT ,
 name VARCHAR(30),
 email varchar(30),
 age INT , 
 gender VARCHAR(10), 
 registration_date date,
 purchase_amount INT);

SELECT * FROM customer_data;

-- Inserting values -- 

INSERT INTO customer_data 
values(01, 'Josehva', 'Josehva98@gmail.com', 32, 'Male', '2021-09-21', 21000 ),
(02, 'William', 'William765@gmail.com', 37, 'Male', '2021-10-12', 29000 ),
(03, 'Stella', 'Stellajohn@gmail.com', 28, 'Female', '2021-10-16', 20000 ),
(04, 'Mary', 'Mary234@gmail.com', 42, 'Female', '2021-10-18', 51000 ),
(05, 'Alexander', 'Alexander8@gmail.com', 32, 'Male', '2021-09-21', 30000 ),
(06, 'Rooney', 'Roonetbat@gmail.com', 33, 'Male', '2021-10-21', 34000 ),
(07, 'SteveHon', 'Stevehon@gmail.com', 32, 'Male', '2021-09-21', 22000 ),
(08, 'Lavin', 'Lavindrew@gmail.com', 30, 'Male', '2021-09-11', 65000 ),
(09, 'David', 'david678@gmail.com', 40, 'Male', '2021-11-10', 38000 ),
(10, 'Lexy', 'Lexy0011@gmail.com', 22, 'Female', '2021-10-21', 27000 ),
(11, 'Cheritha', 'Cheritha67@gmail.com', 32, 'Female', '2021-11-21', 29000 ),
(12, 'Alwin', 'Alwin87@gmail.com', 30, 'Male', '2021-09-09', 35000 ),
(13, 'Thomas', 'Thomas98@gmail.com', 41, 'Male', '2021-11-21', 69000 ),
(14, 'Benny', 'Benny45@gmail.com', 36, 'Male', '2021-12-21', 198000 ),
(15, 'Caroline', 'Caroline11@gmail.com', 30, 'Female', '2021-09-21', 87000 ),
(16, 'Sumaiyah', 'Sumaiyah1@gmail.com', 29, 'Female', '2021-10-16', 47000 ),
(17, 'Andrew', 'Andrewvade@gmail.com', 34, 'Male', '2021-12-01', 78000 ),
(18, 'Stephen', 'Stephen56@gmail.com', 42, 'Male', '2021-08-21', 67000 ),
(19, 'Ariae', 'Ariae12@gmail.com', 22, 'Female', '2021-08-21', 48000 ),
(20, 'Bechkham', 'Bechkham21@gmail.com', 37, 'Male', '2022-01-21', 76000 ),
(21, 'Rose', 'Rose56@gmail.com', 27, 'Female', '2022-02-01', 67000 ),
(22, 'Dave', 'Dave98@gmail.com', 32, 'Male', '2021-09-21', 66000 ),
(23, 'Joe', 'Joe467@gmail.com', 38, 'Male', '2022-01-21', 69000 ),
(24, 'Harry', 'Harry6@gmail.com', 34, 'Male', '2022-03-03', 78000 ),
(25, 'Stew', 'Stew45@gmail.com', 29, 'Male', '2022-01-21', 87000 ),
(26, 'Ashifa', 'Ashifa8@gmail.com', 30, 'Female', '2022-10-04', 90000 ),
(27, 'Amitshaw', 'Amitshaw2@gmail.com', 50, 'Male', '2022-05-21', 167000 ),
(28, 'Crevan', 'Crevanrow@gmail.com', 39, 'Male', '2021-12-04', 79000 ),
(29, 'Tight', 'Tight21@gmail.com', 42, 'Male', '2022-05-02', 98000 ),
(30, 'Kevin', 'kevin78@gmail.com', 34, 'Male', '2022-06-21', 159000 );



-- Step 1: Data Exploration--

-- Check the first few rows of the data: --

SELECT * FROM customer_data
LIMIT 5;

-- Get summary statistics: --

SELECT
    COUNT(*) AS total_customers,
    AVG(age) AS average_age,
    MAX(purchase_amount) AS max_purchase
FROM customer_data;

-- Explore unique values in the 'gender' column:--

SELECT DISTINCT gender FROM customer_data;

-- Find the top 10 customers by purchase amount:--

SELECT
    customer_id,
    name,
    purchase_amount
FROM customer_data
ORDER BY purchase_amount DESC
LIMIT 10;


-- Step 2: Data Cleaning-- 

-- Handling missing values: Identify and replace missing values, if any, in the 'email' column. --

UPDATE customer_data
SET email = 'unknown@example.com'
WHERE email IS NULL;

-- Remove duplicate records: Remove any duplicate rows from the dataset.--

DELETE FROM customer_data
WHERE customer_id NOT IN (
    SELECT MIN(customer_id)
    FROM customer_data
    GROUP BY name, email );
    
-- Fix inconsistent gender values: Standardize the 'gender' column values to 'Male,' 'Female,' and 'Other.'-- 

UPDATE customer_data
SET gender = 'Male'
WHERE gender IN ('M', 'male', 'MALE');

UPDATE customer_data
SET gender = 'Female'
WHERE gender IN ('F', 'female', 'FEMALE');

UPDATE customer_data
SET gender = 'Other'
WHERE gender IS NULL OR gender NOT IN ('Male', 'Female');

-- Step 3: Final Data Check-- 

-- Check for any remaining data issues:-- 

SELECT
    gender,
    COUNT(*) AS count
FROM customer_data
GROUP BY gender;

-- Verify the cleaned data:-- 

SELECT * FROM customer_data
LIMIT 5;