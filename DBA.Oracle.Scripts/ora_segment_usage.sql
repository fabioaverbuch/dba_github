COL SID FORMAT 999999
COL SPID FORMAT A6
COL TABLESPACE FORMAT A10
COL USERNAME FORMAT A25
COL NOEXTS FORMAT 9999 HEAD EXTS
COL PROGINFO FORMAT A25 TRUNC
COL MBUSED FORMAT 999,999.90
COL STATUS FORMAT A1 TRUNC
SET VERIFY OFF
SELECT * FROM (
SELECT S.SID,
S.STATUS,
B.SPID,
S.SQL_HASH_VALUE SESSHASH,
U.SQLHASH SORTHASH,
S.USERNAME,
U.TABLESPACE,
SUM(U.BLOCKS*P.VALUE/1024/1024) MBUSED ,
SUM(U.EXTENTS) NOEXTS,
U.SEGTYPE,
S.MODULE || ' - ' || S.PROGRAM PROGINFO
FROM V$SORT_USAGE U, V$SESSION S, V$PARAMETER P, V$PROCESS B
WHERE U.SESSION_ADDR = S.SADDR
AND P.NAME = 'db_block_size'
AND B.ADDR = S.PADDR
GROUP BY S.SID,S.STATUS,B.SPID,S.SQL_HASH_VALUE,U.SQLHASH,S.USERNAME,U.TABLESPACE,
U.SEGTYPE,
S.MODULE || ' - ' || S.PROGRAM
ORDER BY 8 DESC,4)
WHERE ROWNUM < 11; 
