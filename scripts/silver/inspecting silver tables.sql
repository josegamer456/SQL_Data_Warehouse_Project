--Check For Nulls or Duplicates in Primary Key
--Expectation: No Result

SELECT
    cst_id,
    COUNT(*)
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL


--Check for unwanted Spaces
--Expectation: No results
SELECT cst_firstname
FROM bronze.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

SELECT cst_lastname
FROM bronze.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)

--Data Standarization & Consistency
SELECT DISTINCT cst_gndr
FROM bronze.crm_cust_info



--SILVER------------------------------

SELECT
    cst_id,
    COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL


--Check for unwanted Spaces
--Expectation: No results
SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

SELECT cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)

--Data Standarization & Consistency
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info

SELECT * FROM silver.crm_cust_info


/*
=======================================================================
                        CRM PRD INFO INSPECTING
=======================================================================
*/


SELECT
    cst_id,
    COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

--Check for unwanted Spaces
--Expectation: No results
SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)


--Check for Nulls or Negative Numbers
--Expectation: No Results
SELECT prd_cost
FROM
    silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL


--Data Standarization & Consistency
SELECT DISTINCT prd_line
FROM silver.crm_prd_info

--Check for Invalid Date Orders
SELECT *
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt



/*
===============================================================================================
                                CRM SALES DETAILS INSPECTING
===============================================================================================
*/
--Check for Invalid Dates
SELECT
    NULLIF(sls_order_dt,0) sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_order_dt <= 0
   OR LEN(sls_order_dt) != 8
   OR sls_order_dt > 20500101
   OR sls_order_dt < 19000101


SELECT
    NULLIF(sls_ship_dt,0) sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_ship_dt <= 0
   OR LEN(sls_ship_dt) != 8
   OR sls_ship_dt > 20500101
   OR sls_ship_dt < 19000101

--Check for Invalid Date Orders
SELECT
    *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt OR sls_order_dt > sls_due_dt

--Check Data Consistency: Between Sales, Quantity, and Price
-->> Sales = Quantity * Price
-->> Values must not be Null, zero, or negative.

SELECT DISTINCT
    sls_sales,
    sls_quantity,
    sls_price

FROM
    silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price

SELECT * FROM silver.crm_sales_details


/*
===============================================================================================
                                ERP CUST_AZ12 INSPECTING
===============================================================================================
*/

--Identify Out-of-Range Dates
SELECT DISTINCT
    bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE()

--Data Standardization & Consistency
SELECT DISTINCT
 gen
FROM silver.erp_cust_az12


SELECT *
FROM silver.erp_cust_az12



/*
===============================================================================================
                                ERP LOC A101 INSPECTING
===============================================================================================
*/

SELECT
    cid,
    cntry
FROM
    bronze.erp_loc_a101


--Data Standardization & Consistency
SELECT DISTINCT
    cntry
FROM bronze.erp_loc_a101


SELECT * FROM silver.erp_loc_a101;


/*
===============================================================================================
                                ERP PX CAT G1V2 INSPECTING
===============================================================================================
*/

SELECT
    id,
    cat,
    subcat,
    maintenance
FROM bronze.erp_px_cat_g1v2

--Check for unwanted spaces

SELECT * FROM bronze.erp_px_cat_g1v2
WHERE cat != TRIM(cat) OR subcat != TRIM(subcat) OR subcat != TRIM(maintenance)

--Data Standardization & Consistency
SELECT DISTINCT
    maintenance
FROM bronze.erp_px_cat_g1v2