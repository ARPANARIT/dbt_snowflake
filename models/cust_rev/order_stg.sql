{{config(materialized='table')}}

SELECT
    O_ORDERKEY,
    O_ORDERDATE,
    O_CUSTKEY,
    O_CLERK,
    case when O_ORDERSTATUS = 'O' then 'Open'
         else 'Fulfilled' end as order_status,
    O_ORDERSTATUS,
    O_TOTALPRICE,
    current_timestamp as dbt_updated_at
    
FROM
    {{ source('snowflake_sample', 'orders') }}