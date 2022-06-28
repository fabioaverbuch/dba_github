
ALL Grants all privileges to specified user except the GRANT OPTION.
ALTER Allows user to ALTER TABLE.
ALTER ROUTINE Allows user to alter or drop stored routines.
CREATE Allows user to execute the CREATE TABLE command.
CREATE ROUTINE Allows user to create stored routines.
CREATE TEMPORARY TABLES Allows user to execute the CREATE TEMPORARY TABLE command.
CREATE USER Allows user to execute CREATE USER, DROP USER, RENAME USER and REVOKE ALL PRIVILEGES statements for user creation. 
CREATE VIEW Allows user to execute the CREATE VIEW command to create views.
DELETE Allows user to execute the DELETE command.
DROP Allows user to execute the DROP command.
EXECUTE Allows user to run stored routines.
FILE Allows user to execute both SELECT INTO OUTFILE and LOAD DATA INFILE.
GRANT OPTION Allows user to grant other users privileges.
INDEX Allows user to execute CREATE INDEX and DROP INDEX
INSERT Allows user to execute the INSERT command.
LOCK TABLES Allows user to execute LOCK TABLES (user must also have SELECT privileges on the table).
PROCESS Allows user to see all processes when executing SHOW PROCESSLIST.
REFERENCES This privilege is not currently implemented.
RELOAD Allows user to execute FLUSH.
REPLICATION CLIENT Allows user to execute both SHOW MASTER STATUS and SHOW SLAVE STATUS commands.
REPLICATION SLAVE Needed by the replication slave to read binary logs from the master.
SELECT Allows users to execute SELECT statement.
SHOW DATABASES When user executes SHOW DATABASES command will return a list of all databases.
SHOW VIEW Allows user to execute the SHOW CREATE VIEW command.
SHUTDOWN Allows user to execute ’mysqladmin shutdown’.
SUPER Allows user to execute CHANGE MASTER, KILL, PURGE MASTER LOGS, and SET GLOBAL commands. Also will allow user to always connect even if max_connections has been reached.
UPDATE Allows user to execute UPDATE command
USAGE Allows user to connect
