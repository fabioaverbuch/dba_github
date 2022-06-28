expdp system/or4cl3 directory=dirbkp dumpfile=iso8583_message_cadsp2014.dmp logfile=iso8583_message_cadsp2014.log tables='APPISO8583V2.ISO8583_TRN_MESSAGE' exclude=STATISTICS exclude=INDEX exclude=CONSTRAINT exclude=REF_CONSTRAINT 
QUERY=APPISO8583V2.ISO8583_TRN_MESSAGE:\"WHERE TO_CHAR\(TRM_DATE,\'YYYY\'\) = \'2014\'\" &


