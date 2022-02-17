----joned table--
with cte as (select m.station_id,
                    m.scanned_at,
                    m.local_timestamp,
                    m.assignment_id,
                    m.part_number,
                    q.part_detected 
                    from {{ ref('int_new_matrix') }} m
     left JOIN  {{ ref('int_new_qc') }} q
ON 
    m.station_id =q.station_detected and
    m.added_time=q.detected_timestamp
    and m.part_number=q.part_detected
order by m.added_time desc)
select * from cte  order by local_timestamp desc  

