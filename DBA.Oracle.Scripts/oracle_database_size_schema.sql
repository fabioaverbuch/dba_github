
ALTER SESSION SET NLS_LANGUAGE = 'BRAZILIAN PORTUGUESE';
ALTER SESSION SET NLS_TERRITORY = 'BRAZIL';
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ',.';
SET LINESIZE 300

COLUMN OWNER FORMAT A15

SELECT SG.OWNER, TO_CHAR(SG.SIZEMB,'999G999G999') SIZE_MB
FROM (SELECT OWNER, SUM(BYTES)/1024/1024 SIZEMB
FROM DBA_SEGMENTS 
WHERE OWNER LIKE ('APP%')
AND SEGMENT_TYPE IN ('TABLE','INDEX')
GROUP BY OWNER) SG
ORDER BY SG.SIZEMB DESC;

COLUMN OWNER FORMAT A15
COLUMN SEGMENT_NAME FORMAT A30
COLUMN SEGMENT_TYPE FORMAT A10

SELECT SG.OWNER||'.'||SG.SEGMENT_NAME OBJECT_NAME, SG.SEGMENT_TYPE, SG.TABLESPACE_NAME, TO_CHAR(SG.SIZEMB,'999G999G999') SIZE_MB
FROM (SELECT OWNER, SEGMENT_TYPE, SEGMENT_NAME, TABLESPACE_NAME, SUM(BYTES)/1024/1024 SIZEMB
FROM DBA_SEGMENTS
WHERE OWNER IN ('APPRIOCARD') AND SEGMENT_TYPE IN ('TABLE','INDEX')
GROUP BY OWNER, SEGMENT_TYPE, SEGMENT_NAME, TABLESPACE_NAME) SG
ORDER BY SG.SIZEMB DESC;