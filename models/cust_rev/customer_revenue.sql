{{ config(materialized='table') }}

SELECT
    OS.O_CUSTKEY,
    C.C_NAME,
    SUM(OS.OrderCount) AS OrderCount,
    SUM(OS.Revenue) AS Revenue
FROM
    {{ ref('orders_fact') }} OS
JOIN
    {{ ref('customer_stg') }} C ON OS.O_CUSTKEY = C.C_CUSTKEY
GROUP BY
    OS.O_CUSTKEY,
    C.C_NAME