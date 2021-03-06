SELECT * FROM (
 SELECT 'THE COLUMN ' || C.NAME || ' OF THE TABLE ' || US.NAME || '.' || O.NAME || ' WAS USED ' || 
U.EQUALITY_PREDS || ' TIMES IN AN EQUALITY PREDICATE AND ' || U.EQUIJOIN_PREDS || ' TIMES IN AN EQUIJOIN PREDICATE AND IS NOT INDEXED' AS COLUM_TO_INDEX
FROM SYS.COL_USAGE$ U, SYS.OBJ$ O, SYS.COL$ C, SYS.USER$ US
WHERE U.OBJ# = O.OBJ#  AND  U.OBJ# = C.OBJ#  AND  US.USER# = O.OWNER# AND U.INTCOL# = C.COL#
AND   US.NAME='&SCHEMA_NAME' AND  C.NAME NOT IN (SELECT COLUMN_NAME FROM DBA_IND_COLUMNS WHERE INDEX_OWNER ='&SCHEMA_NAME')
AND  (U.EQUALITY_PREDS > 100 OR U.EQUIJOIN_PREDS > 100)
ORDER BY U.EQUALITY_PREDS+U.EQUIJOIN_PREDS DESC);
