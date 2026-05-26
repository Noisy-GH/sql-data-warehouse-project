/*
======================================================
Create Database and Schemas
======================================================
Script Purpose:
This script creates a new database named 'DataWareHouse' after checking if it already exists.

WARNING:
Running this script will drop the entire 'DataWareHouse' database if it already exists. All data in the database will be permanently deleted.



*/

-- Drop and recreate the DataWareHouse database if necessary
DROP DATABASE IF EXISTS DataWareHouse;

CREATE DATABASE DataWareHouse;
