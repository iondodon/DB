if exists (select * from master.dbo.sysdevices where name='device01')
exec sp_dropdevice 'device01' , 'delfile';
exec sp_addumpdevice 'DISK', 'device01',
			'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Backup\Backup_lab11\exercitiul1.bak'
go 
backup database universitatea
to device01 with format,
name = N'universitatea-Full Database Backup'
go