
select pid as process_id, usename as username, datname as database_name,
client_addr as client_address, application_name, backend_start, state, state_change,query
from pg_stat_activity;
where datname='<db_name>';
