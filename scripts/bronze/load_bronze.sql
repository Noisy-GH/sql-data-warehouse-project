/*
=========================================================
TRUNCATE & LOAD
+
DURATION
=========================================================
Script Purpose:
1) Truncate & Load
Truncate para limpar as tabelas já que vamos fazer um full load.
LOAD DATA LOCAL INFILE...


2) Duration
Adiciona os SETS que contam a duração (start_time e end_time) para cada load, e depois um SELECT que mostra a duração de cada load em segundos. 
Assim, você pode monitorar o desempenho do processo de load 
e identificar se algum dos arquivos está demorando mais do que o esperado para ser carregado.

Também fazemos um total load duration, setando uma @ no começo de tudo e um @ no final, 
e por último um select para mostrar a duração total do processo de load.

=========================================================

*/

-- Início do processo de load
SET @total_start_time = NOW();



-- CRM_CUST_INFO
SET @start_time = NOW();

Truncate table DataWareHouse.crm_cust_info;
LOAD DATA LOCAL INFILE '/Users/felipemonteiro/SqlFiles/CURSO_SQL_30H/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
into table DataWareHouse.crm_cust_info
CHARACTER SET utf8mb4
fields terminated by ','
LINES TERMINATED BY '\r\n'
ignore 1 rows
(cst_id, cst_key, cst_firstname, cst_lastname, cst_marital_status, cst_gndr, cst_create_date);

SET @end_time = NOW();

SELECT 
    'crm_cust_info load completed' AS message,
    TIMESTAMPDIFF(SECOND, @start_time, @end_time) AS duration_seconds;







-- CRM_PRD_INFO

SET @start_time = NOW();

Truncate table DataWareHouse.crm_prd_info;
LOAD DATA LOCAL INFILE '/Users/felipemonteiro/SqlFiles/CURSO_SQL_30H/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
into table DataWareHouse.crm_prd_info
CHARACTER SET utf8mb4
fields terminated by ','
LINES TERMINATED BY '\r\n'
ignore 1 rows
(prd_id, prd_key, prd_nm, prd_cost, prd_line, prd_start_dt, prd_end_dt);

SET @end_time = NOW();

SELECT 
    'crm_prd_info load completed' AS message,
    TIMESTAMPDIFF(SECOND, @start_time, @end_time) AS duration_seconds;








-- CRM_SALES_DETAILS

SET @start_time = NOW();

truncate table DataWareHouse.crm_sales_details;
LOAD DATA LOCAL INFILE '/Users/felipemonteiro/SqlFiles/CURSO_SQL_30H/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
into table DataWareHouse.crm_sales_details
CHARACTER SET utf8mb4
fields terminated by ','
LINES TERMINATED BY '\r\n'
ignore 1 rows
(sls_ord_num, sls_prd_key, sls_cust_id, sls_order_dt, sls_ship_dt, sls_due_dt, sls_sales, sls_quantity, sls_price);

SET @end_time = NOW();

SELECT 
    'crm_sales_details load completed' AS message,
    TIMESTAMPDIFF(SECOND, @start_time, @end_time) AS duration_seconds;







-- ERP_CUST_AZ12
SET @start_time = NOW();
truncate table DataWareHouse.erp_cust_az12;
LOAD DATA LOCAL INFILE '/Users/felipemonteiro/SqlFiles/CURSO_SQL_30H/sql-data-warehouse-project/datasets/source_erp/cust_az12.csv'
into table DataWareHouse.erp_cust_az12
CHARACTER SET utf8mb4
fields terminated by ','
LINES TERMINATED BY '\r\n'
ignore 1 rows
(CID, BDATE, GEN);
SET @end_time = NOW();
SELECT 
    'erp_cust_az12 load completed' AS message,
    TIMESTAMPDIFF(SECOND, @start_time, @end_time) AS duration_seconds;








-- ERP_LOC_A101
SET @start_time = NOW();

truncate table DataWareHouse.erp_loc_a101;
LOAD DATA LOCAL INFILE '/Users/felipemonteiro/SqlFiles/CURSO_SQL_30H/sql-data-warehouse-project/datasets/source_erp/loc_a101.csv'
into table DataWareHouse.erp_loc_a101
CHARACTER SET utf8mb4
fields terminated by ','
LINES TERMINATED BY '\r\n'
ignore 1 rows
(CID, CNTRY);
SET @end_time = NOW();
SELECT 
    'erp_loc_a101 load completed' AS message,
    TIMESTAMPDIFF(SECOND, @start_time, @end_time) AS duration_seconds;







-- ERP_PX_CAT_G1V2
SET @start_time = NOW();

truncate table DataWareHouse.erp_px_cat_g1v2;
LOAD DATA LOCAL INFILE '/Users/felipemonteiro/SqlFiles/CURSO_SQL_30H/sql-data-warehouse-project/datasets/source_erp/px_cat_g1v2.csv'
into table DataWareHouse.erp_px_cat_g1v2
CHARACTER SET utf8mb4
fields terminated by ','
LINES TERMINATED BY '\r\n'
ignore 1 rows
(ID, CAT, SUBCAT, MAINTENANCE);
SET @end_time = NOW();
SELECT 
    'erp_px_cat_g1v2 load completed' AS message,
    TIMESTAMPDIFF(SECOND, @start_time, @end_time) AS duration_seconds;


-- Total Load Duration
SET @total_end_time = NOW();
SELECT 
    'Total load duration' AS message,
    TIMESTAMPDIFF(SECOND, @total_start_time, @total_end_time) AS duration_seconds;
