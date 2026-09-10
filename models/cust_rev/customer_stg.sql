{{config(materialized='table')}}

SELECT
    C_CUSTKEY,
    C_NAME,
    C_PHONE,
    C_ADDRESS,
    C_NATIONKEY,
    C_ACCTBAL,
    C_MKTSEGMENT
FROM
    {{ source('snowflake_sample', 'customer') }}