exec sp_addlinkedsrvlogin
@rmtsrvname='mysqltest' ,----ODBC里面data source name
@useself='false' ,
@rmtuser='new' ,---mysql账号
@rmtpassword='new' ;--mysql账号其密码