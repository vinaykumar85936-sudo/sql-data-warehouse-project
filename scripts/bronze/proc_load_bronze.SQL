CREATE OR ALTER PROCEDURE Bronze.load_bronze AS
BEGIN
	BEGIN TRY 
	PRINT '............................................'
	PRINT 'Loading Bronze Layer'
	PRINT '........................................'

	PRINT 'Truncating the Bronze.crm_cust_info '

	TRUNCATE TABLE Bronze.crm_cust_info

	PRINT 'Inserting the data into Bronze.crm_cust_info'

	BULK INSERT Bronze.crm_cust_info
	FROM 'D:\SQL-Practice\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
	WITH
	(
	FORMAT = 'CSV',
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
	);

	PRINT 'Truncating the Bronze.crm_prd_info'

	TRUNCATE TABLE Bronze.crm_prd_info 

	PRINT 'Inserting the data into Bronze.crm_prd_info'

	BULK INSERT Bronze.crm_prd_info 
	FROM 'D:\SQL-Practice\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
	WITH 
	(
	FORMAT = 'CSV',
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);

	PRINT 'Truncating the Bronze.crm_sales_details'

	TRUNCATE TABLE Bronze.crm_sales_details

	PRINT 'Inserting the data into Bronze.crm_sales_details'

	BULK INSERT Bronze.crm_sales_details
	FROM 'D:\SQL-Practice\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
	WITH 
	(
	FORMAT = 'CSV',
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);

	PRINT 'Truncating the Bronze.erp_cust_az12'

	TRUNCATE TABLE Bronze.erp_cust_az12

	PRINT 'Inserting the data into Bronze.erp_cust_az12'

	BULK INSERT Bronze.erp_cust_az12
	FROM 'D:\SQL-Practice\sql-data-warehouse-project-main\datasets\source_erp\CUST_AZ12.csv'
	WITH 
	(
	FORMAT = 'CSV',
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);

	PRINT 'Truncating the Bronze.erp_loc_a101'


	TRUNCATE TABLE Bronze.erp_loc_a101

	PRINT 'Inserting the data into Bronze.erp_loc_a101'

	BULK INSERT Bronze.erp_loc_a101
	FROM 'D:\SQL-Practice\sql-data-warehouse-project-main\datasets\source_erp\LOC_A101.csv'
	WITH 
	(
	FORMAT = 'CSV',
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);

	PRINT 'Truncating the Bronze.erp_px_cat_g1v2'

	TRUNCATE TABLE Bronze.erp_px_cat_g1v2

	PRINT 'Inserting the data into Bronze.erp_px_cat_g1v2'

	BULK INSERT Bronze.erp_px_cat_g1v2
	FROM 'D:\SQL-Practice\sql-data-warehouse-project-main\datasets\source_erp\PX_CAT_G1V2.csv'
	WITH 
	(
	FORMAT = 'CSV',
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);
	END TRY 
	BEGIN CATCH 

	END CATCH
END;


