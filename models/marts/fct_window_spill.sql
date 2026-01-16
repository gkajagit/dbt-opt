{{ config(materialized='table') }}

-- dbt_model: fct_window_spill
-- expected_behavior: window_function_spill

SELECT
    l_partkey,
    l_orderkey,
    SUM(l_extendedprice)
        OVER (PARTITION BY l_partkey ORDER BY l_orderkey)
        AS running_revenue
FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.LINEITEM