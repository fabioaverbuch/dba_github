
EXPLAIN PLAN SET STATEMENT_ID = '<STATEMENT_NAME>' FOR SELECT ....

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY('PLAN_TABLE','<STATEMENT_NAME>','BASIC | TYPICAL | SERIAL | ALL'));
									   
BASIC ..... displays minimum information
TYPICAL ... displays most relevant information
SERIAL .... like TYPICAL but without parallel information
ALL ....... displays all information
									   
DBMS_XPLAN.DISPLAY.DISPLAY_CURSOR
Display from GV$SQL_PLAN (or GV$SQL_PLAN_STATISTICS_ALL)
									   
DBMS_XPLAN.DISPLAY_PLAN
Return the last plan, or a named plan, explained as a CLOB

DBMS_XPLAN.DISPLAY_SQLSET
Format and display the contents of the execution plan of statements stored in a SQL tuning set
									   
DBMS_XPLAN.DISPLAY_SQL_PLAN_BASELINE
Displays one or more execution plans for the specified sql_handle of a SQL statement
									   
DBMS_XPLAN.DISPLAY_WORKLOAD_REPOSITORY
Display from AWR								   


