---add utc_timestamps column and convert it to Eastern timezone
with cte as (SELECT 
             scanned_at,
             date_trunc('minute',scanned_at +interval '2' second) as utc_timestamps,
             station_id,
             assignment_id,
             part_number
            from {{ ref('new_matrix_source') }})
select *,
      convert_timezone('UTC','America/New_York',utc_timestamps) AS local_Timestamp
from cte
