/*
==============================================================
Create tables in the bronze layer to recieve data from sources
==============================================================
The script is a format used for creating one to one (Schema) of the data from the sources.
The example below is for cust_info table. 
*/

--WARNING: Ensure to take backups of all the tables before running this script to avoid losing data

USE [DataWarehouse]
GO

/****** Object:  Table [bronze].[crm_cust_info]    Script Date: 06/04/2026 14:06:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
if object_id ('bronze.crm_cust_info', 'u') is not null
drop table bronze.crm_cust_info;
CREATE TABLE [bronze].[crm_cust_info](
	[cst_id] [int] NULL,
	[cst_key] [nvarchar](50) NULL,
	[cst_firstname] [nvarchar](50) NULL,
	[cst_lastname] [nvarchar](50) NULL,
	[cst_marital_status] [nvarchar](50) NULL,
	[cst_gndr] [nvarchar](50) NULL,
	[cst_create_date] [date] NULL
) ;
