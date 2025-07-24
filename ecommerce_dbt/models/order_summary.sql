{{ config(materialized='table') }}

SELECT
  product,
  COUNT(*) AS total_orders,
  SUM(amount) AS total_revenue
FROM {{ ref('orders') }}
GROUP BY product
