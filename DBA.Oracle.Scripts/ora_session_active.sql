SET ECHO OFF
SET LINESIZE 95
SET HEAD ON
SET FEEDBACK ON
COL SID HEAD "sid" FORM 9999 TRUNC
COL serial# FORM 99999 TRUNC HEAD "ser#"
COL username FORM a8 TRUNC
COL osuser FORM a7 TRUNC
COL machine FORM a20 TRUNC HEAD "client|machine"
COL PROGRAM FORM a50 TRUNC HEAD "client|program"
COL login FORM a11
COL "last call" FORM 9999999 TRUNC HEAD "last call|in secs"
COL status FORM a6 TRUNC
SELECT SID,serial#,substr(username,1,10) username,substr(osuser,1,10) osuser,
substr(PROGRAM||module,1,50) PROGRAM,substr(machine,1,22) machine,
to_char(logon_time,'dd/mm/yy hh24:mi') login,
last_call_et "last call",status
FROM gv$session WHERE status='ACTIVE'
ORDER BY 1;