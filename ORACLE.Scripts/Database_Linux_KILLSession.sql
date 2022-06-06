kill -9 $(ps -ef | grep LOCAL=NO | grep oracle$ORACLE_SID | awk '{print $2}')
