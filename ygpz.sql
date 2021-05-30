USE [master]
GO
EXEC master .dbo. sp_serveroption @server =N'MYSQLTEST' , @optname= N'rpc out', @optvalue=N'TRUE'
GO
EXEC master .dbo. sp_serveroption @server =N'MYSQLTEST' , @optname= N'remote proc transaction promotion', @optvalue =N'false'
GO

EXEC sp_addlinkedserver @server = N'loopback' , @srvproduct = N' ' , @provider = N'SQLNCLI',
@datasrc = @@SERVERNAME
go

USE [master]
GO
EXEC master .dbo. sp_serveroption @server =N'loopback', @optname= N'rpc out', @optvalue=N'TRUE'
GO
EXEC master .dbo. sp_serveroption @server =N'loopback', @optname= N'remote proc transaction promotion' , @optvalue=N'false'
GO


