with cte as (select m.station_id,m.local_timestamp,m.assignment_id,m.part_number,q.part_detected from {{ ref('int_new_matrix') }} m
     left JOIN  {{ ref('int_new_qc') }} q
ON 
    m.station_id =q.station_detected and
    m.local_timestamp=q.detected_timestamp
    and m.part_number=q.part_detected
order by m.local_timestamp desc)
select * from cte 

