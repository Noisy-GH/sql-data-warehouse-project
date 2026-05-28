/* CREATE TABLES
ATENÇÃO PARA OS TIPOS E A NOMENCLATURA
COLOCAR OS NOMES DAS SOURCES NO COMEÇO DE CADA TABLE APÓS O NOME DO DATABASE (AQUI CRM OU ERP*/

DROP TABLE if EXISTS DataWareHouse.crm_cust_info;

CREATE TABLE DataWareHouse.crm_cust_info (
cst_id int,
cst_key varchar(50),
cst_firstname varchar(50),
cst_lastname varchar(50),
cst_marital_status varchar(50),
cst_gndr varchar(50),
cst_create_date datetime
);

select * from datawarehouse.crm_cust_info;

DROP TABLE if EXISTS DataWareHouse.crm_prd_info;

CREATE TABLE DataWareHouse.crm_prd_info (
prd_id int,
prd_key varchar(50),
prd_nm varchar(50),
prd_cost int,
prd_line varchar(50),
prd_start_dt datetime,
prd_end_dt datetime
);


DROP TABLE if EXISTS DataWareHouse.crm_sales_details;

CREATE TABLE DataWareHouse.crm_sales_details (
sls_ord_num VARCHAR(50),
sls_prd_key VARCHAR(50),
sls_cust_id INT,
sls_order_dt int,
sls_ship_dt int,
sls_due_dt int,
sls_sales int,
sls_quantity int,
sls_price int
);


DROP TABLE if EXISTS DataWareHouse.erp_cust_az12;

CREATE TABLE DataWareHouse.erp_cust_az12 (
CID VARCHAR(50),
BDATE DATE,
GEN VARCHAR(50)
);

DROP TABLE if EXISTS DataWareHouse.erp_loc_a101;

CREATE TABLE DataWareHouse.erp_loc_a101 (
CID VARCHAR(50),
CNTRY VARCHAR(50)
);

DROP TABLE if EXISTS DataWareHouse.erp_px_cat_g1v2;

CREATE TABLE DataWareHouse.erp_px_cat_g1v2 (
ID VARCHAR(50),
CAT VARCHAR(50),
SUBCAT VARCHAR(50),
MAINTENANCE VARCHAR(50)
);
