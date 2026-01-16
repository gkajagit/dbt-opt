{{ config(materialized='table') }}

-- dbt_model: fct_window_spill
-- expected_behavior: severe_window_spill_on_xsmall

SELECT
    l_partkey,
    l_orderkey,
    l_comment,
    SUM(l_extendedprice)
        OVER (
            PARTITION BY l_partkey
            ORDER BY l_comment
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS running_revenue
FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.LINEITEM
