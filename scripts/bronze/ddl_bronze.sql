/*
===================================================
DDL Script: Create Bronze Tables
===================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables if hey already exist 
Run this script to re-define the DDL structure of the 'bronze' tables

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
