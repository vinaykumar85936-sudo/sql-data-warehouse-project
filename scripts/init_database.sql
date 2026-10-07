/*
  Create database and schemas..

  Script Purpose:
           This script creates a new database named "DataWareHouse" after checking if already 
           exists.
           If the DB exists dropped and recreated. Additionally , the script
           set up three schemas within the DB : 'bronze', 'Silver', 'gold'
*/


use master;
GO


--drop amnd recreate the "DataWareHouse" database

IF EXISTS(SELECT 1 FROM sys.databases WHERE name ='DataWareHouse')
BEGIN
     ALTER DATABASE DataWareHouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
     DROP DATABASE DataWareHouse;
END;
GO

-- create database 'DataWareHouse'

CREATE DATABASE DataWareHouse;
GO

use DataWareHouse;
GO

--create schemas

CREATE SCHEMA Bronze;
GO
CREATE SCHEMA Silver;
GO 
CREATE SCHEMA Gold;
GO

--create tables

-- crm tables

IF OBJECT_ID('Bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE Bronze.crm_cust_info;
GO

CREATE TABLE Bronze.crm_cust_info(
cst_id INT,
cst_key NVARCHAR(50),
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_maritial_status NVARCHAR(50),
cst_gender NVARCHAR(50),
cst_create_date DATE
);
GO

IF OBJECT_ID('Bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
GO


CREATE TABLE Bronze.crm_sales_details (
sls_ord_num NVARCHAR(50),
sls_prd_key NVARCHAR(50),
sls_cust_id INT,
sls_order_dt INT,
sls_ship_dt INT,
sls_due_dt INT,
sls_sales INT,
sls_quantity INT,
sls_price INT
);
GO

IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;
GO


CREATE TABLE Bronze.crm_prd_info (
 prd_id INT,
 prd_key NVARCHAR(50),
 prd_nm NVARCHAR(50),
 prd_cost INT,
 prd_line NVARCHAR(50),
 prd_start_dt DATE,
 prd_end_dt DATE
);
GO

-- erp tables

IF OBJECT_ID('Bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE Bronze.erp_cust_az12;
GO


CREATE TABLE Bronze.erp_cust_az12 (
cid NVARCHAR(50),
bdate DATE,
gen NVARCHAR(50)
);
GO


IF OBJECT_ID('Bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE Bronze.erp_loc_a101;
GO

CREATE TABLE Bronze.erp_loc_a101 (
 cid NVARCHAR(50),
 country NVARCHAR(50)
);
GO

IF OBJECT_ID('Bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE Bronze.erp_px_cat_g1v2;
GO

CREATE TABLE Bronze.erp_px_cat_g1v2 (
  id NVARCHAR(50),
  category NVARCHAR(50),
  sub_cat NVARCHAR(50),
  maintenance NVARCHAR(50)
);
GO
