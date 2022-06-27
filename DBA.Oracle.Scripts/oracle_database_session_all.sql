ALTER SESSION SET NLS_LANGUAGE = 'BRAZILIAN PORTUGUESE';
ALTER SESSION SET NLS_TERRITORY = 'BRAZIL';
SET LINESIZE 300
COLUMN MACHINE  FORMAT A30
COLUMN USERNAME FORMAT A20
COLUMN OSUSER   FORMAT A20
COLUMN PROGRAM  FORMAT A20
COLUMN MODULE   FORMAT A20


SELECT TO_CHAR(S.LOGON_TIME,'DD/MM/YY HH24:MI') LOGON_TIME, S.STATUS,S.OSUSER, S.USERNAME, S.MACHINE, S.PROGRAM, S.MODULE,
'ALTER SYSTEM KILL SESSION '''||S.SID||',' || S.SERIAL#||',@'||S.INST_ID||''' IMMEDIATE;' CMD_KILLSESSION,
'EXEC RDSADMIN.RDSADMIN_UTIL.KILL('||S.SID||','||S.SERIAL#||','||''''||'IMMEDIATE'||''''||');' AWS_KILLSESSION
FROM GV$SESSION S 
WHERE S.USERNAME IS NOT NULL 
AND S.USERNAME NOT IN ('OGGUSERCAD','OGGUSER','SYS')
ORDER BY LOGON_TIME;

SELECT TO_CHAR(S.LOGON_TIME,'DD/MM/YY HH24:MI') LOGON_TIME, S.STATUS,S.OSUSER, S.USERNAME, S.MACHINE, S.PROGRAM, S.MODULE,
'ALTER SYSTEM KILL SESSION '''||S.SID||',' || S.SERIAL#||',@'||S.INST_ID||''' IMMEDIATE;' CMD_KILLSESSION,
'EXEC RDSADMIN.RDSADMIN_UTIL.KILL('||S.SID||','||S.SERIAL#||','||''''||'IMMEDIATE'||''''||');' AWS_KILLSESSION
FROM GV$SESSION S 
WHERE S.OSUSER = 'ApiMonitoring' AND S.STATUS = 'INACTIVE'
ORDER BY LOGON_TIME;

SELECT S.MACHINE, S.USERNAME, S.OSUSER, S.PROGRAM , S.MODULE , COUNT(*) SESSIONS
FROM GV$SESSION S 
WHERE S.USERNAME IS NOT NULL 
AND  S.OSUSER NOT IN ('oracle','zabbix')
GROUP BY S.MACHINE, S.USERNAME, S.OSUSER, S.PROGRAM, S.MODULE
ORDER BY S.MACHINE, S.USERNAME, S.OSUSER, S.PROGRAM, S.MODULE;