SELECT table_schema, COUNT(*) AS TotalTableCount,
CONCAT(ROUND(SUM(data_length)/(1024*1024),2),'MB')  AS TotalTableSize,
CONCAT(ROUND(SUM(index_length)/(1024*1024),2),'MB') AS TotalIndexSize,
CONCAT(ROUND(SUM(data_length+index_length)/(1024*1024),2),'MB') TotalSize	
FROM information_schema.TABLES
GROUP BY table_schema
ORDER BY SUM(data_length+index_length) DESC;
