select pg_terminate_backend(pid) 
from pg_stat_activity where usename='<db_name>'
AND pid <> pg_backend_pid();

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = '<db_name>'
AND pid <> pg_backend_pid()
AND state in ('idle', 'idle in transaction', 'idle in transaction (aborted)', 'disabled') 
AND state_change < current_timestamp - INTERVAL '15' MINUTE;
