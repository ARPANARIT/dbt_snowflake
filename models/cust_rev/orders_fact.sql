{{ config(materialized='table') }}    

SELECT
    O.O_ORDERKEY,
    O.O_ORDERDATE,
    O.O_CUSTKEY,
    O.O_CLERK,
    
    O.order_status,
        COUNT(DISTINCT O.O_ORDERKEY) AS OrderCount,
    SUM(OI.TotalPrice) AS Revenue,
FROM
    {{ ref('order_stg') }} O
JOIN
    {{ ref('lineitem_stg') }} OI ON O.O_ORDERKEY = OI.L_ORDERKEY

GROUP BY 1,2,3,4,5