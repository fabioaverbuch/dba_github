SET LINESIZE 1000 
SET PAGESIZE 0 
SET FEEDBACK OFF 
SET TRIMSPOOL ON
WITH 
HWM AS (SELECT /*+ MATERIALIZE */ KTFBUESEGTSN TS#,KTFBUEFNO RELATIVE_FNO,MAX(KTFBUEBNO+KTFBUEBLKS-1) HWM_BLOCKS
FROM SYS.X$KTFBUE GROUP BY KTFBUEFNO,KTFBUESEGTSN),
HWMTS AS (SELECT NAME TABLESPACE_NAME,RELATIVE_FNO,HWM_BLOCKS
FROM HWM JOIN V$TABLESPACE USING(TS#)),
HWMDF AS (SELECT FILE_NAME,NVL(HWM_BLOCKS*(BYTES/BLOCKS),5*1024*1024) HWM_BYTES,BYTES,AUTOEXTENSIBLE,MAXBYTES
FROM HWMTS RIGHT JOIN DBA_DATA_FILES USING(TABLESPACE_NAME,RELATIVE_FNO))
SELECT
CASE WHEN AUTOEXTENSIBLE='YES' AND MAXBYTES >= BYTES
 THEN 'ALTER DATABASE DATAFILE '''||FILE_NAME||''' RESIZE '||CEIL(HWM_BYTES/1024/1024)||'M;'
END SQL
FROM HWMDF
WHERE BYTES-HWM_BYTES > 1024*1024 
ORDER BY BYTES-HWM_BYTES DESC;
