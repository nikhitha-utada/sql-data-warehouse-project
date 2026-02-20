/*
 BULK INSERT command is to insert large amount of data from file to database
 SYNTAX:
 =======
	BULK INSERT [database_name].[schema_name].[table_name]
    FROM 'path_to_file'
    WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    BATCHSIZE = 10000,
    TABLOCK (Used to lock the table while the data is being inserted)
);
*/
-- As they are used very often we have to store them under stored procedure
/*
DROP PROCEDURE IF EXISTS bronze.load_bronze;
GO
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze as
    
    BEGIN

        BEGIN TRY
            /*    ==============  INSERTING DATA INTO CUST_INFO  =================   */
            -- we are truncating and inserting the data so that every time we make any changes it can be updated without error
            print '********** LOADING BRONZE LAYER **********';
            print '********** LOADING cust.info **********'
            TRUNCATE TABLE bronze.crm_cust_info;
            BULK INSERT bronze.crm_cust_info
            FROM 'C:\Users\ADMIN\Desktop\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
            WITH (
            FIELDTERMINATOR = ',',
            FIRSTROW = 2,
            TABLOCK
            );

            /*    ==============  INSERTING DATA INTO PRD_INFO  =================   */
            -- we are truncating and inserting the data so that every time we make any changes it can be updated without error
            print '********** LOADING prod.info **********'
            TRUNCATE TABLE bronze.crm_prd_info;
            BULK INSERT bronze.crm_prd_info
            FROM 'C:\Users\ADMIN\Desktop\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
            WITH (
            FIELDTERMINATOR = ',',
            FIRSTROW = 2,
            TABLOCK
            );

            /*    ==============  INSERTING DATA INTO SALES_DETAILS  =================   */
            -- we are truncating and inserting the data so that every time we make any changes it can be updated without error
            print '********** LOADING sales details **********'
            TRUNCATE TABLE bronze.crm_sales_details;
            BULK INSERT bronze.crm_sales_details
            FROM 'C:\Users\ADMIN\Desktop\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
            WITH (
            FIELDTERMINATOR = ',',
            FIRSTROW = 2,
            TABLOCK
            );

            /*    ==============  INSERTING DATA INTO CUST_aZ12  =================   */
            -- we are truncating and inserting the data so that every time we make any changes it can be updated without error
            print '********** LOADING cust.az12 **********'
            TRUNCATE TABLE bronze.erp_cust_az12;
            BULK INSERT bronze.erp_cust_az12
            FROM 'C:\Users\ADMIN\Desktop\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
            WITH (
            FIELDTERMINATOR = ',',
            FIRSTROW = 2,
            TABLOCK
            );

            /*    ==============  INSERTING DATA INTO LOCX_A101  =================   */
            -- we are truncating and inserting the data so that every time we make any changes it can be updated without error
            print '********** LOADING locz.a101 **********'
            TRUNCATE TABLE bronze.erp_locx_a101;
            BULK INSERT bronze.erp_locx_a101
            FROM 'C:\Users\ADMIN\Desktop\sql-data-warehouse-project\datasets\source_erp\LOCX_A101.csv'
            WITH (
            FIELDTERMINATOR = ',',
            FIRSTROW = 2,
            TABLOCK
            );

            /*    ==============  INSERTING DATA INTO PX_CAT_GV12  =================   */
            -- we are truncating and inserting the data so that every time we make any changes it can be updated without error
            print '********** LOADING px_cat_gv12 **********'
            TRUNCATE TABLE bronze.erp_px_cat_gv12;
            BULK INSERT bronze.erp_px_cat_gv12
            FROM 'C:\Users\ADMIN\Desktop\sql-data-warehouse-project\datasets\source_erp\PX_CAT_GV12.csv'
            WITH (
            FIELDTERMINATOR = ',',
            FIRSTROW = 2,
            TABLOCK
            );
        END TRY

        BEGIN CATCH
            print 'Error message: '+ ERROR_MESSAGE();
            print 'Error number: '+ CAST(ERROR_NUMBER() AS NVARCHAR(50));
        END CATCH  
   END;
GO
EXEC bronze.load_bronze;
GO

