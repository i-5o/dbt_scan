---source table from matrix team
select *FROM {{ source('public','scan_event_prod') }}