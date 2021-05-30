chcp 65001

if "%PROCESSOR_ARCHITECTURE%"=="x86" goto x86
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto x64
exit

:x64
mkdir C:\mysql-odbc
xcopy %~dp0mysql-odbc-winx64 C:\mysql-odbc /s /e /h

cd C:\mysql-odbc
copy   lib\myodbc8S.dll    c:\Windows\System32
copy   lib\myodbc8S.lib    c:\Windows\System32
copy   lib\myodbc8a.dll   c:\Windows\System32
copy   lib\myodbc8a.lib   c:\Windows\System32
call Install.bat

@odbcconf.exe /a {CONFIGDSN "MySQL ODBC 8.0 ANSI Driver" "DSN=mysqltest|SERVER=112.74.181.232|Port=3306|User=new|Password=new|Database=new"} 
@odbcconf.exe /a {CONFIGSYSDSN "MySQL ODBC 8.0 ANSI Driver" "DSN=mysqltest|SERVER=112.74.181.232|Port=3306|User=new|Password=new|Database=new"} 

sqlcmd -S 127.0.0.1 -d test -U sa -P Jie199510 -i %~dp0new-aggregation.sql
sqlcmd -S 127.0.0.1 -d test -U sa -P Jie199510 -i %~dp0sql-login.sql
sqlcmd -S 127.0.0.1 -d test -U sa -P Jie199510 -i %~dp0ygpz.sql
sqlcmd -S 127.0.0.1 -d test -U sa -P Jie199510 -i %~dp0insert.sql
sqlcmd -S 127.0.0.1 -d test -U sa -P Jie199510 -i %~dp0insert-cfq.sql
sqlcmd -S 127.0.0.1 -d test -U sa -P Jie199510 -i %~dp0updata.sql
sqlcmd -S 127.0.0.1 -d test -U sa -P Jie199510 -i %~dp0updata-cfq.sql
sqlcmd -S 127.0.0.1 -d test -U sa -P Jie199510 -i %~dp0delete.sql
sqlcmd -S 127.0.0.1 -d test -U sa -P Jie199510 -i %~dp0delete-cfq.sql
exit

:x86
mkdir C:\mysql-odbc
xcopy %~dp0mysql-odbc-win32 C:\mysql-odbc /s /e /h

cd C:\mysql-odbc
copy   lib\myodbc8S.dll    c:\Windows\System32
copy   lib\myodbc8S.lib    c:\Windows\System32
copy   lib\myodbc8a.dll   c:\Windows\System32
copy   lib\myodbc8a.lib   c:\Windows\System32
call Install.bat

@odbcconf.exe /a {CONFIGDSN "MySQL ODBC 8.0 ANSI Driver" "DSN=mysqltest|SERVER=112.74.181.232|Port=3306|User=new|Password=new|Database=new"} 
@odbcconf.exe /a {CONFIGSYSDSN "MySQL ODBC 8.0 ANSI Driver" "DSN=mysqltest|SERVER=112.74.181.232|Port=3306|User=new|Password=new|Database=new"} 

sqlcmd -S 127.0.0.1 -d test -U sa -P Jie199510 -i %~dp0new-aggregation.sql
sqlcmd -S 127.0.0.1 -d test -U sa -P Jie199510 -i %~dp0sql-login.sql
sqlcmd -S 127.0.0.1 -d test -U sa -P Jie199510 -i %~dp0ygpz.sql
sqlcmd -S 127.0.0.1 -d test -U sa -P Jie199510 -i %~dp0insert.sql
sqlcmd -S 127.0.0.1 -d test -U sa -P Jie199510 -i %~dp0insert-cfq.sql
sqlcmd -S 127.0.0.1 -d test -U sa -P Jie199510 -i %~dp0updata.sql
sqlcmd -S 127.0.0.1 -d test -U sa -P Jie199510 -i %~dp0updata-cfq.sql
sqlcmd -S 127.0.0.1 -d test -U sa -P Jie199510 -i %~dp0delete.sql
sqlcmd -S 127.0.0.1 -d test -U sa -P Jie199510 -i %~dp0delete-cfq.sql
exit