SELECT GROUP_CONCAT(CONCAT('KILL ',id,';') SEPARATOR ' ') 'KillStatement' 
FROM information_schema.processlist 
WHERE user='Username'; 
