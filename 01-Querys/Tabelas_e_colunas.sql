select 
	 t1.object_id
    ,t2.name
	,t1.name
	,t1.column_id
	,t1.max_length
	,t1.collation_name
	,t1.is_nullable
	,t2.create_date
	,t2.modify_date
from sys.columns t1

join  sys.tables t2
on( t1.object_id = t2.object_id )
order by t1.object_id , t1.name
