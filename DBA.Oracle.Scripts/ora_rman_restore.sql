
mkdir -p /u01/app/oracle/oradata/<ORACLE_SID>
mkdir -p /u01/app/oracle/admin/<ORACLE_SID>/adump 
mkdir -p /u01/app/oracle/admin/<ORACLE_SID>/bdump 
mkdir -p /u01/app/oracle/admin/<ORACLE_SID>/cdump 
mkdir -p /u01/app/oracle/admin/<ORACLE_SID>/udump 

export ORACLE_SID=<ORACLE_SID>
# rman target / nocatalog
STARTUP NOMOUNT PFILE=$ORACLE_HOME/dbs/init<ORACLE_SID>.ora;

RESTORE CONTROLFILE FROM '/mnt/orabkp/rman/c-3405516148-20210605-00_CTRL.ctl' ;
ALTER DATABASE MOUNT ;
CATALOG START WITH '/mnt/orabkp/rman/' noprompt ;
CROSSCHECK BACKUP ;

run {

SQL> sqlplus / as sysdba
SET LINESIZE 500
SET PAGESIZE 2000
SET HEADING OFF

SELECT 'set newname for datafile '||FILE#||' to '''||NAME||''';' FROM V$DATAFILE;

SELECT 'sql "alter database rename file '''''||MEMBER||''''' to '''''||MEMBER||'''''";' FROM V$LOGFILE;

SELECT 'sql "alter database rename file '''''||NAME||''''' to '''''||NAME||'''''";' FROM V$TEMPFILE;


RESTORE DATABASE;

SWITCH DATAFILE ALL;

RECOVER DATABASE;

SET ARCHIVELOG DESTINATION TO '/mnt/orabkp/rman/';

RESTORE ARCHIVELOG ALL;

}

nohup rman target / nocatalog @RESTORE.sh & > RESTORE.log

RMAN> ALTER DATABASE OPEN RESETLOGS;
