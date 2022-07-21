
EXPLAIN PLAN SET STATEMENT_ID = '<STATEMENT_NAME>' FOR SELECT ....

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY('PLAN_TABLE','<STATEMENT_NAME>','BASIC | TYPICAL | SERIAL | ALL'));
									   
									   
BASIC: Exibe o minimo de informações sobre o plano de execução: O ID da operação, o nome da operação e o nome do objeto que será tratado pela operação.

TYPICAL: Exibe as informações mais relevantes do plano de execução, se o parâmetro “Format” for omitido (null) esse será o valor considerado. 

SERIAL: Exibe quase as mesmas informações que o formato “Typical” com exceção das informações das operações de paralelismo que serão omitidas mesmo que o plano utilize o paralelismo na sua execução.
									   
ADVANCED: Exibe as mesmas informações que o formato “Typical” e inclui algumas sessões de informações não estatísticas sobre o plano de execução.
									   
									   
									   
MEMSTATS: Exibe estatística referente a estimativa da quantidade de espaço a ser utilizado na PGA para operações de SORT, HASH JOIN, BITMAP MERGE ou BITMAP CREATE. 

IOSTATS: Exibe estatísticas referentes as operações de “IO” executadas para um determinado plano de execução. 

ALLSTATS: Exibe todas as informações estatísticas fornecidas por MEMSTATS e IOSTATS.
									   

									   
LAST: Se for informada a palavra chave LAST serão exibidos valores estatísticos somente da ultima execução. 

ALL: Essa palavra chave permite que sejam exibidas sessões adicionais (Query Block Name e Column Projection) de informações não estatísticas que aparecem logo após o plano de execução. 

 
