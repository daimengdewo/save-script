USE [test]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[insert_trigger] ON [test].[dbo].[kaoqin]
FOR INSERT
AS
DECLARE @ID varchar(50) ,
@datetime varchar(50) ,
@direction varchar(50) ,
@device varchar(50) ,
@deviceno varchar(50) ,
@name varchar(50) ,
@nbr varchar(50) ,
@date varchar(50) ,
@time varchar(50) 
                                 SELECT @ID =ID, @datetime=datetime, @direction=direction, @device=device, @deviceno=deviceno, @name=name, @nbr=nbr, @date=date, @time=time FROM INSERTED;
                                 BEGIN
                                                 EXEC loopback .test. dbo.insert_kaoqin @ID,@datetime,@direction,@device,@deviceno,@name,@nbr,@date,@time;
                                 END