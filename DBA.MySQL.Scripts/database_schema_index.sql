SELECT table_schema, table_name, index_name, seq_in_index, column_name, index_type    
FROM information_schema.statistics 
WHERE table_schema = 'DBName'
ORDER BY table_name, index_name; 
