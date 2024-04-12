select db_name() as database_name
    ,table_name = sysobjects.name
    ,column_name = syscolumns.name
    ,datatype = systypes.name
    ,length = syscolumns.length	
from sysobjects
inner join syscolumns on sysobjects.id = syscolumns.id
inner join systypes on syscolumns.xtype = systypes.xtype
where sysobjects.xtype = 'U'
and sysobjects.name = 'Permissions'
order by sysobjects.name
    ,syscolumns.colid


	SELECT tbl.*
	FROM INFORMATION_SCHEMA.COLUMNS as tbl
	where tbl.TABLE_NAME = 'Permissions'



select distinct
tbl.TABLE_CATALOG as 'database_name',
tbl.TABLE_NAME as 'table_name'
/*tbl.COLUMN_NAME as 'column_name',
tbl.DATA_TYPE as 'column_data_type',
tbl.IS_NULLABLE as 'column_nullable',
(CASE 
	WHEN tbl.CHARACTER_MAXIMUM_LENGTH IS NOT NULL THEN tbl.CHARACTER_MAXIMUM_LENGTH
	WHEN tbl.DATETIME_PRECISION IS NOT NULL THEN tbl.DATETIME_PRECISION
	ELSE tbl.NUMERIC_SCALE -- POSSIBLE INDEX
END) as 'column_length'*/
 FROM INFORMATION_SCHEMA.COLUMNS as tbl
WHERE tbl.TABLE_NAME != 'sysdiagrams'


(select distinct 
tbl.TABLE_NAME + '_Read' as 'read_code'  , 
tbl.TABLE_NAME + ' Read' as 'read_display'  , 
tbl.TABLE_NAME + '_Write' as 'write_code',
tbl.TABLE_NAME + ' Write' as 'write_display',
tbl.TABLE_NAME +'_Update' as 'update_code',
tbl.TABLE_NAME +' Update' as 'update_display',
tbl.TABLE_NAME +'_Delete' as 'delete_code',
tbl.TABLE_NAME +' Delete' as 'delete_display'
FROM INFORMATION_SCHEMA.COLUMNS as tbl 
WHERE tbl.TABLE_NAME != 'sysdiagrams')
