/* 
=================================================================================
Created BULK INSERT script for loading source files into tables in the bronze layer
and convert it into a stored procedure
==================================================================================
create this for all source files
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @Start_time DATETIME,
		@End_time DATETIME,
		@Batch_start_time DATETIME,
		@Batche_end_time DATETIME;
	BEGIN TRY
	Set @Batch_start_time =GETDATE();
	PRINT '====================================================================';
	PRINT 'Loading Bronze Layer';
	PRINT '====================================================================';

	PRINT '--------------------------------------------------------------------';
	PRINT 'Loading CRM Tables';
	PRINT '--------------------------------------------------------------------';

	SET @Start_time= GETDATE();
	PRINT '>> Truncating Table: bronze.crm_cust_info';
	TRUNCATE TABLE [bronze].[crm_cust_info]

	PRINT '>> Inserting Data Into Table: bronze.crm_cust_info';
BULK INSERT [bronze].[crm_cust_info]
FROM 'C:\Users\okonk\Downloads\sql-data-warehouse-project\datasets\source_crm\cust_info.CSV'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
);
	SET @End_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
	PRINT '>> ---------------------------------';


	SET @Start_time= GETDATE();
	PRINT '>> Truncating Table: bronze.crm_prd_info';
	TRUNCATE TABLE [bronze].[crm_prd_info]

	PRINT '>> Inserting Data Into Table: bronze.crm_prd_info';
BULK INSERT [bronze].[crm_prd_info]
FROM 'C:\Users\okonk\Downloads\sql-data-warehouse-project\datasets\source_crm\prd_info.CSV'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
);
	SET @End_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
	PRINT '>> ---------------------------------';


	SET @Start_time= GETDATE();
	PRINT '>> Truncating Table: bronze.crm_sales_details';
	TRUNCATE TABLE [bronze].[crm_sales_details]

	PRINT '>> Inserting Data Into Table: bronze.crm_sales_details';
BULK INSERT [bronze].[crm_sales_details]
FROM 'C:\Users\okonk\Downloads\sql-data-warehouse-project\datasets\source_crm\sales_details.CSV'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
);
	SET @End_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
	PRINT '>> ---------------------------------';


	PRINT '--------------------------------------------------------------------';
	PRINT 'Loading ERP Tables';
	PRINT '--------------------------------------------------------------------';

	SET @Start_time= GETDATE();
	PRINT '>> Truncating Table: bronze.erp_cust_az12';
	TRUNCATE TABLE [bronze].[erp_cust_az12]

	PRINT '>> Inserting Data Into Table: bronze.erp_cust_az12';
BULK INSERT [bronze].[erp_cust_az12]
FROM 'C:\Users\okonk\Downloads\sql-data-warehouse-project\datasets\source_erp\cust_az12.CSV'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
);
	SET @End_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
	PRINT '>> ---------------------------------';


	SET @Start_time= GETDATE();
	PRINT '>> Truncating Table: bronze.erp_loc_a101';
	TRUNCATE TABLE [bronze].[erp_loc_a101]

	PRINT '>> Inserting Data Into Table: bronze.erp_loc_a101';
	BULK INSERT [bronze].[erp_loc_a101]
	FROM 'C:\Users\okonk\Downloads\sql-data-warehouse-project\datasets\source_erp\loc_a101.CSV'
	WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
	);
	SET @End_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
	PRINT '>> ---------------------------------';


	SET @Start_time= GETDATE();
	PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
	TRUNCATE TABLE [bronze].[erp_px_cat_g1v2]

	PRINT '>> Inserting Data Into Table: bronze.erp_px_cat_g1v2';
	BULK INSERT [bronze].[erp_px_cat_g1v2]
	FROM 'C:\Users\okonk\Downloads\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.CSV'
	WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
	);
	SET @End_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
	PRINT '>> ---------------------------------';

	SET @Batche_end_time = GETDATE ();
	PRINT '===================================================================='
	PRINT 'Loading Bronze Layer is Completed';
	PRINT '		-Total Load Duration: ' + CAST(DATEDIFF(SECOND, @Batch_start_time, @Batche_end_time) AS NVARCHAR) + 'seconds';
	PRINT '===================================================================='

	END TRY
	BEGIN CATCH
		PRINT '===================================================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'ERROR Message' + ERROR_MESSAGE(); 
		PRINT 'ERROR Message' + CAST (ERROR_MESSAGE() AS NVARCHAR);
		PRINT 'ERROR Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '====================================================================';
	END CATCH
END

