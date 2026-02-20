/*
***************** This script is used to build the bronze layer***************
================================================================================================
 This layer loads the data as-is without any transformations on the data for debugging purposes
 ================================================================================================
STEPS INVOLVED:	
===============
	# create table structure using ddl from sources
	# insert data from csv files into tables using bulk insert
	# load the data into the bronze layer using stored procedures

  ****************** CONCEPTS USED *******************
	# DDL CREATE
	# TRUNCATE (to truncate the table before creating it)
	# BULK INSERT 
	# DATETIME FUNCTIONS (to calculate the time taken to load the data)
	# PRINT FUNCTION (to print messages on the console)
	# STORED PROCEDURES (to load the data)
	# TRY CATCH BLOCKS (to handle errors if thrown)
*/

/* 
		================= CRM SOURCE =====================
		# cust_info
		# prd_info
		# sales_details		
*/

--  ========================= TABLE - 1 =================================
/*This means if we find any table with the following name then drop it. 
so we can run it many times without getting any error */
IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info;

-- create 1st table structure using create command
CREATE TABLE bronze.crm_cust_info
(
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);

-- To check if we got all the rows
SELECT * FROM bronze.crm_cust_info;


--  ========================= TABLE - 2 =================================
/*This means if we find any table with the following name then drop it. 
so we can run it many times without getting any error */
IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info;

-- create 2nd table structure using create command
CREATE TABLE bronze.crm_prd_info	
(
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATETIME,
	prd_end_dt DATETIME
);

-- To check if we got all the rows
SELECT * FROM bronze.crm_prd_info;

--  ========================= TABLE - 3 =================================
/*This means if we find any table with the following name then drop it. 
so we can run it many times without getting any error */
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details;

-- create 3rd table structure using create command
CREATE TABLE bronze.crm_sales_details	
(
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);

-- To check if we got all the rows
SELECT * FROM bronze.crm_sales_details;
