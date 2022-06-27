SELECT group_concat(concat('kill ',id,';') separator ' ') 'KillStatement' 
FROM information_schema.processlist 
WHERE user='Username'; 
