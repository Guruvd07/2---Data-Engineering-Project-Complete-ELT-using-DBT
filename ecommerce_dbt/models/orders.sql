{{ config(materialized='table') }}

SELECT * FROM public.orders
