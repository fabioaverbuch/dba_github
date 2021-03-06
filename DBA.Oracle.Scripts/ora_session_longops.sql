ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';

SELECT S.MACHINE, 
TO_CHAR(L.START_TIME,'DD/MM/YY HH24:MI') START_TIME,
TO_CHAR(SYSDATE,'DD/MM/YY HH24:MI') CURRENT_TIME,
L.ELAPSED_SECONDS, S.USERNAME, S.OSUSER, S.PROGRAM, L.TARGET, L.OPNAME, A.SQL_TEXT,
'ALTER SYSTEM KILL SESSION '''||S.SID||',' || S.SERIAL#||',@'||S.INST_ID||''' IMMEDIATE;' ORA_KILLSESSION,
'EXEC RDSADMIN.RDSADMIN_UTIL.KILL('||S.SID||','||S.SERIAL#||','||''''||'IMMEDIATE'||''''||');' AWS_KILLSESSION
FROM GV$SESSION_LONGOPS L
INNER JOIN GV$SESSION S ON L.TOTALWORK != L.SOFAR AND L.SID=S.SID
INNER JOIN GV$SQLAREA A ON S.SQL_ADDRESS = A.ADDRESS AND S.SQL_HASH_VALUE=A.HASH_VALUE
ORDER BY L.ELAPSED_SECONDS DESC;


