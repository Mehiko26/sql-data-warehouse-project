/* 
=================================================================================
Created BULK INSERT script for loading source files into tables in the bronze layer
==================================================================================
create this for all source files
*/

-- FULL LOAD OF SOURCE FILE INTO BRONZE LAYER TABLE IE A REFRESH
TRUNCATE TABLE [bronze].[crm_cust_info]
BULK INSERT [bronze].[crm_cust_info]
FROM 'C:\Users\okonk\Downloads\sql-data-warehouse-project\datasets\source_crm\cust_info.CSV'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR =',',
	TABLOCK
);
