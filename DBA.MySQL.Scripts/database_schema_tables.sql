SELECT 	Table_schema,table_name, ROUND(((data_length + index_length) / 1024 / 1024), 2) AS SizeMB, 
engine, table_rows,  auto_increment, create_time, update_time
FROM information_schema.tables
WHERE table_schema = 'DBName'
ORDER BY SizeMB desc;
 