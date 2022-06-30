select s.sid,sn.SERIAL#,n.name, round(value/1024/1024,2) redo_mb, sn.username,sn.status,substr (sn.program,1,21) "program", sn.type, sn.module,sn.sql_id
from v$sesstat s join v$statname n on n.statistic# = s.statistic#
join v$session sn on sn.sid = s.sid where n.name like 'redo size' and s.value!=0 
order by redo_mb desc;
 
