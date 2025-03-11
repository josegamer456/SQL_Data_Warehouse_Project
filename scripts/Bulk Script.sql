TRUNCATE TABLE bronze.crm_cust_info
BULK INSERT bronze.crm_cust_info
FROM
    'C:\Users\Guest04\DataGripProjects\SQL_Data_Warehouse_Project\datasets\source_crm\cust_info.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);


SELECT COUNT(*) FROM bronze.crm_cust_info