if exists (select * from master.sys.databases where name='universitatea_new')
drop database universitatea_new;
go
restore database universitatea_new
from disk ='C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Backup\Backup_lab11\exercitiul1.bak'
with move 'universitatea' to 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DataBase_lab11\data.mdf',
move 'universitatea_File2' to 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DataBase_lab11\data1.ndf',
move 'universitatea_File3' to 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DataBase_lab11\data2.ndf',
move 'universitatea_log' to 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DataBase_lab11\log.ldf',
norecovery
go
restore log universitatea_new
from disk = 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Backup\Backup_lab11\exercitiul3.bak'
with norecovery
go
restore database universitatea_new
from disk = 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Backup\Backup_lab11\exercitiul2.bak'
with norecovery 
go