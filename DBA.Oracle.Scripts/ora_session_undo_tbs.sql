
SELECT A.INST_ID, A.SID, A.SERIAL#, A.USERNAME, B.USED_UREC USED_UNDO_RECORD, 
B.USED_UBLK USED_UNDO_BLOCKS
FROM GV$SESSION A, GV$TRANSACTION B
WHERE A.SADDR=B.SES_ADDR ;
 