{{ config(materialized='table') }}

-- dbt_model: dim_customers_sort
-- expected_behavior: mild_spill_on_xsmall

SELECT
    c_custkey,
    c_name,
    c_nationkey,
    c_acctbal,
    c_comment
FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.CUSTOMER
ORDER BY c_comment;
