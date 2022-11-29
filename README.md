# 异构sql数据同步mssql-mysql

#### 介绍

很多年前写的自动化脚本，用于配置异构sql数据同步mssql-mysql，有需要可以拿去用。
#### 使用说明

1.  确保mssql和mysql都有相同结构的表，默认表名称（kaoqin）
2.  修改ygsql_copy.bat里对应的mysql数据库信息
3.  修改sql-login里对应的mysql数据库信息
4.  如果需要修改需要同步的表的名称，必须把这一堆sql表里的对应的表名称都改掉。

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request
