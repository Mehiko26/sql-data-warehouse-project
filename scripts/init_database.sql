/** 
===============================
Create database and schemas
===============================
script purpose :
The script creates a new database 'DataWarehouse' and schemas 'bronze','silver','gold' after dropping the old one if any exists
**/
WARNING:
    Running this script will drop the entire 'DataWarehouse'. Ensure to make a backup before running it.
--- Drop and recreate the 'DataWarehouse' database
USE [master]
GO
  
IF EXISTS (SELECT 1 FROM sys.databases WHERE name ='DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET  SINGLE_USER WITH ROLLABCK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO
  
/****** Object:  Database [DataWarehouse]    Script Date: 06/04/2026 13:20:54 ******/
CREATE DATABASE [DataWarehouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DataWarehouse', FILENAME = N'D:\DEFAULT\DATA\DataWarehouse.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DataWarehouse_log', FILENAME = N'L:\DEFAULT\LOG\DataWarehouse_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DataWarehouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

--Create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO
  
CREATE SCHEMA gold;
GO
