/* 
=================================================================================
Created BULK INSERT script for loading source files into tables in the bronze layer
and convert it into a stored procedure
==================================================================================
create this for all source files
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
-- FULL LOAD OF SOURCE FILES INTO BRONZE LAYER
TRUNCATE TABLE [bronze].[crm_cust_info]
BULK INSERT [bronze].[crm_cust_info]
FROM 'C:\Users\okonk\Downloads\sql-data-warehouse-project\datasets\source_crm\cust_info.CSV'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
);

TRUNCATE TABLE [bronze].[crm_prd_info]
BULK INSERT [bronze].[crm_prd_info]
FROM 'C:\Users\okonk\Downloads\sql-data-warehouse-project\datasets\source_crm\prd_info.CSV'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
);

TRUNCATE TABLE [bronze].[crm_sales_details]
BULK INSERT [bronze].[crm_sales_details]
FROM 'C:\Users\okonk\Downloads\sql-data-warehouse-project\datasets\source_crm\sales_details.CSV'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
);

TRUNCATE TABLE [bronze].[erp_cust_az12]
BULK INSERT [bronze].[erp_cust_az12]
FROM 'C:\Users\okonk\Downloads\sql-data-warehouse-project\datasets\source_erp\cust_az12.CSV'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
);

TRUNCATE TABLE [bronze].[erp_loc_a101]
BULK INSERT [bronze].[erp_loc_a101]
FROM 'C:\Users\okonk\Downloads\sql-data-warehouse-project\datasets\source_erp\loc_a101.CSV'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
);

TRUNCATE TABLE [bronze].[erp_px_cat_g1v2]
BULK INSERT [bronze].[erp_px_cat_g1v2]
FROM 'C:\Users\okonk\Downloads\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.CSV'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
);
END
