ALTER SESSION SET NLS_LANGUAGE = 'BRAZILIAN PORTUGUESE';
ALTER SESSION SET NLS_TERRITORY = 'BRAZIL';
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ',.';
SET LINESIZE 500
SET PAGESIZE 100
SET COLSEP "|"
COLUMN GROUP# FORMAT 999
COLUMN THREAD# FORMAT 99
COLUMN MEMBER FORMAT A70

SELECT LG.GROUP#, LG.THREAD#, LG.STATUS, LF.MEMBER, 
TO_CHAR(LG.BYTES/1024/1024,'999G999') SIZE_MB
FROM GV$LOG LG
INNER JOIN GV$LOGFILE LF ON LG.GROUP# = LF.GROUP#
ORDER BY LG.GROUP#, LG.THREAD#; 
