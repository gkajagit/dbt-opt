{{ config(
    materialized='table',
    snowflake_warehouse='FINOPS_WH',
    pre_hook="ALTER WAREHOUSE FINOPS_WH SET WAREHOUSE_SIZE = 'LARGE'",
    post_hook="ALTER WAREHOUSE FINOPS_WH SET WAREHOUSE_SIZE = 'SMALL'"
) }}
-- dbt_model: dim_customers_sort
-- expected_behavior: sort_spill

SELECT
    *
FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF100.CUSTOMER
ORDER BY c_comment, c_address, c_name