---add utc_timestamps column and convert it to Eastern timezone---
with cte as (SELECT 
             scanned_at,
             date_trunc('minute',scanned_at +interval '90' second) as utc_timestamps,
             station_id,
             assignment_id,
             part_number
            from {{ ref('new_matrix_source') }}
            WHERE  part_number IN ('INDPART2801',
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
                                     'ST-ULS4042000-Q' ))
select *,
      convert_timezone('UTC','America/New_York',utc_timestamps) AS local_Timestamp
from cte
