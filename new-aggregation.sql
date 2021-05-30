exec sp_addlinkedserver
@server='mysqltest' , --ODBC里面data source name
@srvproduct='mysqltest' , --自己随便
@provider='MSDASQL' , --固定这个
@datasrc='mysqltest',
@location=NULL,
@provstr=NULL,
@catalog = NULL