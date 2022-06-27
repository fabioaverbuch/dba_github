select pg_database.datname, pg_size_pretty(pg_database_size(datname)) AS DBSIZE
from pg_database;

SELECT pg_database.datname as "database_name", pg_database_size(pg_database.datname)/1024/1024 AS size_mb
FROM pg_database ORDER by size_mb DESC;