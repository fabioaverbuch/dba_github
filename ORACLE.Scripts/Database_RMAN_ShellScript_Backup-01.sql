#!/bin/bash
. /home/oracle/.bash_profile

export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=/u01/app/oracle/product/10.2.0/db_1
export ORACLE_SID=prodcad1
export DB_NAME=PRODCAD

export DIRBKP=/storage4/${DB_NAME}
export DIRLOG=/storage4/${DB_NAME}

export NLS_DATE_FORMAT='dd/mm/yyyy hh24:mi'
export DATHOR=`date +%H%M`
export DATAMD=`date +%Y%m%d`
export NAMLOG=${DB_NAME}_FULL_${DATAMD}_${DATHOR}.log

(

echo "${DB_NAME} - RMAN FULL Start - `date '+%d/%m/%Y %H:%M'`"
SECINI=`date +%s`

rman target /<<EOF_RMAN

run {
     crosscheck backup device type disk;
     crosscheck copy device type disk;
     crosscheck archivelog all device type disk;
     delete noprompt expired backup device type disk;
     delete noprompt archivelog until time 'SYSDATE-1';
     delete noprompt obsolete device type disk;
}

run {
allocate channel c1 type disk maxpiecesize 10G;
change archivelog all crosscheck;
backup as backupset database # not backed up
        FORMAT '${DIRBKP}/%d_FULL_%T_${DATHOR}_%p_%s.bkp'
        TAG '${DB_NAME}_FULL_${DATAMD}_${DATHOR}';
}

run {
change archivelog all crosscheck;
allocate channel c1 type disk maxpiecesize 10G;
backup as backupset archivelog all not backed up 1 times
        FORMAT '${DIRBKP}/%d_ARCH_%T_${DATHOR}_%p_%s.bkp'
        TAG '${DB_NAME}_ARCH_${DATAMD}_${DATHOR}' delete all input;
}

EOF_RMAN

echo "${DB_NAME} - RMAN FULL End- `date '+%d/%m/%Y %H:%M'`"

) | tee ${DIRLOG}/${NAMLOG}

exit 0
 
