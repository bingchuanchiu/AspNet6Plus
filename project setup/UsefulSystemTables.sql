select * from syscolumns
where name ='permission_id'
order by name desc

select * from systypes
order by name desc

select * from sysobjects
where NAME = 'Permissions'
order by name desc

select * from INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE
where TABLE_NAME = 'Permissions'

select * from INFORMATION_SCHEMA.KEY_COLUMN_USAGE
where TABLE_NAME = 'Permissions'