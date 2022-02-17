---add utc_timestamps column and convert it to Eastern timezone----
with cte as (SELECT 
             scanned_at,
             station_id,
             assignment_id,
             part_number
            from {{ ref('new_matrix_source') }})
            
 select *,
      convert_timezone('UTC','America/New_York',scanned_at) AS local_Timestamp,
      date_trunc('minute',dateadd(second,'60',local_Timestamp)) as added_time

from cte
