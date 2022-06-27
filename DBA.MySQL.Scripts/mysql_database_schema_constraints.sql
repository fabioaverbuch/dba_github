SELECT Table_Schema ,Table_Name, Constraint_Type ,Constraint_Name
FROM information_schema.table_constraints
WHERE Table_Schema = 'DBName'
ORDER BY Table_Name;


