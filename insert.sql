USE [test]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insert_kaoqin]
@ID varchar(50) ,
@datetime varchar(50) ,
@direction varchar(50) ,
@device varchar(50) ,
@deviceno varchar(50) ,
@name varchar(50) ,
@nbr varchar(50) ,
@date varchar(50) ,
@time varchar(50) 
AS
BEGIN
                 SET NOCOUNT ON
                 BEGIN  try
                                insert OPENQUERY(MYSQLTEST,'SELECT * FROM kaoqin')(id,datetime,direction,device,deviceno,name,nbr,date,time) values(@ID,@datetime,@direction,@device,@deviceno,@name,@nbr,@date,@time);
                 END try
                 BEGIN catch
INSERT INTO LogTable values(ERROR_NUMBER(),ERROR_SEVERITY(),ERROR_STATE(),ERROR_PROCEDURE(), ERROR_LINE() ,ERROR_MESSAGE());
                 END catch
                 SET NOCOUNT OFF
END