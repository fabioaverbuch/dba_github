select pg_tablespace.spcname, pg_size_pretty(pg_tablespace_size(spcname)) AS TBLSPACESIZE
from pg_tablespace order by TBLSPACESIZE;
