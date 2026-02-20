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
