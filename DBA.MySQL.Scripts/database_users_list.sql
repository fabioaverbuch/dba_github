select user,host,account_locked,password_expired 
from mysql.user
order by user asc;
