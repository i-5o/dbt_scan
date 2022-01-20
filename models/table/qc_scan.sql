{{ config(
    materialized='table'
)}}
select *,CASE
    WHEN part_number = part_detected THEN True
    ELSE  False
END as matched_id 
FROM {{ ref('int_new_join') }}  
order by local_timestamp desc


