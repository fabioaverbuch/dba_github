SELECT Table_Schema ,Table_Name, Constraint_Type ,Constraint_Name
FROM information_schema.table_constraints
WHERE Table_Schema = 'DBName'
ORDER BY Table_Name;

SELECT Table_Schema,Table_Name,Table_Type,Routine_Type,Routine_Schema,Routine_Name
FROM information_schema.tables
INNER JOIN information_schema.routines ON routines.routine_definition 
LIKE  Concat('%', tables.table_name, '%')
WHERE Table_Schema ='DBName'
ORDER BY Table_Name;


