SELECT A.SID,substr(B.username,1,10) username,substr(B.osuser,1,10) osuser,
substr(B.PROGRAM||B.module,1,15) PROGRAM,substr(B.machine,1,22) machine,
A.event,A.p1,B.sql_hash_value
FROM v$session_wait A,v$session B
WHERE B.SID=A.SID
AND A.event NOT IN('SQL*Net message from client','SQL*Net message to client',
'smon timer','pmon timer')
AND username IS NOT NULL
ORDER BY 6;