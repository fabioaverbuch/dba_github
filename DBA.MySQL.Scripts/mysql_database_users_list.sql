SELECT user, host, account_locked, password_expired 
FROM mysql.user
ORDER by user asc;
