{{ config(
    materialized='table'
)}}
select *,CASE
    WHEN part_number = part_detected THEN True
    ELSE  False
END as matched_id 
FROM {{ ref('int_test_join') }}  
order by local_timestamp desc