{{config(materialized='table')}}

SELECT
    L_PARTKEY,
    L_ORDERKEY,
    L_QUANTITY,
    L_EXTENDEDPRICE,
    L_QUANTITY * L_EXTENDEDPRICE AS TotalPrice,
    case when L_LINESTATUS = 'O' then 'Open'
         else 'Fulfilled' end as line_status
FROM
    {{ source('snowflake_sample', 'lineitem') }}