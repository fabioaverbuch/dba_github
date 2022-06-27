select schemaname,tablename, 
pg_size_pretty( pg_table_size(schemaname||'.'||tablename)) TABSIZE
from pg_tables
where schemaname = 'public'
order by tablename desc limit +10; 
