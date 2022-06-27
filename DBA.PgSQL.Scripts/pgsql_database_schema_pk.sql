select kcu.table_schema, kcu.table_name, tco.constraint_name, string_agg(kcu.column_name,', ') as key_columns
from information_schema.table_constraints tco
join information_schema.key_column_usage kcu  on kcu.constraint_name = tco.constraint_name
and kcu.constraint_schema = tco.constraint_schema and kcu.constraint_name = tco.constraint_name
where tco.constraint_type = 'PRIMARY KEY'
group by tco.constraint_name,  kcu.table_schema, kcu.table_name
order by kcu.table_schema, kcu.table_name; 
