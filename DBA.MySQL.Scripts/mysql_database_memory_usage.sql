SELECT *
FROM sys.memory_by_host_by_current_bytes
WHERE host <> 'background'
ORDER BY total_allocated DESC; 

SELECT *
FROM sys.memory_by_user_by_current_bytes
WHERE user <> 'background'
ORDER BY total_allocated DESC;
