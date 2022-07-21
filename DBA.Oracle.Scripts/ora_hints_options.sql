
INDEX: use the specified index for the related table. If your query is not using the Index, you can use this hint to force using it.

FULL:  it is used for a full table scan

PARALLEL: Use parallelism for the related table. You can use this hint especially for the large tables and high load SQL Statements.

USE_NL : Use the Nested loop join for the specified table, If a large table is joined with a small table.

USE_HASH:  Use the Hash join for the specified table, If a large table is joined with a large table.

ALL_ROWS: Selects All Rows for the best throughput.

FIRST_ROWS(n) : it is used to optimize an individual SQL statement for fast response.

CLUSTER:  it is used for using a cluster scan

HASH: it is used for using a hash scan

NO_INDEX: it is used for not allowing indexes usage.

APPEND: it is used for direct-path INSERT

NOAPPEND : it is used for regular INSERT

