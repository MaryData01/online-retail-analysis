-- ============================================================
-- Online Retail Analysis — Session 1 & 2
-- Database setup, import, data quality investigation, and cleaning
-- ============================================================

-- ------------------------------------------------------------
-- SESSION 1: Setup & Import
-- ------------------------------------------------------------

-- Create a fresh database for this project
CREATE DATABASE online_retail;

-- Connect to it
\c online_retail

-- Create the raw staging table (untouched copy of source data)
CREATE TABLE online_retail_raw (
    invoice_no      VARCHAR(20),
    stock_code      VARCHAR(20),
    description     VARCHAR(255),
    quantity        INTEGER,
    invoice_date    TIMESTAMP,
    unit_price      NUMERIC(10,2),
    customer_id     INTEGER,
    country         VARCHAR(50)
);

-- Import the CSV (adjust path to wherever your file is saved)
\copy online_retail_raw FROM 'C:\Users\HP\Downloads\online_retail.csv' WITH (FORMAT csv, HEADER true, NULL '');

-- Verify the import
SELECT COUNT(*) FROM online_retail_raw;
-- Expected: 541909

SELECT COUNT(*) FROM online_retail_raw WHERE customer_id IS NULL;
-- Expected: 135080

SELECT * FROM online_retail_raw LIMIT 10;


-- ------------------------------------------------------------
-- SESSION 2: Data Quality Investigation & Cleaning
-- ------------------------------------------------------------

-- 1. Investigate "duplicate" rows — are they real dupes or legit repeated entries?
SELECT invoice_no, stock_code, description, quantity, invoice_date, unit_price, customer_id, country, COUNT(*)
FROM online_retail_raw
GROUP BY invoice_no, stock_code, description, quantity, invoice_date, unit_price, customer_id, country
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC
LIMIT 20;

-- Confirm the pattern: same invoice logging one product multiple times as separate lines
SELECT invoice_no, COUNT(DISTINCT stock_code) AS distinct_products, COUNT(*) AS total_lines
FROM online_retail_raw
WHERE invoice_no = '555524'
GROUP BY invoice_no;
-- Result: 39 distinct products but 76 total lines -> confirms split single-unit checkout entries,
-- NOT data errors. Decision: KEEP these rows, do not delete.


-- 2. Investigate cancellations (InvoiceNo starting with 'C')
SELECT COUNT(*) AS cancellation_rows,
       SUM(quantity) AS total_units_cancelled,
       ROUND(SUM(quantity * unit_price)::numeric, 2) AS total_value_cancelled
FROM online_retail_raw
WHERE invoice_no LIKE 'C%';
-- Result: 9288 rows, -277574 units, -£896,812.49
-- Decision: KEEP, but flag with is_cancellation so gross vs net revenue can both be analyzed.


-- 3. Investigate non-product stock codes (postage, fees, discounts, etc.)
SELECT stock_code, description, COUNT(*) AS row_count,
       ROUND(SUM(quantity * unit_price)::numeric, 2) AS total_value
FROM online_retail_raw
WHERE stock_code ~ '^[A-Za-z]+$'
GROUP BY stock_code, description
ORDER BY row_count DESC;
-- Non-merchandise codes identified: POST, DOT, M, m, D, S, AMAZONFEE, CRUK, B
-- Real products (letters-only codes but genuine items): DCGSSGIRL, DCGSSBOY, PADS
-- Decision: KEEP all rows, flag non-merchandise ones with is_merchandise = false.


-- 4. Investigate missing Description rows
SELECT COUNT(*) AS missing_desc_total,
       COUNT(*) FILTER (WHERE unit_price = 0) AS missing_desc_and_zero_price,
       COUNT(*) FILTER (WHERE customer_id IS NULL) AS missing_desc_and_missing_customer
FROM online_retail_raw
WHERE description IS NULL;
-- Result: 1454 rows, 100% overlap with zero price AND missing customer_id
-- Decision: EXCLUDE these rows entirely — no usable transaction data (no product, no price, no customer).


-- 5. Build the clean table with all decisions applied
CREATE TABLE online_retail_clean AS
SELECT
    invoice_no,
    stock_code,
    description,
    quantity,
    invoice_date,
    unit_price,
    customer_id,
    country,
    (invoice_no LIKE 'C%') AS is_cancellation,
    (stock_code NOT IN ('POST','DOT','M','m','D','S','AMAZONFEE','CRUK','B')) AS is_merchandise
FROM online_retail_raw
WHERE description IS NOT NULL;

-- Verify the clean table
SELECT COUNT(*) FROM online_retail_clean;
-- Expected: 540455 (541909 - 1454)

SELECT is_merchandise, COUNT(*) FROM online_retail_clean GROUP BY is_merchandise;
-- Expected: f = 2726, t = 537729

SELECT is_cancellation, COUNT(*) FROM online_retail_clean GROUP BY is_cancellation;
-- Expected: f = 531167, t = 9288

SELECT invoice_no, stock_code, description, quantity, is_cancellation, is_merchandise
FROM online_retail_clean
LIMIT 5;


SELECT COUNT(*) FROM customer_rfm;
-- should be 4339

SELECT * FROM customer_rfm LIMIT 5;