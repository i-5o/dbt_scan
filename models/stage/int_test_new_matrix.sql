---add utc_timestamps column and convert it to Eastern timezone----
{{ config(
    materialized='ephemeral'
)}}
with cte as (SELECT 
             scanned_at,
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
      convert_timezone('UTC','America/New_York',scanned_at) AS local_Timestamp,
      date_trunc('minute',dateadd(second,'60',local_Timestamp)) as added_time

from cte
