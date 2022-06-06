
mkdir -p /u01/app/oracle/oradata/prodcad1
mkdir -p /u01/app/oracle/admin/prodcad1/adump 
mkdir -p /u01/app/oracle/admin/prodcad1/bdump 
mkdir -p /u01/app/oracle/admin/prodcad1/cdump 
mkdir -p /u01/app/oracle/admin/prodcad1/udump 

export ORACLE_SID=prodcad1
# rman target / nocatalog
STARTUP NOMOUNT PFILE=$ORACLE_HOME/dbs/initprodcad1.ora;

RESTORE CONTROLFILE FROM '/hd-externo/mnt/orabkp/rman/c-3405516148-20210605-00_CTRL.ctl' ;
ALTER DATABASE MOUNT ;
CATALOG START WITH '/hd-externo/mnt/orabkp/rman/' noprompt ;
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

SET ARCHIVELOG DESTINATION TO '/hd-externo/mnt/orabkp/rman/';

RESTORE ARCHIVELOG ALL;

}

nohup rman target / nocatalog @prodcad1_restore.sh & > prodcad1_restore.log

RMAN> ALTER DATABASE OPEN RESETLOGS;
