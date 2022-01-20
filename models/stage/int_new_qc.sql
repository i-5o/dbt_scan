---removing second and milisecond from timestamp(camera detection)
SELECT REPLACE(station, '-','' ) as station_detected ,
       parts_number as part_detected,
       date_trunc('minute',timestamp) as detected_timestamp 
from {{ ref('new_qc_left_source') }} 
group by station_detected ,detected_timestamp,part_detected 