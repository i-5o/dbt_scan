with cte as (SELECT date_trunc('minute',scanned_at) as utc_timestamps,station_id,assignment_id,part_number
 from {{ ref('new_matrix_source') }})
select *,convert_timezone('UTC','America/New_York',utc_timestamps)  AS
       local_Timestamp from cte
