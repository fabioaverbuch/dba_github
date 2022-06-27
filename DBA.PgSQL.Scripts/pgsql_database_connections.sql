select datname,datallowconn,datconnlimit from pg_database where datname='<db_name>';

SELECT count(distinct(numbackends)) FROM pg_stat_database ; 


alter database <db_name> connection limit 100;


