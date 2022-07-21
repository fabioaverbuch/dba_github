SELECT B.TABLESPACE, round(((B.BLOCKS*P.VALUE)/1024/1024),2)||'M' AS temp_size,
A.inst_id AS INSTANCE, A.SID||','||A.serial# AS sid_serial,
nvl(A.username, '(oracle)') AS username, A.PROGRAM, A.status, A.sql_id
FROM gv$session A, gv$sort_usage B, gv$parameter P
WHERE P.NAME = 'db_block_size'
AND A.saddr = B.session_addr
AND A.inst_id=B.inst_id
AND A.inst_id=P.inst_id
ORDER BY temp_size DESC ;
