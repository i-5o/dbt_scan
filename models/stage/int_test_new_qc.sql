---removing second and milisecond from timestamp(camera detection)
{{ config(
    materialized='ephemeral'
)}}
SELECT REPLACE(station, '-','' ) as station_detected ,
       --parts_number as part_detected1--
       replace(replace(replace
       (parts_number, 'ST-UTP544056100-', 'ST-UTP544056100-Q')  
       ,'ST-UTP548056100-', 'ST-UTP548056100-Q') 
       , 'ST-UTP54D056100-', 'ST-UTP54D056100-Q') as part_detected,  
        date_trunc('minute',timestamp) as detected_timestamp 
from {{ ref('new_qc_left_source') }}
WHERE  part_detected IN ('INDPART2801',
'INDPART2802'
'ST Lateral Pad',
'INDPART2803',
'ST-UTP544056100-Q',
'Pad ST-UTP548056100-Q',
'Pad ST-UTP54D056100-Q',
'INDPART2804',
'INDPART2805',
'INDPART2854',
'POS140428',
'POS140429',
'ST-UTTP5-Q',
'ST-UTTP7-Q',
'INDPART2677',
'INDPART2896',
'ST-TWBLT-QL-L',
'ST-TWBLT-QL-R',
'ST-ULS4042000-Q' ) 
group by station_detected ,detected_timestamp,part_detected 