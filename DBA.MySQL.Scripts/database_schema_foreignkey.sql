SELECT referenced_table_schema AS ParentSchema, referenced_table_name AS ParentTable, referenced_column_name AS ParentColumn,
constraint_name AS ConstraintName, table_schema AS ChildSchema, table_name AS ChildTable
 FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE constraint_name != 'PRIMARY' AND referenced_table_schema = 'DBName'
ORDER BY referenced_table_name;
 
