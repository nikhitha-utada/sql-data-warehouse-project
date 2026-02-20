/*
	This script is used to create a database and schemas
	1) Create a new database
	2) switch to the new database
	3) Create 3 schemas for 3 layers
*/


-- Switching to the main DB
USE master;
GO

-- Creating new DB
CREATE DATABASE DatawareHouse;
GO

-- Switching to datawarehouse DB
USE DatawareHouse;
GO

-- Create schemas for 3 layers 
CREATE SCHEMA bronze;
GO  -- GO separates multiple SQL statements
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
