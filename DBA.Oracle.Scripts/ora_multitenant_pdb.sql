-- Open/close all the pluggable db:
-- Connect to root container:
alter pluggable database all open;
alter pluggable database all close immediate;

-- Stop/start a pluggable db:
alter session set container=PDB1;
startup
Pluggable Database opened.
shutdown
Pluggable Database closed.

SELECT DBID,NAME,OPEN_MODE,TOTAL_SIZE/1024/1024 FROM V$PDBS;

SELECT NAME, CON_ID, DBID, CON_UID, GUID FROM V$CONTAINERS;

-- Need to run from root container;

SQL> show con_name

CON_NAME
------------------------
CDB$ROOT

ALTER PLUGGABLE DATABASE PDB1 CLOSE IMMEDIATE;

DROP PLUGGABLE DATABASE PDB1 INCLUDING DATAFILE;







