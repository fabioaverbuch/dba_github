SELECT IF (@@performance_schema, 'TRUE', 'FALSE') AS 'Performance Schema enabled';

SELECT object_schema, object_name, index_name
FROM sys.schema_unused_indexes
ORDER BY object_schema, object_name, index_name;