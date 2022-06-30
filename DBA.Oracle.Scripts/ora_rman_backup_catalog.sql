1. Create user and grant privs

CREATE USER rman IDENTIFIED BY catpwd
TEMPORARY TABLESPACE temp
DEFAULT TABLESPACE users
QUOTA UNLIMITED ON users; 

SQL> GRANT RECOVERY_CATALOG_OWNER TO rman;

2. Create Recovery Catalog

rman catalog rman/catpwd

RMAN> create catalog;

3. Register catalog database with target database

rman target sys/sys@w148p catalog rman/catpwd@catdb

RMAN> REGISTER DATABASE;

4. Verify registration

RMAN> REPORT SCHEMA;


5. Query RMAN CATALOG
Run below query on target database

col OBJECT_TYPE for a20
col status for a15
set lines 180
select db_name, object_type, status, 
round((end_time - start_time) * 24 * 60, 2) duration_minutes,  
to_char(start_time, 'mm/dd/yyyy hh:mi:ss') start_time, 
to_char(end_time, 'mm/dd/yyyy hh:mi:ss') end_time,
round((input_bytes/(1024*1024*1024)),2) input_gb, 
round((output_bytes/(1024*1024*1024)),2) output_gb
from rc_rman_status
where operation = 'BACKUP';

Run as catalog user

set lines 80
set pages 250
ttitle "Daily Backup........"
select DB NAME,dbid,
NVL(TO_CHAR(max(backuptype_db),'DD/MM/YYYY HH24:MI'),'01/01/0001:00:00') DBBKP,
NVL(TO_CHAR(max(backuptype_arch),'DD/MM/YYYY HH24:MI'),'01/01/0001:00:00') ARCBKP
from (
select a.name DB,dbid,
decode(b.bck_type,'D',max(b.completion_time),'I',
max(b.completion_time)) BACKUPTYPE_db,
decode(b.bck_type,'L',
max(b.completion_time)) BACKUPTYPE_arch
from rc_database a,bs b
where a.db_key=b.db_key
and b.bck_type is not null
and b.bs_key not in(Select bs_key from rc_backup_controlfile
where AUTOBACKUP_DATE is not null or AUTOBACKUP_SEQUENCE is not null)
and b.bs_key not in(select bs_key from rc_backup_spfile)
group by a.name,dbid,b.bck_type
) group by db,dbid
ORDER BY least(to_date(DBBKP,'DD/MM/YYYY HH24:MI'),
to_date(ARCBKP,'DD/MM/YYYY HH24:MI'));
		


