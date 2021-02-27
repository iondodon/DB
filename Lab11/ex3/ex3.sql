go
exec sp_addumpdevice 'DISK', 'backup_Log', 
			'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Backup\Backup_lab11\exercitiul3.bak'
go
backup LOG universitatea to backup_Log
go